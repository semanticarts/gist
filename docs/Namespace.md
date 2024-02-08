# The Ontology Namespace vs the Ontology IRI

Welcome to the `gist` namespace.

You requested [https://w3id.org/semanticarts/ns/ontology/gist](https://w3id.org/semanticarts/ns/ontology/gist), which is the gist namespace.

You may have been looking for the gist ontology; if so, you can find it at
[https://w3id.org/semanticarts/ontology/gistCore](https://w3id.org/semanticarts/ontology/gistCore)
(which you can click on or copy and paste into your ontology editing
tool).

gistCore is the set of 140 or so classes and roughly the same number
of properties that define our minimalist enterprise upper ontology.
We have other ontologies in house, that may eventually become publicly
available, that cover extensions to this core, both horizontally (HR and
Accounting) and vertically (Professional Services, Healthcare). These
other ontologies have different names but share the gist namespace.

If you're wondering why the namespace isn't the same as the ontology IRI,
and therefore why it didn't return the ontology, read on.

## The Difference Between Namespaces and Ontologies

The namespace is the contextual qualifier that assures that ontological
terms (and indeed all identifiers in an RDF knowledge graph) are unique.
The ontology IRI identifies a bag of triples, also called axioms, often
historically contained in a file.

The reason these two terms are so often conflated is that most ontology
editing tools will provide both as a convenient default and will make both
the same. When you're just screwing around learning ontology authoring
and building toy apps, this collapsing of the two terms is mostly benign.

It turns out that applying this default behavior to production systems is
an anti-pattern. There are several issues that converge to make this an
anti-pattern, which we describe below.

## Namespace prefixes

The prefix (for instance `owl:` or `gist:`) is just a local shortcut or abbreviation
for ontology or query writing. You can see this on the top of ontology
or query files, some declarations like:

`@prefix owl: <http://www.w3.org/2002/07/owl#> .`

In the background the system always expands these shortcuts.

## The default namespace

Most ontology editing tools allow the use of a "default" namespace. If
you do not add a prefix to terms you are using, the system will assume
you meant the default, which by default is the name of the ontology
itself. This is the root of the confusion.

We advocate not using a default namespace. Much better to be explicit,
and as we'll see, explicitness encourages (or at least doesn't obscure)
reusing other terms that may have been minted elsewhere.

## Minting IRIs

The person or system that first defines a term or creates an identifier
for a real world instance is said to have "minted" the identifier. It
mints it within a namespace. It should be a namespace you have
control over. Minting an IRI in someone else's namespace is called
"namespace squatting." Not only is it poor form, it doesn't really
accomplish anything. If you decide to mint an IRI in the gist
namespace, no one else will know this happened. You will be shouting
in a well.

Virtually all ontologies and RDF-based triple stores mint IRIs in
namespaces they control, and 99%+ of these are based on domain names
that they either control or have been granted permission to use.

For over a decade, the gist namespace was `http://ontologies.semanticarts.com/gist#`
and later `https://ontologies.semanticarts.com/gist/`. Both of these namespaces
are based on the domain name `semanticarts.com`, which Semantic Arts owns.

We recently migrated to the namespace `https://w3id.org/semanticarts/ns/ontology/gist/`.
This is essentially a path within the domain name `w3id.org`, whose owners
have given us exclusive control over. When we mint new terms, we will do so
in this namespace.

## An ontology needn't have any IRIs minted it its "own" namespace

To cement the idea that the ontology need not have a 1:1 coorespondence to
its namespace, consider the following legitimate ontology.

```bash
 1  @prefix sa: <https://ontologies.semanticarts.com/SemArts/> .
 2  @prefix dbr: <http://dbpedia.org/resource> .
 3  @prefix gist: <https://w3id.org/semanticarts/ns/ontology/gist/> .
 4  @prefix owl: <http://www.w3.org/2002/07/owl#> .
 5  @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
 6  @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
 7  @prefix xml: <http://www.w3.org/XML/1998/namespace> .
 8  @prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
 9  
10  <https://data.semanticarts.com/example> rdf:type owl:Ontology .
11  sa:mccomb gist:owns dbr:semanticarts .
```

The first 8 lines declare namespace prefixes. Strictly speaking they are
just conveniences (abbreviations), so that line 11 doesn't get too long
to read. The name of the ontology is in line 10. The entire ontology is
in line 11, and doesn't refer to anything that was minted in this ontology.
It just says that someone named mccomb (as per the Semantic Arts
namespace) owns (as per gist's definition of ownership) something
that dbPedia will soon recognize as Semantic Arts.

This ontology does not have any IRIs minted in either its namespace
(which isn't even declared; I took out the default declaration) or
in this ontology.

## How to partition

Once we decouple the namespace from the ontology, we can rightly ask:
when do you use a new namespace and/or a new ontology?

## Modularity drives ontology packaging

When you import an ontology, you get all of its axioms. Unlike
importing a software library, in the case of ontologies you are
committed to the whole thing. All of the axioms and inferences will
apply to your ontology and data. Often this is more than a consumer
of the ontology wants.

The response to this is to partition your ontology into modules.
Historically these were files. A purchasing ontology might import a
materials ontology and a vendor ontology. Someone building out an
inventory system might import the materials ontology and not bother
with the other two.

## Governance drives namespace use

But just because you've divided your ontology into partitions (modules)
doesn't mean the namespaces must follow. In the above example, if one
group were doing all the ontology work for vendor, material and purchasing,
they could easily do all three in the same namespace.

You really only need separate namespaces if you have people minting
terms that are not coordinating with each other. If you have one group
minting the term: `Account` to mean what accountants think and the
sales group minting the term `Account` to mean prospect, you'd have
a difficult time with the accidental term collisions.

The solution is either to coordinate, or to have separate namespaces.

How has this played out in our work? We can certainly coordinate
across the many gist-derived ontologies. Our clients typically extend
gist, and their extensions are in their own namespace. They sometimes
have subdomains which are again separate domains. And a pattern we see
a lot is to have a separate namespace for taxonomy editing. The
taxonomy groups need only a light bit of coordination with the
ontologists, and we find having them manage their work in their own
namespace to be the most productive.

Refactoring made difficult by conflating namespaces with ontologies##

We have worked on ontologies managed by other groups who followed
the anti-pattern of one namespace per ontology per file.

The problems become more obvious the more files you have. If someone
mints a term, say a property or a class, in a sub-ontology that everyone
agrees would be useful to have in other sub-ontologies, the other
sub-ontologies can either import the one with the term they want
(getting a bunch of axioms they don't want) or they can lobby for
promoting the term to a higher level ontology where it can be reused
more easily. The only problem is that with that promotion, because
each ontology has its own namespace, the name of the term must be
changed. This change often results in other rework: anyone who may
have referred to the earlier term must now refer to the new term.

Hence, refactoring is unnecessarily slowed down.

## Summary

Because of the default behavior of most ontology tools, many people have
conflated the naming of namespaces with ontologies. This conflation
leads to suboptimal outcomes. We have opted to stick with a limited
number of namespaces that we coordinate, and therefore the namespace
is not the same as the ontology IRI.

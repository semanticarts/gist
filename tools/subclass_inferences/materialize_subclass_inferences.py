import os
import tempfile
from rdflib import Graph, Namespace, URIRef, Literal
import rdflib
from owlready2 import get_ontology, default_world, sync_reasoner
from rdflib.namespace import RDFS, RDF, SKOS, OWL, XSD

# This script generates gistSubClassAssertions.ttl.

def run_reasoner(input_ttl, output_ttl):

    input_graph = Graph()
    input_graph.parse(input_ttl, format='turtle')

    # owlready2 does not accept TTL files. Convert to N-Triples.
    with tempfile.NamedTemporaryFile('w', suffix='.nt', delete=False) as temp_file:
        temp_filename = temp_file.name
        input_graph_str = input_graph.serialize(format='nt')
        temp_file.write(input_graph_str)

    ontology = get_ontology(f'file://{temp_filename}').load()

    # Run OWL DL reasoner (HermiT reasoner is used by default in owlready2).
    with ontology:
        sync_reasoner()

    raw_output_graph = Graph().parse(data=default_world.as_rdflib_graph().serialize(format='turtle'), format='turtle')

    GIST = Namespace("https://w3id.org/semanticarts/gist/")
    subclass_ontology = URIRef("https://ontologies.semanticarts.com/o/gistSubClassAssertions.ttl")

    output_graph = Graph()

    # Add subclass assertions to output graph.
    for s, p, o in raw_output_graph:
        if p == RDFS.subClassOf and not (isinstance(o, rdflib.BNode)):
            output_graph.add((s, p, o))

    triples = [
        (RDF.type, OWL.Ontology),
        (OWL.imports, URIRef("https://ontologies.semanticarts.com/o/gistCore")),
        (SKOS.definition, Literal("Supplementary subclass assertions for gistCore.", datatype=XSD.string)),
        (SKOS.prefLabel, Literal("gist Subclass Assertions")),
        (SKOS.scopeNote, Literal("This ontology file contains supplementary subclass assertions that are logically entailed by gist but are not inferred by some automated reasoners. For example, an RL reasoner would not infer that gist:Commitment is a subclass of gist:Intention, even though it must be. More precisely, it contains (1) subclass assertions derived using an OWL DL reasoner and (2) the subclass assertions that are already explicit in gistCore.", datatype=XSD.string)),
        (GIST.license, Literal("https://creativecommons.org/licenses/by-sa/3.0/", datatype=XSD.string))
    ]   

    # Add ontology metadata to output graph.
    for p, o in triples:
        output_graph.add((subclass_ontology, p, o))

    for prefix, namespace in input_graph.namespaces():
        output_graph.bind(prefix, namespace)

    output_graph.serialize(destination=output_ttl, format='turtle')

    # Delete the temporary N-Triples file.
    os.unlink(temp_filename)

if __name__ == '__main__':
    
    # In the future, this can be generalized to run over all TTL files to get any additional subclass assertions that are not part of gistCore.
    input_ttl_file = "../gistCore.ttl"
    output_ttl_file = "../gistSubClassAssertions.ttl"

    run_reasoner(input_ttl_file, output_ttl_file)
    print(f'Subclass assertions output in {output_ttl_file}.')

import sys
import os
import tempfile
from rdflib import Graph
import rdflib
from owlready2 import get_ontology, default_world, sync_reasoner
from rdflib.namespace import RDF, RDFS, OWL

# This script can be used during the gist release process to generate gistSubClassAssertions.ttl. After running it, the release manager should manually add the ontology metadata (the owl:imports statement, the skos:prefLabel, etc.) before generating the release package.

def run_reasoner(input_ttl, output_ttl):

    input_graph = Graph()
    input_graph.parse(input_ttl, format='turtle')

    # owlready2 does not accept TTL files. Convert to N-Triples.
    with tempfile.NamedTemporaryFile('w', suffix='.nt', delete=False) as temp_file:
        temp_filename = temp_file.name
        input_graph_str = input_graph.serialize(format='nt')
        temp_file.write(input_graph_str)

    ontology = get_ontology(f'file://{temp_filename}').load()

    # Run OWL DL reasoner (HermiT reasoner is used by default in owlready2)
    with ontology:
        sync_reasoner()

    raw_output_graph = Graph().parse(data=default_world.as_rdflib_graph().serialize(format='turtle'), format='turtle')

    output_graph = Graph()
    for s, p, o in raw_output_graph:
        if p == RDFS.subClassOf and not (isinstance(o, rdflib.BNode)):
            output_graph.add((s, p, o))

    for prefix, namespace in input_graph.namespaces():
        output_graph.bind(prefix, namespace)

    output_graph.serialize(destination=output_ttl, format='turtle')

    # Delete the temporary N-Triples file
    os.unlink(temp_filename)


if __name__ == '__main__':
    
    input_ttl_file = "../gistCore.ttl"
    output_ttl_file = "../gistSubClassAssertions.ttl"

    run_reasoner(input_ttl_file, output_ttl_file)
    print(f'Subclass assertions output in {output_ttl_file}.')

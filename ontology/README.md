# The WASABI ontology

The WASABI ontology is a vocabulary, written in W3C OWL Web Ontology Language, that allows to describe the metadata of the dataset wasabi. It relies mainly on the Music Ontology that provides a rich vocabulary for describing and linking music related information.

This first version of the ontology includes 8 classes and 50 properties.

## Ontology description
### Namespace
[`http://ns.inria.fr/wasabi/ontology/`](http://ns.inria.fr/wasabi/ontology/)
### Current Version
v1
### Publisher
Inria
### Imported ontologies
[`http://dbpedia.org/ontology/`](http://dbpedia.org/ontology/)
[`http://purl.org/dc/terms/`](http://purl.org/dc/terms/)
[`http://purl.org/ontology/mo/`](http://purl.org/ontology/mo/)
[`http://xmlns.com/foaf/0.1/`](http://xmlns.com/foaf/0.1/)
### Classes
The WASABI ontology extends the Muusic Ontology, which is why 7 out of 8 classes from its classes are linked to ones in Music Ontology.
- **Album** (`wsb:Album`)
- **Artist_Group** (`wsb:Artist_Group`) : equivalent class of `mo:MusicGroup`.
- **Artist_Person** (`wsb:Artist_Person`) : equivalent class of `mo:SoloMusicArtist`.
- **Choir** (`wsb:Choir`) & **Orchestra** (`wsb:Orchestra`) : subclasses of `mo:MusicArtist`.
- **Lyrics** (`wsb:Lyrics`) : equivalent class of `mo:Lyrics`.
- **Song** (`wsb:Song`) : equivalent class of `mo:Track`.
- **Classical music composition** (`wsb:Classical_Music_Composition`) : equivalent class of `dbo:ClassicalMusicComposition` from the DBpedia ontology.

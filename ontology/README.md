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
- **Artist_Group** (`wsb:Artist_Group`) : equivalent class of `mo:MusicGroup`
- **Artist_Person** (`wsb:Artist_Person`) : equivalent class of `mo:SoloMusicArtist`
- **Choir** (`wsb:Choir`) & **Orchestra** (`wsb:Orchestra`) : subclasses of `mo:MusicArtist`
- **Lyrics** (`wsb:Lyrics`) : equivalent class of `mo:Lyrics`
- **Song** (`wsb:Song`) : equivalent class of `mo:Track`
- **Classical music composition** (`wsb:Classical_Music_Composition`) : equivalent class of `dbo:ClassicalMusicComposition` from the DBpedia ontology

### Properties
The wasabi dataset contains some specific properties that are not covered by the Music Ontology, of which 22 are links to social network pages, represented in the WASABI ontology as object properties.
The dataset also includes several calculated features. Here are a few examples:
- **audio gain** (`wsb:gain`)
- **detected language** (`wsb:language_detected`) : sub-property of `dcterms:language`
- **number of explicit lyrics** (`wsb:explicit_lyrics_count`)
- **presence of explicit lyrics** (`wsb:has_explicit_lyrics`)
- **name without title** (`wsb:name_without_accent`) : sub-property of `foaf:name`
Furthermore, we also describe the chords of a song through the property:
- **chords sequence** (`wsb:chord_sequence`) : an `rdf:List` of chords in the song

### Main terms reused from other ontologies or common vocabularies
For chords' description:
- **confidence** (`af:confidence`) : from the Audio Features Ontology [`http://purl.org/ontology/af/`](http://purl.org/ontology/af/)
- **chord** (`chord:chord`) : from the Chord Ontology [`http://purl.org/ontology/chord/`](http://purl.org/ontology/chord/)
- **duration** (`schema:duration`) : from the Chord Ontology [`http://schema.org/`](http://schema.org/)






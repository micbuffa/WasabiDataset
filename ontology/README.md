# The WASABI ontology

The WASABI ontology is a vocabulary to formalize the WASABI dataset's metadata. Written in the W3C OWL Web Ontology Language, it primarily relies on the [Music Ontology](http://purl.org/ontology/mo/) that defines a rich vocabulary for describing and linking music information, and extends it with terms about some specific entities and properties not covered by the Music Ontology.

The WASABI ontology also reuses relevant terms from common vocabularies such as Dublin Core Metadata, FOAF, Schema.org and the DBpedia ontology, as well as some specific terms from the [Audio Features Ontology](http://purl.org/ontology/af/) and the [OMRAS2 Chord Ontology](http://purl.org/ontology/chord/).

This current version of the ontology includes 8 classes and 50 properties.



## Ontology description
### Namespace
[`http://ns.inria.fr/wasabi/ontology/`](http://ns.inria.fr/wasabi/ontology/)
### Current Version
v2
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
- **Classic song of pop/rock music** (`wsb:Classic_Song`)
- - **Topic** (`wsb:Topic`)

### Properties
The wasabi dataset contains some specific properties that are not covered by the Music Ontology, of which 22 are links to social network pages, represented in the WASABI ontology as object properties.
The dataset also includes several calculated features. Here are a few examples:
- **audio gain** (`wsb:gain`)
- **detected language** (`wsb:language_detected`) : sub-property of `dcterms:language`
- **number of explicit lyrics** (`wsb:explicit_lyrics_count`)
- **presence of explicit lyrics** (`wsb:has_explicit_lyrics`)
- **name without title** (`wsb:name_without_accent`) : sub-property of `foaf:name`

### Examples of terms reused from other ontologies or common vocabularies
To describe songs:
- **performer** (`mo:performer`) : from the Music Ontology [`http://purl.org/ontology/mo/`](http://purl.org/ontology/mo/)
- **author** (`schema:author`) : from Schema.org Vocabulary [`http://schema.org/`](http://schema.org/)
- **publication date** (`schema:Published`) : from Schema.org Vocabulary [`http://schema.org/`](http://schema.org/)

To describe artists:
- **homepage** (`mo:homepage`) : from the Music Ontology [`http://purl.org/ontology/mo/`](http://purl.org/ontology/mo/)
- **associated musical artist** (`dbo:associatedMusicalArtist`) : from the DBpedia ontology [`http://dbpedia.org/ontology/`](http://dbpedia.org/ontology/)
- **genre** (`schema:genre`) : from Schema.org Vocabulary [`http://schema.org/`](http://schema.org/)

To describe albums:
- **title** (`dcterms:title`) : from the Dublin Core Metadata Vocabulary [`http://purl.org/dc/terms/`](http://purl.org/dc/terms/)
- **upc** (`mo:upc`) : from the Music Ontology [`http://purl.org/ontology/mo/`](http://purl.org/ontology/mo/)
- **release date** (`schema:releaseDate`) : from Schema.org Vocabulary [`http://schema.org/`](http://schema.org/)

To describe chords:
- **chord** (`chord:chord`) : from the Chord Ontology [`http://purl.org/ontology/chord/`](http://purl.org/ontology/chord/)
- **confidence** (`af:confidence`) : from the Audio Features Ontology [`http://purl.org/ontology/af/`](http://purl.org/ontology/af/)
- **duration** (`schema:duration`) : from Schema.org Vocabulary [`http://schema.org/`](http://schema.org/)






# WASABI Song Corpus
This repository contains the files of the current version of the WASABI Song Corpus, the models we have built on it as well as updates.

## Abstract
The WASABI Song Corpus is a large corpus of songs enriched with metadata extracted from music databases on the Web, and resulting from the processing of song lyrics and from audio analysis. 

More specifically, given that lyrics encode an important part of the semantics of a song, we focus here on the description of the methods we proposed to extract relevant information from the lyrics, such as their **structure segmentation**, their **topics**, the **explicitness** of the lyrics content, the **salient passages** of a song and the **emotions** conveyed. 

The corpus contains 1.73M songs with lyrics (1.41M unique lyrics) annotated at different levels with the output of the above mentioned methods. Such corpus labels and the provided methods can be exploited by music search engines and music professionals (e.g. journalists, radio presenters) to better handle large collections of lyrics, allowing an intelligent browsing, categorization and segmentation recommendation of songs.


## Interactive explorer
The dataset can be explored using the [WASABI Interactive Navigator](https://wasabi.i3s.unice.fr). Beware that certain copyrighted data (ex: full length lyrics or full track audio files) are not accessible if you are not a member of the Wasabi project.

## Overview
- The WASABI Song Corpus consists of CSV files containing the songs, the artists and the albums.
  - [2.1M songs](https://mega.nz/#!GUhzBagS!dkWiRhRKCzTpbWtWcUvoD3Rrhleq50krvvg6n0SaI-w)
  - [77k artists]([https://mega.nz/file/mgZTjZiK#f8_CzSSC3j8nt75hZ8WqNMFSB_i8AvuB_olZ8hisl1E](https://mega.nz/file/qwAm2KjR#BRQCyVCQq1eObGXHV5DTqHY_NlYmhdVBcd939aixrTo))
  - [208k albums](https://mega.nz/#!ScwnlarS!V59gnQY_oDOFzBplIok7nMnAC2QUq7UpbgmpDjLAWWQ)
- Natural Language Processing Annotations
  - [Self-similarity matrices (line- and segment level) for 1.73M lyrics](https://mega.nz/#!HR5R3ACA!wV9zqtQSxziZCdXwu3gApnrTIPyH2hMAgGUYJEqmlmk)
  - [50k lyrics summaries](https://mega.nz/#!SdpxTS4I!SdbzMWvZO9fKkIF1OkHZ5lPH6v5w0HvK-GeztBV1T-g)
  - [Topic predictions for 1.73M lyrics (inludes topic model)](https://mega.nz/#!CUpl0KKJ!tLlL1eMKjX94ZJvpaO7w7HFtozpKDlyruVwRt2z-9G4)
- Additional annotations provided
  - [LastFM social tags](https://mega.nz/#!WQx1ka7K!9PfU3K7q6JkqkfMdrirS5IRsMbEJVV1FWBEmoUGK5ME)
  - [LastFM emotion tags](https://mega.nz/#!KN5jwYpZ!GFEc04t87ylJYILQQzjMaeZNg0_DoBnYeo0dvxLoLg4)
- NLP Models
  - [Explicit lyrics classifier trained on 438k lyrics](https://mega.nz/#!ndx3zQ4I!K6Qq6Bvf9NXWHejPvMyxwTUJGn-U8K6auuN0gCktcmU)
  - [LDA topic model trained on 1.05M lyrics](https://mega.nz/#!KFhh2AyC!-OaAifvACt3CAo-Pl-D14LIOb6Gx4ReJzjmqY7StwCY)

## Dependencies
The packages present when successfully running the code are listed in the file [pip list --local](doc/pip%20list%20--local).

## Usage examples
This [Jupyter Notebook](Showcase.ipynb) shows how to use the different resources.

## Downloading lyrics

Initially, the songs lyrics were retrieved from the LyricsWikia service that helped bootstrap the WASABI project. However, we cannot redistribute the lyrics since these are copyrighted material.

As of 2020, LyricsWikia is no longer availabile. Some NLP researchers managed to use our ML models on full lyrics that they obtained from other sources, in particular the commercial MusixMatch service (that provides large parts of the lyrics for free) or other online web site from where they could scrap the lyrics.

We have plans to complete the dataset in the next three years (starting 2021), and we have already written scripts that use MusixMatch to perform lyrics analysis on the upcoming new content.


### Citation
If you use our resource, please cite the following articles:
```
incollection{buffa:hal-03282619,
  TITLE = {{The WASABI Dataset: Cultural, Lyrics and Audio Analysis Metadata About 2 Million Popular Commercially Released Songs}},
  AUTHOR = {Buffa, Michel and Cabrio, Elena and Fell, Michael and Gandon, Fabien and Giboin, Alain and Hennequin, Romain and Michel, Franck and Pauwels, Johan and Pellerin, Guillaume and Tikat, Maroua and Winckler, Marco},
  URL = {https://hal.science/hal-03282619},
  BOOKTITLE = {{The Semantic Web. ESWC 2021. Lecture Notes in Computer Science, vol 12731.}},
  PAGES = {515-531},
  YEAR = {2021},
  MONTH = May,
  DOI = {10.1007/978-3-030-77385-4\_31},
  KEYWORDS = {Music metadata ; Lyrics analysis ; Named entites ; Linked data},
  PDF = {https://hal.science/hal-03282619/file/camera_ready.pdf},
  HAL_ID = {hal-03282619},
  HAL_VERSION = {v1},
}

@article{fell2019love,
  title={Love Me, Love Me, Say (and Write!) that You Love Me: Enriching the WASABI Song Corpus with Lyrics Annotations},
  author={Michael Fell and Elena Cabrio and Elmahdi Korfed and Michel Buffa and Fabien Gandon},
  journal={arXiv},
  year={2019},
  volume={abs/1912.02477}
}
```


# WASABI RDF Knowledge Graph

The WASABI RDF Knowledge Graph provides an RDF representation of songs, artists and albums, together with the information automatically extracted from lyrics and audio content.
The dataset and ontology have the same root namespace: `http://ns.inria.fr/wasabi/`. All URIs are dereferenceable.

The dataset itslef is identified by URI [`http://ns.inria.fr/wasabi/wasabi-2-0`](http://ns.inria.fr/wasabi/wasabi-2-0). It comes with DCAT, VOID and SPARQL-SD descriptions.

It leverages the [WASABI ontology](ontology) that reuses classes and properties from other vocabularies. Not all the terms needed to describe resources were imported in the ontology. As a result, the resource descriptions use terms from multiple vocabularies whose namespaces and prefixes are given below.

```turtle
@prefix af:      <http://purl.org/ontology/af/> .
@prefix chord:   <http://purl.org/ontology/chord/> .
@prefix dbo:     <http://dbpedia.org/ontology/> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix foaf:    <http://xmlns.com/foaf/0.1/> .
@prefix mo:      <http://purl.org/ontology/mo/> .
@prefix owl:     <http://www.w3.org/2002/07/owl#> .
@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix schema:  <http://schema.org/> .
@prefix wsb:     <http://ns.inria.fr/wasabi/ontology/> .
@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
```

## Song metadata

Song URIs are formatted as `http://ns.inria.fr/wasabi/song/song_id` where song_id is the song's WASABI unique identifier.

Each song is linked to its artist and the album in which it appears as follows:
- `mo:performer <http://ns.inria.fr/wasabi/artist/artist_id>`
- `schema:album <http://ns.inria.fr/wasabi/album/album_id>`

Among the song metadata, we find:
- title (`dcterms:title`)
- detected language (`wsb:language_detected`)
- sound gain (`wsb:gain`)
- number of explicit lyrics in the song (`wsb:explicit_lyrics_count`)
- chords sequence (`wsb:chord_sequence`)
- chords sequence confidence (`af:confidence`)
- bpm (`mo:bpm`)

The ontology folder provides an [example of the RDF Turtle representation of "Bad" by Mickael Jackson](ontology/example_song.ttl).


## Artist metadata

Artist URIs are formatted as `http://ns.inria.fr/wasabi/artist/artist_id` where artist_id is the artist's WASABI unique identifier.

We distinguish 4 types of artists in the dataset: 
- `wsb:Artist_Person` equivalent to class `mo:SoloMusicArtist` of the Music Ontology,
- `wsb:Artist_Group` equivalent to class `mo:MusicGroup` of the Music Ontology,
- `wsb:Choir` and `wsb:Orchestra` that are subclasses of `mo:MusicArtist` of the Music Ontology.

In the case where the artist is a group, it is made up of members that we represent in this way:
- `schema:members <http://ns.inria.fr/wasabi/artist/artist_id>`

The ontology folder provides an [example of the RDF Turtle representation of Mickael Jackson](ontology/example_artist.ttl).


## Album metadata

Album URIs are formatted as `http://ns.inria.fr/wasabi/album/album_id` where album_id is the album's WASABI unique identifier.

Each album is linked to its artist as follows:
- `mo:performer <http://ns.inria.fr/wasabi/artist/artist_id>`

The ontology folder provides an [example of the RDF Turtle representation of albnum "HIStory" by Mickael Jackson](ontology/example_album.ttl).


## Downloading and SPARQL Querying

The dataset is downloadable, as an RDF dump (in Turtle syntax) and JSON dump, from Zenodo: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5603369.svg)](https://doi.org/10.5281/zenodo.5603369)

It can also be queried through our Virtuoso OS SPARQL endpoint http://wasabi.inria.fr/sparql.

You may use the [Faceted Browser](http://wasabi.inria.fr/fct/) to look up text or URIs.


The following **named graphs** can be queried from our SPARQL endpoint:

| Named graph    | Description |
| -------------  | ---- |
| http://ns.inria.fr/wasabi/ontology/ | WASABI ontology | 
| http://ns.inria.fr/wasabi/graph/metadata | dataset description (DCAT, VOID, SPARQL SD) | 
| http://ns.inria.fr/wasabi/graph/artists | artists metadata (name, genre, record label, web pages etc.) | 
| http://ns.inria.fr/wasabi/graph/albums | albums metadata (title, publication date, length etc.) |
| http://ns.inria.fr/wasabi/graph/songs | songs metadata (title, album, publication date, etc.), chords |
| http://ns.inria.fr/wasabi/graph/songs-extd | songs extended information: topics, emotion tags, social tags, emotion valence and arrousal |


# License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />

The Wasabi dataset is licensed under the <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

The code used to produce the dataset, provided in folder src, is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

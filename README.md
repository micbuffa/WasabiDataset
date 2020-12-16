# WASABI Song Corpus
This repository contains the files of the current version of the WASABI Song Corpus, the models we have built on it as well as updates.

## Abstract
The WASABI Song Corpus is a large corpus of songs enriched with metadata extracted from music databases on the Web, and resulting from the processing of song lyrics and from audio analysis. 

More specifically, given that lyrics encode an important part of the semantics of a song, we focus here on the description of the methods we proposed to extract relevant information from the lyrics, such as their **structure segmentation**, their **topics**, the **explicitness** of the lyrics content, the **salient passages** of a song and the **emotions** conveyed. 

The corpus contains 1.73M songs with lyrics (1.41M unique lyrics)  annotated at different levels with the output of the above mentioned methods. Such corpus labels and the provided methods can be exploited by music search engines and music professionals (e.g. journalists, radio presenters) to better handle large collections of lyrics, allowing an intelligent browsing, categorization and segmentation recommendation of songs.


## Interactive explorer
The dataset can be explored using the [WASABI Interactive Navigator](https://wasabi.i3s.unice.fr). Beware that certain copyrighted data (ex: full length lyrics or full track audio files) are not accessible if you are not a member of the Wasabi project.

## Overview
- The WASABI Song Corpus consists of CSV files containing the songs, the artists and the albums.
  - [2.1M songs](https://mega.nz/#!GUhzBagS!dkWiRhRKCzTpbWtWcUvoD3Rrhleq50krvvg6n0SaI-w)
  - [77k artists](https://mega.nz/#!jUojAQjb!lV6K3U49l0xzw7XzL5zXKQscSI8hntrO_FVp8luH4zE)
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
A simple yet effective way to obtain lyrics is querying [LyricWiki](https://lyrics.fandom.com/wiki/LyricWiki) via the Python module [lyricswikia](https://pypi.org/project/lyricwikia/):
```
import lyricwikia
lyrics = lyricwikia.get_lyrics('Led Zeppelin', 'Stairway to heaven')
```

### Citation
If you use our resource, please cite the following article:
```
@article{fell2019love,
    title={Love Me, Love Me, Say (and Write!) that You Love Me: Enriching the WASABI Song Corpus with Lyrics Annotations},
    author={Michael Fell and Elena Cabrio and Elmahdi Korfed and Michel Buffa and Fabien Gandon},
    journal={arXiv},
    year={2019},
    volume={abs/1912.02477}
}
```

## WASABI RDF Knowledge Graph

The description of the musical data of the WASABI corpus amounts to describing its three main entities: song, artist and album.

### Namespaces

The namespaces we use in the examples below.

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

### Song metadata

Song URIs are formatted as `http://ns.inria.fr/wasabi/song/song_id` song_id being the song's unique identifier.

Each song is linked to its artist and the album in which it appears as follows:
- `mo:performer <http://ns.inria.fr/wasabi/artist/artist_id`
- `schema:album <http://ns.inria.fr/wasabi/album/album_id`

Example of song metadata:
```turtle
<http://ns.inria.fr/wasabi/song/5714dedc25ac0d8aee4aeeb7>
    a wsb:Song, wsb:Classical_Music_Composition;

    dcterms:title "Bad"; wsb:title_without_accent "Bad";
    dcterms:abstract "Bad is a song by American song writer and recording artist Michael Jackson (...)";
    dcterms:subject "Michael Jackson songs", "1987 singles", "Song recordings produced by Quincy Jones";
    schema:author "Michael Jackson", "Pitbull (rapper)";
    mo:performer <http://ns.inria.fr/wasabi/artist/56d93e0fce06f50c0fed8808>;
    
    schema:releaseDate "1987-09-07"^^xsd:date, "2012-08-14"^^xsd:date;
    schema:datePublished "2007-11-13"^^xsd:date;
    mo:producer "Quincy Jones";
    schema:album <http://ns.inria.fr/wasabi/album/5714debe25ac0d8aee36b8a2>;
    mo:track_number "5"^^xsd:nonNegativeInteger;

    mo:uuid "5714dedc25ac0d8aee4aeeb7";
    wsb:deezer_song_id "540993";
    wsb:deezer_artist_id "259";
    mo:musicbrainz_guid "47eaab1a-667b-490d-8094-168e7d0d9ad1";

    dcterms:format "12-inch single", "CD single", "Compact disc", "Gramophone record", "Music download";
    dcterms:language "eng";
    wsb:gain "-8.9"^^xsd:float;
    wsb:language_detected "english";
    wsb:rank 675040;
    mo:bpm  "114.2"^^xsd:float;
    mo:duration "247000"^^xsd:float;
    mo:isrc "USSM11204980";
    mo:preview <http://e-cdn-preview-6.deezer.com/stream/65bd2ff532662d9df17b117b06064c78-1.mp3>;

    wsb:explicit_lyrics_count 2;
    wsb:has_explicit_lyrics "false"^^xsd:boolean;

    wsb:record_label "Epic Records";
    wsb:recording_description "January 1987", "1987";

    owl:sameAs <http://dbpedia.org/resource/Bad_%28Michael_Jackson_song%29>;
    mo:homepage <http://lyrics.wikia.com/Michael_Jackson:Bad>;
    mo:musicbrainz <http://musicbrainz.org/recording/47eaab1a-667b-490d-8094-168e7d0d9ad1>;
    mo:wikipedia <http://en.wikipedia.org/wiki/Bad_%28Michael_Jackson_song%29>;
    wsb:allMusic_page <http://www.allmusic.com/song/mt0010540276>;
    wsb:deezer_page <http://www.deezer.com/track/59509531>;
    wsb:goEar_page <http://goear.com/listen.php?v%3D780bfc7>;
    wsb:iTunes_page <https://itunes.apple.com/us/album/id192990143?i%3D192990214>;
    wsb:spotify_page <https://play.spotify.com/track/4xJjD28UsZlqbX7tBV3Aj5>;
    .
```

### Artist metadata

Artist URIs are formatted as `http://ns.inria.fr/wasabi/artist/artist_id` artist_id being the artist's unique identifier.

we distinguish 4 types of artists in the dataset: 
- `wsb:Artist_Person` equivalent class to `mo:SoloMusicArtist` of the Music Ontology.
- `wsb:Artist_Group` equivalent class to `mo:MusicGroup` of the Music Ontology.
- `wsb:Choir` subclass of `mo:MusicArtist` of the Music Ontology.
- `wsb:Orchestra` `mo:MusicArtist` of the Music Ontology.

Note that both `mo:SoloMusicArtist` and `mo:MusicGroup` are issued from `mo:MusicGroup`.

In the case where the artist is a group, it is made up of members that we represent in this way:
- `schema:members <http://ns.inria.fr/wasabi/artist/artist_id>`

Example of artist metadata:
```turtle
<http://ns.inria.fr/wasabi/artist/56d93e0fce06f50c0fed8808>
    a wsb:Artist_Person;
    rdfs:label "Michael Jackson"; foaf:name "Michael Jackson";
    schema:alternateName "M. J.", "MJ", "M.J. Jackson", "MJackson", "M. Jackson", "M.Jackson", "M.J";
    wsb:name_without_accent "Michael Jackson";
    foaf:gender "Male";
    schema:birthDate "1958-08-29";
    schema:deathDate "2009-06-25";

    dcterms:abstract "American singer, dancer, entertainer, (...)";
    dbo:abstract "Michael Joseph Jackson (August 29, 1958 – June 25, 2009) was an American singer (...)";
    dcterms:subject "20th-century American businesspeople", "Motown artists", "21st-century American writers", "African-American male dancers";
    schema:disambiguatingDescription "King of Pop";
    dbo:associatedMusicalArtist "The_Jackson_5";
    dbo:genre <http://dbpedia.org/resource/Dance-pop>, <http://dbpedia.org/resource/Funk>;
    schema:genre "Disco", "New Jack Swing", "Soul", "Pop", "Rock";
    wsb:record_label "Epic Records", "Legacy", "Motown";
    
    schema:image <http://e-cdn-images.deezer.com/images/artist/620963abda08cd7aa97aee40248bfe10/1000x1000-000000-80-0-0.jpg>;
    schema:thumbnail <http://e-cdn-images.deezer.com/images/artist/620963abda08cd7aa97aee40248bfe10/56x56-000000-80-0-0.jpg>;

    mo:uuid "56d93e0fce06f50c0fed8808";
    wsb:deezer_artist_id "259";
    wsb:discogs_id "15885";
    mo:musicbrainz_guid "f27ec8db-af05-4f36-916e-3d57f91ecf5e";
    wsb:deezer_fans 8066328;

    owl:sameAs wd:Q2831, <http://dbpedia.org/resource/Michael_Jackson>;
    mo:homepage <http://www.michaeljackson.com>;
    mo:discogs <http://www.discogs.com/artist/15885>;
    mo:musicbrainz <http://musicbrainz.org/artist/f27ec8db-af05-4f36-916e-3d57f91ecf5e>;
    mo:myspace <https://myspace.com/michaeljackson>;
    mo:wikipedia <http://en.wikipedia.org/wiki/Michael_Jackson>;
    wsb:allMusic_page <http://www.allmusic.com/artist/mn0000467203>;
    wsb:BBC_page <http://www.bbc.co.uk/music/artists/f27ec8db-af05-4f36-916e-3d57f91ecf5e>;
    wsb:deezer_page <http://www.deezer.com/artist/259>;
    wsb:facebook_page <http://www.facebook.com/michaeljackson>;
    wsb:googlePlus_page <https://plus.google.com/%2BMichaelJackson/>;
    wsb:iTunes_page <https://itunes.apple.com/us/artist/id32940>;
    wsb:lastFm_page <http://www.last.fm/music/Michael%2BJackson>;
    wsb:rateYourMusic_page <http://rateyourmusic.com/artist/michael_jackson>;
    wsb:secondHandSongs_page <http://www.secondhandsongs.com/artist/254>;
    wsb:spotify_page <https://play.spotify.com/artist/3fMbdgg4jU18AjLCKBhRSm>;
    wsb:twitter_page <http://twitter.com/michaeljackson>;
    wsb:wikia_page <Michael_Jackson>;
    wsb:wikidata_page <https://www.wikidata.org/wiki/Q2831>;
    wsb:youTube_page <https://www.youtube.com/user/michaeljackson>;
    .

# Jackson 5
<http://ns.inria.fr/wasabi/artist/56d97fedcc2ddd0c0f6bcf52>
      schema:members <http://ns.inria.fr/wasabi/artist/56d93e0fce06f50c0fed8808> .
```

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

# WASABI Song Corpus
This repository contains the files of the current version of the WASABI Song Corpus, the models we have built on it as well as updates.

## Abstract
We present the WASABI Song Corpus, a large corpus of songs enriched with metadata extracted from  music databases on  the  Web, and resulting from the processing of song lyrics and from audio analysis. More specifically, given that lyrics encode an important part of the semantics of a song, we focus here on the description of the methods we proposed to extract relevant information from the lyrics, such as their structure segmentation, their topics, the explicitness of the lyrics content, the salient passages of a song and the emotions conveyed. The creation of the resource is still ongoing: so far, the corpus contains 1.73M songs with lyrics (1.41M unique lyrics)  annotated at different levels with the output of the above mentioned methods. Such corpus labels and the provided methods can be exploited by music search engines and music professionals (e.g. journalists, radio presenters) to better handle large collections of lyrics, allowing an  intelligent browsing, categorization and segmentation recommendation of songs.

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
The packages present when successfully running the code are listed in the file [pip list --local](https://github.com/micbuffa/WasabiDataset/blob/master/pip%20list%20--local).

## Usage examples
This [Jupyter Notebook](https://github.com/micbuffa/WasabiDataset/blob/master/Showcase.ipynb) shows how to use the different resources.

## Downloading lyrics
A simple yet effective way to obtain lyrics is querying [LyricWiki](https://lyrics.fandom.com/wiki/LyricWiki) via the Python module [lyricswikia](https://pypi.org/project/lyricwikia/)
Example query:
```
import lyricwikia
lyrics = lyricwikia.get_lyrics('Led Zeppelin', 'Stairway to heaven')
```

### Citation
If you use our resource, please cite the following article:
```
@misc{fell2019love,
    title={Love Me, Love Me, Say (and Write!) that You Love Me: Enriching the WASABI Song Corpus with Lyrics Annotations},
    author={Michael Fell and Elena Cabrio and Elmahdi Korfed and Michel Buffa and Fabien Gandon},
    year={2019},
    eprint={1912.02477},
    archivePrefix={arXiv},
    primaryClass={cs.CL}
}
```

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

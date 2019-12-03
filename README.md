# WASABI Song Corpus
We present the WASABI Song Corpus, a collection of 2.1M songs enriched with metadata extracted from music databases on the Web, and resulting from the natural language processing of song lyrics as well as from audio analysis.

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
  
## Working with the data
Our [Jupyter Notebook](https://github.com/micbuffa/WasabiDataset/blob/master/Showcase.ipynb) shows the dependencies and examples on how to use the different resources.

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
not yet available
```

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

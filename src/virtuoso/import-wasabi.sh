#!/bin/bash
#
# WARNING - Run the commands below from directory 'virtuoso'

# Environment variables
. ../env.sh


# Directory where the ttl files are stored
CURRENT_DIR=$(pwd)
DATASET_DIR=$CURRENT_DIR/../xr2rml/$WASABI_DATASET

graph="http://ns.inria.fr/wasabi/ontology/"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $CURRENT_DIR/../../ontology \
    'wsb-2.0.ttl'

graph="http://ns.inria.fr/wasabi/graph/metadata"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $CURRENT_DIR/../rdf_dataset_description \
    '*.ttl'

graph="http://ns.inria.fr/wasabi/graph/albums"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $DATASET_DIR \
    album.ttl

graph="http://ns.inria.fr/wasabi/graph/artists"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $DATASET_DIR \
    artist.ttl artist_members.ttl

graph="http://ns.inria.fr/wasabi/graph/songs"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $DATASET_DIR \
    'song_nochords.ttl.*' song_artist_id.ttl \
    'song_chords_*.ttl'

graph="http://ns.inria.fr/wasabi/graph/songs-extd"
./virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $DATASET_DIR \
    'song_topics_*.ttl' \
    song_emotion_nlp.ttl song_emotion_tags.ttl song_social_tags.ttl \
    topic_models.ttl

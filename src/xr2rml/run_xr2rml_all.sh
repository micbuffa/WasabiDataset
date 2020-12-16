#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored (relative to the current directory)
ODIR=./$WASABI_DATASET
mkdir -p $ODIR


collection=album
./run_xr2rml.sh         $collection  mapping_${collection}.ttl  $ODIR/${collection}.ttl


collection=artist
./run_xr2rml.sh         $collection  mapping_${collection}.ttl  $ODIR/${collection}.ttl

collection=artist_members
./run_xr2rml.sh         $collection  mapping_${collection}.ttl  $ODIR/${collection}.ttl


collection=song_artist_id
./run_xr2rml.sh         $collection  mapping_${collection}.ttl  $ODIR/${collection}.ttl

collection=song_nochords
./run_xr2rml_split.sh   $collection  mapping_${collection}.ttl  $ODIR/${collection}.ttl  10000000


# --- Mapping of song chords ---

collection_prefix=song_chords_
mappingTemplate=mapping_song_chords.ttl
mappingFile=/tmp/xr2rml_$$.ttl
index=0
collections=$(mongo $DB --eval "db.getCollectionNames()" | cut -d'"' -f2 | grep "$collection_prefix")
for collection in $collections; do
    echo "Processing collection $collection"
    awk "{ gsub(/{{collection}}/, \"$collection\"); print }" $mappingTemplate > $mappingFile
    ./run_xr2rml.sh  $collection  $mappingFile  $ODIR/${collection}_notime.ttl
    index=$(($index + 1))
done
rm -f $mappingFile

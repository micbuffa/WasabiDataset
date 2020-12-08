#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Environment variables
. ../env.sh

collection=artist
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR/dump_2019-11-19
mongo --eval "db.${collection}.createIndex({id_artist_deezer: 1})" localhost/$DB
mongo localhost/$DB aggregate_artist_id.js
mongo localhost/$DB aggregate_artist_without_members.js
mongo localhost/$DB aggregate_artist_members.js


collection=album
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR/dump_2019-11-19


collection=song
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR/dump_2019-11-19
mongo --eval "db.${collection}.createIndex({id_artist_deezer: 1})" localhost/$DB
mongo --eval "db.${collection}.createIndex({title: 1})" localhost/$DB
mongo --eval "db.${collection}.createIndex({isClassic: 1})" localhost/$DB
mongo localhost/$DB aggregate_song.js
mongo localhost/$DB aggregate_song_artist.js

# ====================================================
# Chords management

# Load the enhanced chords file (to provide properly formatted times and chords URIs)
collection=song_enhanced_chords
mongoimport --type=json -d $DB -c ${collection} $WASABI_DUMP_DIR/songCollectionWithEnhancedChords.json

# Keep only document ids and chords, remove anything else
collection=song_chords
mongo localhost/$DB aggregate_${collection}.js

# Export the collection and split the json file into files of 50000 lines max
mongoexport --type=json -d $DB -c ${collection} --out=$WASABI_DUMP_DIR/${collection}.json
split --lines=50000 $WASABI_DUMP_DIR/${collection}.json $WASABI_DUMP_DIR/${collection}.json.

# Import the files into separate collections of 50000 documents max
colIndex=0
for jsonFile in `ls $WASABI_DUMP_DIR/${collection}.json.*`; do
    col=${collection}_${colIndex}
    echo "----- Creating collection $col"
    mongo --eval "db.${col}.drop()" localhost/$DB
    mongoimport --type=json -d $DB -c ${col} $jsonFile
    colIndex=$(($colIndex + 1))
done

#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Environment variables
. ../env.sh

collection=artist
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR
mongo --eval "db.${collection}.createIndex({id_artist_deezer: 1})" localhost/$DB
mongo localhost/$DB aggregate_artist_id.js
mongo localhost/$DB aggregate_artist_without_members.js
mongo localhost/$DB aggregate_artist_members.js


collection=album
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR


collection=song
mongorestore --nsInclude=${DB}.${collection} $WASABI_DUMP_DIR
mongo --eval "db.${collection}.createIndex({id_artist_deezer: 1})" localhost/$DB
mongo --eval "db.${collection}.createIndex({title: 1})" localhost/$DB
mongo --eval "db.${collection}.createIndex({isClassic: 1})" localhost/$DB
mongo localhost/$DB lighten_song.js
mongo localhost/$DB aggregate_song_artist.js

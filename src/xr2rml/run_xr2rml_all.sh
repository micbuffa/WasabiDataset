#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored (relative to the current directory)
ODIR=./$WASABI_DATASET
mkdir -p $ODIR


export collection=album
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl


export collection=artist
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

export collection=artist_members
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl


export collection=song_artist_id
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

export collection=song_nochords
./run_xr2rml_split.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl  10000000

export collection=song_chords
./run_xr2rml_split.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl  10000000


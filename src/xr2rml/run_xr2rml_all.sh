#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored (relative to the current directory)
ODIR=./$WASABI_DATASET
mkdir -p $ODIR

export collection=album
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

export collection=song
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

export collection=artist
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

export collection=artist_members
./run_xr2rml.sh  mapping_${collection}.ttl  $ODIR/${collection}.ttl

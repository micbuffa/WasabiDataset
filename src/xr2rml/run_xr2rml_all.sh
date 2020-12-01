#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

. ../env.sh

# Directory where the output files are stored (relative to the current directory)
ODIR=./$WASABI_DATASET
mkdir -p $ODIR

export collection=album
./run_xr2rml.sh  mappingAlbum.ttl  $ODIR/album.ttl

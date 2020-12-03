#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

export WASABI_VERSION=1.0
export WASABI_VERSION_DASH=1-0
export WASABI_DATE=2020-11-27

# MongoDB database
export DB=wasabi

# Dataset id (end of the dataset URI)
export WASABI_DATASET=dataset-${WASABI_VERSION_DASH}

export WASABI_DUMP_DIR=/appli/wasabi/mongo-dump

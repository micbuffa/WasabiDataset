#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

export WASABI_VERSION=2.0
export WASABI_VERSION_DASH=2-0
export WASABI_DATE=2021-11-16

# MongoDB database
export DB=wasabi

# Dataset id (end of the dataset URI)
export WASABI_DATASET=dataset-${WASABI_VERSION_DASH}

export WASABI_DUMP_DIR=/appli/wasabi/mongo-dump

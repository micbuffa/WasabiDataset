#!/bin/bash
# Input argument:
# - arg1: MongoDB collection name
# - arg2: xR2RML mapping file
# - arg3: output file name
#
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
#
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

XR2RML=.
JAR=$XR2RML/morph-xr2rml-dist-1.3.1-jar-with-dependencies.jar

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <MongoDB collection> <xR2RML mapping> <output file name>"
  echo "Example:"
  echo "   $exe  album  mapping_album.ttl  album.ttl"
  exit 1
}

# --- Read input arguments
collection=$1
if [[ -z "$collection" ]] ; then help; fi

mappingFile=$2
if [[ -z "$mappingFile" ]] ; then help; fi

output=$3
if [[ -z "$output" ]] ; then help; fi


# --- Init log file
mkdir $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_xr2rml_${collection}.log
echo -n "" > $log

echo "-- xR2RML mapping file --" >> $log
cat $mappingFile >> $log

echo "--------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx20g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$JAR" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile $mappingFile \
     --output $output \
     >> $log
date >> $log

#!/bin/bash
# Input argument:
# - arg1: xR2RML mapping file
# - arg2: output file name (will be appended with an index)
# - arg3: maximum number of triples per output file
#
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
#
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

XR2RML=.
JAR=$XR2RML/morph-xr2rml-dist-1.3.1-jar-with-dependencies.jar

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <xR2RML mapping> <output file name> <max no. triples>"
  echo "Example:"
  echo "   $exe  mappingAlbum.ttl  album.ttl 100000"
  exit 1
}

# --- Read input arguments
mappingFile=$1
if [[ -z "$mappingFile" ]] ; then help; fi

output=$2
if [[ -z "$output" ]] ; then help; fi

maxTriples=$3
if [[ -z "$maxTriples" ]] ; then help; fi


# --- Init log file
mkdir $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_xr2rml_${collection}.log
echo -n "" > $log

echo "-- xR2RML mapping file --" >> $log
cat $mappingFile >> $log

echo "--------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx28g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$JAR" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile $mappingFile \
     --outputMaxTriples $maxTriples \
     --output $output \
     >> $log
date >> $log

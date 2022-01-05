#!/bin/bash

help()
{
  echo
  echo "$0 imports a set of RDF files (Turtle or NTriples) as a named graph into Virtuoso."
  echo
  echo "Usage:"
  echo "$0 --graph <graph URI> [--cleargraph] [--path <full path of data files>] file1 file2 ... fileN"
  echo "$0 [-h|--help]"
  echo
  echo "The path of files to import defaults to the current directory if not provided."
  echo "If option --cleargraph is mentioned, the graph is cleared before importing files."
  echo
  echo "Example:"
  echo "    ./virtuoso-import.sh --cleargraph --graph "http://localhost/graph_name" --path /home/user/rdf  *.nt  *.ttl"
  exit 1
}

# Default path is current directory
path=`pwd`
unset cleargraph
unset graph

while [  "$1" == "-h" -o   "$1" == "--help" -o  "$1" == "--graph" -o  "$1" == "--path" -o  "$1" == "--cleargraph" ]; do
  case "$1" in
    --graph ) graph=$2; shift;;
    --path ) path=$2; shift;;
    --cleargraph ) cleargraph=1;;
    -h | --help ) help;;
    *) echo "### ERROR: allowed parameters are '--graph <graph URI>', '--cleargraph' and '--path <path>'"; help;;
  esac
  shift
done

if [ -z "$graph" ]; then
    echo "Graph URI must be provided with option --graph."
    help
fi


#--- Prepare isql command file
tempfile=temp.${$}.isql
echo -n "" > $tempfile

if [ ! -z "$cleargraph" ]; then
    echo "log_enable(3,1);" >> $tempfile
    echo "SPARQL CLEAR GRAPH  <${graph}>;" >> $tempfile
fi

echo "delete from DB.DBA.LOAD_LIST;" >> $tempfile
while [ ! -z "$1" ]; do
    echo "ld_dir ('${path}', '$1', '${graph}');" >> $tempfile
    shift
done

echo "rdf_loader_run();"  >> $tempfile
cat $tempfile

#--- Run file against isql
cat $tempfile | /appli/virtuoso/bin/isql -H localhost -U dba -P 'your password'

rm -f $tempfile

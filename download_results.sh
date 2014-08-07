#!/bin/bash

echo "Downloading results from the web......"

#for csvfile in $(ls results_mesh); do
#  echo $csvfile
#done

COUNTER=0
INDEX=892
while [ $COUNTER -lt 5 ]; do
  echo "The counter is $COUNTER"
  
  rake mturk:sync_all
  if [ "$?" = "0" ]; then
    let COUNTER=COUNTER+1
    let INDEX=INDEX+1
    rake annotation:export_by_task["mesh","../results_mesh/results$INDEX.csv"]
  else
    echo "Error while sync_all" 1>&2
    let INDEX=INDEX+1
    rake annotation:export_by_task["mesh","../results_mesh/results$INDEX.csv"]
  fi
done



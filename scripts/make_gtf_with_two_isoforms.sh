#!/bin/bash

awk -F"\t" '$3 == "transcript" { print ;}' $1 >> ../gtfs/temp.gtf

while read p; do
  gene_id=`echo $p | awk '{print $10}'` 
  isoform_num=$( grep -c $gene_id ../gtfs/temp.gtf )

  if [ $isoform_num -eq 2 ]; then
        echo  $p >> ../gtfs/two_isoforms.gtf
  fi
done < ../gtfs/temp.gtf

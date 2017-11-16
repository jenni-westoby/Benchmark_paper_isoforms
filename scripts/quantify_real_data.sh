#!/bin/bash

Kallisto() {

      #make a directory for the results of Kallisto for each cell
      filename=$1
      mkdir ../quant_results/$filename
      #EDIT LINE BELOW WHERE MARKED
      $TEAM/BLUEPRINT_latest_versions/Benchmarking_pipeline/Simulation/kallisto_linux-v0.43.1/kallisto quant -i <INSERT PATH TO KALLISTO INDEX> --threads=8 --output-dir=../quant_results/$filename ../fastqs/$filename'_1.fastq' ../fastqs/$filename'_2.fastq'

}

"$@"

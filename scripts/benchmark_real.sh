#!/bin/bash
#Quantification pipeline

benchmark(){

  memory=`pwd`

  #Run tool on simulated cells. Each cell is submitted as a seperate job.
  cd $2
  for i in $(find . -name '*_1.fastq*' -o -name '*_1.fq*');
  do
    base=`echo $i |awk -F/ '{print $2}'`
    filename=`echo $base |awk -F_1.fastq '{print $1}'`
    cd $memory
    #The line below will need to be edited for your LSF job system.
    bsub -n8 -R"span[hosts=1]" -c 99999 -G team_hemberg -q normal -o $TEAM/temp.logs/"output."$filename$1 -e $TEAM/temp.logs/"error."$filename$1 -R"select[mem>100000] rusage[mem=100000]" -M 100000 ./quantify_real_data.sh $1 $filename
  done

}

"$@"

# Benchmark_paper_isoforms
Repository with instructions to quantify the bulk RNA-seq data used in the final section of the results. Additionally,
a gtf file containing transcripts from genes with exactly two isoforms is generated.

1. Execute mkdir gtfs; mkdir fastqs, mkdir quant_results

2. Move RNA-seq fastq files of interest into fastqs.

3. Execute ./scripts/make_gtf_with_two_isoforms.sh /path/to/reference/gtf. This will create a gtf file containing only
transcripts with two isoforms (gtfs/two_isoforms.gtf). Note - this script assumes your gtf is an Ensembl reference.

4. Edit line 9 of quantify_real_data.sh so that your own Kallisto index is used.

4. Execute ./scripts/benchmark_real.sh benchmark Kallisto fastqs. This will use Kallisto to perform isoform quantification on
each file in your fastqs directory. Note, this script assumes your data is paired end reads. 

At the end of this pipeline, you will have a gtf file containing transcripts from genes with two isoforms and Kallisto 
abundance estimates from your RNA-seq files in quant_results. 

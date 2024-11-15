echo 'This script filters pair-end reads to a reference and creates 2 new .fastq.gz with the filtered reads'
echo 'Usage: filter_reads_with_reference <reference.fasta> <fastq1> <fastq2> <number of threads>'
#This script is part of the collection 'phylogenomic scripts' by Cássio van den Berg
#Please cite the repository https://github.com/cavdberg/phylogenomic-scripts
#works with fastq and fastq.gz, reference must be a fasta archive. The number of threads for bwa is mandatory
#version 2.00 10 July 2024
bwa index $1
bwa mem $1 $2 $3 -t $4 > mapeamento.bam
samtools sort -n mapeamento.bam -o mapeamento.sorted.bam
rm mapeamento.bam
samtools view -u -f 1 -F 12 mapeamento.sorted.bam > mapped_mapped.bam
samtools view -u -f 8 -F 260 mapeamento.sorted.bam > mapped_unmapped.bam
samtools view -u -f 4 -F 264 mapeamento.sorted.bam > unmapped_mapped.bam
rm mapeamento.sorted.bam
samtools merge -u mapped.bam mapped_mapped.bam unmapped_mapped.bam mapped_unmapped.bam
rm mapped_mapped.bam unmapped_mapped.bam mapped_unmapped.bam
samtools sort -n mapped.bam -o mapped.sorted.bam 
rm mapped.bam
bamToFastq -i mapped.sorted.bam -fq filtered.$1.1.fastq -fq2 filtered.$1.2.fastq
rm mapped.sorted.bam
rm $1.*
pigz *.fastq


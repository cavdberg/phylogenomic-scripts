# phylogenomic-scripts
Plaease cite the scripts as: 
van den Berg, C. (2024) Phylogenomic-scripts. Distributed by the author. https://github.com/cavdberg/phylogenomic-scripts/

INSTALLATION OF ENVIRONMENT TO RUN THE SCRIPTS IN THE REPOSITORY:

Version: 2.0 - 10 Jul 2024
Requirements: 

Samtools 1.6
bwa
bedtools (bamToFastq)
biopython

Environment installation (with conda):

conda create -n phyloscripts
conda install samtools=1.6
conda install bwa=0.7.17
conda install bedtools=2.31.1
conda install pigz
conda install biopython

Before using any of the scripts, please activate the environment:

conda activate phyloscripts

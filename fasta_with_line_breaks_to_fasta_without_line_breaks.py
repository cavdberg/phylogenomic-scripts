#! /usr/bin/python

print('This script requires Python 3')
print('Usage: fasta_with_line_breaks_to_fasta_without_line_breaks.py <name of fasta to read> <name of fasta to save>')
#This script is part of the collection 'phylogenomic scripts' by Cássio van den Berg
#Please cite the repository https://github.com/cavdberg/phylogenomic-scripts
#works with fasta and saves fasta
#version 1.00 3 May 2024

import sys
from Bio import SeqIO

entrada=sys.argv[1]
saida=sys.argv[2]
sequencias = SeqIO.parse(entrada,'fasta')

f=open(saida,'w')

for sequencia in sequencias:
	f.write('>'+sequencia.id+'\n')
	f.write(str(sequencia.seq)+'\n')
	
f.close()


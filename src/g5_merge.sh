#!/bin/bash

#$ -S /bin/sh
#$ -cwd

#Genotype gvcf files
java -jar /sw/apps/bioinfo/GATK/3.5.0/GenomeAnalysisTK.jar \
    -T GenotypeGVCFs \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    -I aligned.sort.MarkDup.IndelR.gvcf \
    -o aligned.sort.MarkDup.IndelR.vcf \
    -nct 16
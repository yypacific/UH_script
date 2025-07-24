#!/bin/bash

#$ -S /bin/sh
#$ -cwd

java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T RealignerTargetCreator \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    -I aligned.sort.MarkDup.bam \
    -o aligned.sort.MarkDup.IndelRealign.intervals

java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T IndelRealigner \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    -I aligned.sort.MarkDup.bam \
    -targetIntervals aligned.sort.MarkDup.IndelRealign.intervals \
    -o aligned.sort.MarkDup.IndelR.bam

#Index bam file
samtools index aligned.sort.MarkDup.IndelR.bam

#Generating gvcf files
java -jar /sw/apps/bioinfo/GATK/3.5.0/GenomeAnalysisTK.jar \
    -T HaplotypeCaller \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    -nct 16 -variant_index_type LINEAR -variant_index_parameter 128000 --emitRefConfidence GVCF -mbq 20 -minPruning 5 \
    -I aligned.sort.MarkDup.IndelR.bam \
    -o aligned.sort.MarkDup.IndelR.gvcf
#!/bin/bash

#$ -S /bin/sh
#$ -cwd

bwa mem -M -t 16 -R '@RG\tID:Sample_HF1\tSM:Sample_HF1' \
    /proj/b2017146/private/nobackup/Reference-5/galgal5.fa /proj/b2017146/INBOX/Sample_HF1//HF1_1.fq.gz /proj/b2017146/INBOX/Sample_HF1//HF1_2.fq.gz > file.sam

#Convert sam to bam
samtools view -bS file.sam > aligned.bam
samtools sort aligned.bam -o aligned.sort.bam
samtools index aligned.sort.bam
samtools flagstat aligned.sort.bam
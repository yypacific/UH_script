#!/bin/bash

#$ -S /bin/sh
#$ -cwd

picard MarkDuplicates \
    INPUT=aligned.sort.bam \
    OUTPUT=aligned.sort.MarkDup.bam \
    ASSUME_SORTED=true VALIDATION_STRINGENCY=SILENT METRICS_FILE=aligned.sort.MarkDup PROGRAM_RECORD_ID=null

#Index bam file
samtools index aligned.sort.MarkDup.bam
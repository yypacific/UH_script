#!/bin/sh

#$ -S /bin/sh
#$ -cwd

fastqc --extract --contaminants \
    /proj/b2015317/private/nobackup/UserDirectories/nima/from_glob/Contamination/adapters-tab-txt.list \
    -o Sample_HF1 \
    -t 2 \
    /proj/b2017146/INBOX/Sample_HF1//HF1_1.fq.gz /proj/b2017146/INBOX/Sample_HF1//HF1_2.fq.gz
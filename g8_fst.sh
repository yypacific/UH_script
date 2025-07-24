#!/bin/bash

#$ -S /bin/sh
#$ -cwd

vcf-query -l ${vcf} | grep -E 'UM' > Offense.txt
vcf-query -l ${vcf} | grep -E 'HM' > Defence.txt

vcftools --vcf SNP-PASS.vcf --weir-fst-pop Offense.txt --weir-fst-pop Defence.txt \
    --fst-window-size 10000 --fst-window-step 5000 --out SNP-PASS
#!/bin/bash

#$ -S /bin/sh
#$ -cwd

#Extract SNP and INDELs in separate files
java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    --variant aligned.sort.MarkDup.IndelR.vcf \
    -selectType SNP \
    -restrictAllelesTo BIALLELIC \
    -o aligned.sort.MarkDup.IndelR_SNP.vcf

java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    --variant aligned.sort.MarkDup.IndelR.vcf \
    -selectType INDEL \
    -o aligned.sort.MarkDup.IndelR_INDEL.vcf

#Extract quality data from vcf file by GATK:
java -jar /sw/apps/bioinfo/GATK/3.5.0/GenomeAnalysisTK.jar \
    -T VariantsToTable \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    -V aligned.sort.MarkDup.IndelR_SNP.vcf \
    --allowMissingData \
    -F CHROM -F POS -F QUAL -F AC -F BaseQRankSum -F ClippingRankSum -F DP -F FS -F MQ -F MQRankSum -F QD -F ReadPosRankSum \
    -o SNP_quality.txt
grep -e CHROM -e ^7 SNP_quality.txt > SNP_quality_chr7.txt

#Extract insert size
samtools view -f 66 *bam | auk '($9>0)' | cut -f9 >IS
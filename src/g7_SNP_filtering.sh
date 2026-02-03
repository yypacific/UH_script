#!/bin/bash

#$ -S /bin/sh
#$ -cwd

#Filter SNPs based cut-off determined by evaluating the distribution in previous step
java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T VariantFiltration \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    --variant aligned.sort.MarkDup.IndelR_SNP.vcf \
    --filterExpression "QUAL < 100.0 " --filterName QUALfilter \
    --filterExpression " QD < 2.0" --filterName QDfilter \
    --filterExpression " FS > 30.0" --filterName FSfilter \
    --filterExpression "  MQ < 40 " --filterName MQfilter \
    --filterExpression "  BaseQRankSum < -2.0 ||  BaseQRankSum > 2.0" --filterName BaseQRankSumfilter \
    --filterExpression "  ClippingQRankSum < -2.0 ||  ClippingQRankSum > 2.0" --filterName ClipppingRankSumfilter \
    --filterExpression "  MQRankSum < -2.0 ||  MQRankSum > 2.0" --filterName MQRankSumfilter \
    --filterExpression "  ReadPosRankSum < -2.0 || ReadPosRankSum > 2.0" --filterName ReadPosRankSumfilter \
    -o SNP-FILTER.vcf

#Now you only extract SNPs that have passed the filtering (PASS)
java -jar /sw/apps/bioinfo/GATK/3.5.0//GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R /proj/b2017146/private/nobackup/Reference-5/galgal5.fa \
    --variant SNP-FILTER.vcf \
    --excludeFiltered -o SNP-PASS.vcf
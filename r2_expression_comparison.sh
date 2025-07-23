#!/bin/sh

#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=16G -l mem_req=16G

proj=~/UMHM_RNAseq

cuffdiff \
	-p 8 \
    -L UM,HM \
	-o ${proj}/Comparison_UMvsHM_gal5 \
	${proj}/reference_Ens/sensei/galgal5.gtf \
	${proj}/hisat2_galgal5/UM1first_gal5_sorted.bam,${proj}/hisat2_galgal5/UM2first_gal5_sorted.bam,${proj}/hisat2_galgal5/UM3_gal5_sorted.bam,${proj}/hisat2_galgal5/UM4_gal5_sorted.bam \
	${proj}/hisat2_galgal5/HM1first_gal5_sorted.bam,${proj}/hisat2_galgal5/HM2first_gal5_sorted.bam,${proj}/hisat2_galgal5/HM3_gal5_sorted.bam,${proj}/hisat2_galgal5/HM4_gal5_sorted.bam

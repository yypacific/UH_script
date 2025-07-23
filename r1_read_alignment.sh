#!/bin/sh

#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=16G -l mem_req=16G

proj=~/UMHM_RNAseq
sample=HM1first

/home/soft/hisat2-2.1.0/hisat2 \
	-p 4 \
	-x ${proj}/reference_Ens/galgal5_hisat/galgal5_hs2 \
	--dta-cufflinks \
	-1 ${proj}/raw_data/${sample}/${sample}_1.fq.gz \
	-2 ${proj}/raw_data/${sample}/${sample}_2.fq.gz \
	-S ${proj}/hisat2_galgal5/${sample}_gal5.sam

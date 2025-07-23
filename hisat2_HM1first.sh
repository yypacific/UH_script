#!/bin/sh

#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=16G -l mem_req=16G

/home/n-nozaki/soft/hisat2-2.1.0/hisat2 \
	-p 4 \
	-x /home/n-nozaki/UMHM_RNAseq/reference_Ens/galgal5_hisat/galgal5_hs2 \
	--dta-cufflinks \
	-1 /home/n-nozaki/UMHM_RNAseq/raw_data/HM1first/HM1first_1.fq.gz -2 /home/n-nozaki/UMHM_RNAseq/raw_data/HM1first/HM1first_2.fq.gz \
	-S /home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/HM1first_gal5.sam


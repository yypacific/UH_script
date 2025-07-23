#!/bin/sh

#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=16G -l mem_req=16G

/home/n-nozaki/soft/cufflinks-2.2.1.Linux_x86_64/cuffdiff \
	-p 8 \
                -L UM,HM \
	-o /home/n-nozaki/UMHM_RNAseq/Comparison_UMvsHM_gal5 \
	/home/n-nozaki/azabu_omics_RNA/reference_Ens/sensei/galgal5.gtf \
	/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/UM1first_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/UM2first_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/UM3_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/UM4_gal5_sorted.bam /home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/HM1first_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/HM2first_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/HM3_gal5_sorted.bam,/home/n-nozaki/UMHM_RNAseq/hisat2_galgal5/HM4_gal5_sorted.bam


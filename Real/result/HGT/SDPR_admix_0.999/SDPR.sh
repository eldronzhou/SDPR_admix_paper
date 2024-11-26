#!/bin/bash
#SBATCH -J SDPR_admix
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 20G

i=${SLURM_ARRAY_TASK_ID}

../../../SDPR_admix2/SDPR_admix -rho 0.999 -vcf ../../../genotype/Topmed/${i}.filter.vcf -msp ../../../genotype/Topmed/Rfmix/chr_${i}.msp.tsv -covar ../../../phenotype/SDPR/covar.txt -pheno ../../../phenotype/SDPR/height.txt -out ./res_${i}.txt

#/ysm-gpfs/pi/zhao/gz222/SDPR_admix/Real/SDPR_admix/score -score res.txt -vcf ../../../genotype/UKB/Phasing/Ukb_imp_v2_chr#.phased.vcf -msp ../../../genotype/UKB/Rfmix/chr_#.msp.tsv -out ../predict/SDPR_admix/res.txt

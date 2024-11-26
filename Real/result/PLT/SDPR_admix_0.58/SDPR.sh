#!/bin/bash
#SBATCH -J SDPR_admix
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 20G

i=${SLURM_ARRAY_TASK_ID}

../../../SDPR_admix/SDPR_admix -vcf ../../../genotype/Topmed/${i}.filter.vcf -rho 0.58 -msp ../../../genotype/Topmed/Rfmix/chr_${i}.msp.tsv -covar ../../../phenotype/SDPR/covar2.txt -pheno ../../../phenotype/SDPR/PLT.txt -out ./res_${i}.txt

#/ysm-gpfs/pi/zhao/gz222/SDPR_admix/RealSDPR_admix/score -score res.txt -vcf ../../../genotype/UKB/Phasing/Ukb_imp_v3_chr#.phased.vcf -msp ../../../genotype/UKB/Rfmix/chr_#.msp.tsv -out ../predict/SDPR_admix/res.txt

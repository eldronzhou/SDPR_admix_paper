#!/bin/bash
#SBATCH -J SDPR_admix
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 10G

i=${SLURM_ARRAY_TASK_ID}

../../../SDPR_admix/SDPR_admix -vcf ../../../genotype/discover/discover.vcf -msp ../../../genotype/discover/admix.msp.tsv -pheno ../../../phenotype/Scene1/discover/sim_${i}.pheno -out ./sim_${i}.txt

#!/bin/bash
#SBATCH -J SDPR_admix
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 10G

i=${SLURM_ARRAY_TASK_ID}

../../../SDPR_admix/SDPR_admix -pheno ../../../phenotype/Scene2/discover/sim_${i}.pheno -geno1 ../../../genotype/discover/X_afr.txt -geno2 ../../../genotype/discover/X_eur.txt -out ./sim_${i}.txt

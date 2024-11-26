#!/bin/bash
#SBATCH -J convert
#SBATCH --partition scavenge
#SBATCH --time 10:00 
#SBATCH -c 1 
#SBATCH --mem 10G

i=${SLURM_ARRAY_TASK_ID}

j=Scene4

module load R

Rscript sim_pheno.R ${i} ${j}


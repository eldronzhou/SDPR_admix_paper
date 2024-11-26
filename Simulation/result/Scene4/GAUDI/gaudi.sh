#!/bin/bash
#SBATCH -J GAUDI
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 30G

i=${SLURM_ARRAY_TASK_ID}

j=Scene4

module load R

Rscript ../../../software/GAUDI/R/fit_cv_fused_lasso.R  --gwas ../../../genotype/discover/GAUDI/${j}/sim_${i}.assoc.linear --gwas-col-id SNP --gwas-col-p P --la ../../../genotype/discover/GAUDI/la_matrix.mtx --col ../../../genotype/discover/GAUDI/colnames.txt --row ../../../genotype/discover/GAUDI/rownames.txt --train ../../../genotype/discover/GAUDI/colnames.txt --pheno ../../../phenotype/${j}/discover/sim_${i}.pheno --gaudi-path ../../../software/GAUDI/R/ --gamma-start 0 --gamma-stop 2 --gamma-by 0.5 --out sim_${i}

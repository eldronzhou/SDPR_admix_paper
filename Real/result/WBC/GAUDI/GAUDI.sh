#!/bin/bash
#SBATCH -J GAUDi
#SBATCH --partition week
#SBATCH --time 5-00:00:00 
#SBATCH -c 4
#SBATCH --mem 150G


module load R

Rscript ../../../../Simulate/software/GAUDI/R/merge_la_dosage.R .

Rscript ../../../../Simulate/software/GAUDI/R/fit_cv_fused_lasso.R  --gwas ../../../summary_stat/WBC/gwas.assoc.linear --gwas-col-id SNP --gwas-col-p P --la allChr_PAGE.la_dosage.mtx.gz --col allChr_PAGE.la_dosage.colnames  --row allChr_PAGE.la_dosage.rownames --pheno WBC.txt --gaudi-path ../../../../Simulate/software/GAUDI/R/ --start-p-exp -1 --end-p-exp -5 --sparsity FALSE --out res


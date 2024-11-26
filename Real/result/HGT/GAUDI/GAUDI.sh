#!/bin/bash
#SBATCH -J gaudi
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1
#SBATCH --mem 20G


module load R

#Rscript /ysm-gpfs/pi/zhao/gz222/SDPR_admix/Simulate/software/GAUDI/R/merge_la_dosage.R .

#Rscript ../../../../Simulate/software/GAUDI/R/fit_cv_fused_lasso.R  --gwas ../../../summary_stat/height/gwas.assoc.linear --gwas-col-id SNP --gwas-col-p P --la allChr_PAGE.la_dosage.mtx.gz --col allChr_PAGE.la_dosage.colnames  --row allChr_PAGE.la_dosage.rownames --pheno height.txt --gaudi-path ../../../../Simulate/software/GAUDI/R/ --start-p-exp -1 --end-p-exp -5 --sparsity FALSE --out res

Rscript ../../../../Simulate/software/GAUDI/R/apply_GAUDI.R --gaudi-path ../../../../Simulate/software/GAUDI/R/ --model res.best_list.RDS --target-la-dir ../../../genotype/UKB/GAUDI/ --out ../predict/GAUDI/gaudi

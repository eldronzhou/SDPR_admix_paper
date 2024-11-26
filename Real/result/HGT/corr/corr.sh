#!/bin/bash
#SBATCH -J admix
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 30G

admix genet-cor --pheno height.txt --grm-prefix ../../../genotype/Topmed/PLINK/admix-grm/merged --out-dir cor/

admix summarize-genet-cor -est-dir cor/ -out-prefix cor/cor

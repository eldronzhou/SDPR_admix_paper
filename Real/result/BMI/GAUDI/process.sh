#!/bin/bash
#SBATCH -J GAUDi
#SBATCH --partition scavenge
#SBATCH --time 5:00:00 
#SBATCH -c 1 
#SBATCH --mem 10G

i=${SLURM_ARRAY_TASK_ID}

module unload R

python /ysm-gpfs/pi/zhao/gz222/SDPR_admix/Simulate/software/GAUDI/python/py_vcf_to_la.py  --local-ancestry ../../../genotype/Topmed/Rfmix/chr_${i}.msp.tsv --vcf ../../../genotype/Topmed/all.filter.bcf --keep keep.sample --include ../../../summary_stat/BMI/clumped.snp --chr ${i} --out chr${i}_PAGE;

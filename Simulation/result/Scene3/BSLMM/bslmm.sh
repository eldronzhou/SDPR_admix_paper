#!/bin/bash
#SBATCH -J GEMMA
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 15G

i=${SLURM_ARRAY_TASK_ID}

module load GEMMA

gemma -g ../../../genotype/discover/gemma/discover.txt -notsnp -p ../../../phenotype/Scene3/discover/gemma/sim_${i}.pheno -k ../../../genotype/discover/gemma/output/discover.cXX.txt -bslmm 1 -s 100000 -w 10000 -outdir ./ -o sim_${i}

mkdir -p ../predict/BSLMM

gemma -g ../../../genotype/discover/gemma/discover.txt -notsnp -p ../../../phenotype/Scene3/discover/gemma/sim_${i}.pheno -k ../../../genotype/discover/gemma/output/discover.cXX.txt -epm sim_${i}.param.txt -emu sim_${i}.log.txt -ebv sim_${i}.bv.txt -predict 1 -outdir ../predict/BSLMM/ -o sim_${i}

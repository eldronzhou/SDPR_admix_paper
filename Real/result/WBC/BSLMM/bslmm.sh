#!/bin/bash
#SBATCH -J GEMMA
#SBATCH --partition scavenge
#SBATCH --time 2-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 70G

i=${SLURM_ARRAY_TASK_ID}

module load GEMMA

gemma -g ../../../genotype/GEMMA/gemma.bimbam -notsnp -p ../../../phenotype/gemma/WBC.txt -k ../../../genotype/GEMMA/output/gemma.cXX.txt -bslmm 1 -s 100000 -w 10000 -outdir ./ -o bslmm

mkdir -p ../predict/BSLMM

gemma -g ../../../genotype/GEMMA/gemma.bimbam -notsnp -p ../../../phenotype/gemma/WBC.txt -k ../../../genotype/GEMMA/output/gemma.cXX.txt -epm bslmm.param.txt -emu bslmm.log.txt -ebv bslmm.bv.txt -predict 1 -outdir ../predict/BSLMM/ -o bslmm

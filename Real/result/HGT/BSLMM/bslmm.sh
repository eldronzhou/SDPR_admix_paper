#!/bin/bash
#SBATCH -J GEMMA
#SBATCH --partition bigmem
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 400G


module load GEMMA

gemma -g ../../../genotype/GEMMA/gemma.bimbam -notsnp -p ../../../phenotype/gemma/height.txt -k ../../../genotype/GEMMA/output/gemma.cXX.txt -bslmm 1 -s 100000 -w 10000 -outdir ./ -o bslmm

mkdir -p ../predict/BSLMM

gemma -g ../../../genotype/GEMMA/gemma.bimbam -notsnp -p ../../../phenotype/gemma/height.txt -k ../../../genotype/GEMMA/output/gemma.cXX.txt -epm bslmm.param.txt -emu bslmm.log.txt -ebv bslmm.bv.txt -predict 1 -outdir ../predict/BSLMM/ -o bslmm
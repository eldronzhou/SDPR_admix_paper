#!/bin/bash
#SBATCH -J convert
#SBATCH --partition scavenge
#SBATCH --time 1-00:00:00 
#SBATCH -c 1 
#SBATCH --mem 15G

../../software/admix-simu/simu-mix.pl admix.dat ../rfmix/CEU.hapgen2.snp AA -CEU ../CEU/tmp.phgeno -YRI ../YRI/tmp.phgeno

#../../software/rfmix/rfmix -f AA.vcf -r ../HM3/CEU_YRI_22.vcf -m ../HM3/CEU_YRI.tsv -g ../rfmix/CEU_YRI.genetic_map2 -o admix --chromosome=22 --n-threads=4 -w 0.2 -G 9 -n 5 

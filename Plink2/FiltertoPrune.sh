#!/bin/bash
#SBATCH --job-name=Filter_beforePhase
#SBATCH --array=1-23
#SBATCH --nodes=1
#SBATCH --mem=8gb
#SBATCH --ntasks=23
#SBATCH --time=0-12:0
#SBATCH --mail-user=andre.luchessi@outlook.com
#SBATCH --mail-type=ALL
#SBATCH --output=/home/adluchessi/scratch/Filter_beforePhase.out
#SBATCH --error=/home/adluchessi/scratch/Filter_beforePhase.err

/home/adluchessi/plink2 --vcf LATINO_chr${array}.vcf.gz \
	--hwe 0.01 \
	--max-alleles 2 \
	--snps-only just-acgt \
	--maf 0.01 \
	--geno 1 \
	--indep-pairwise 50 1 0.1 \
	--keep sample_id.txt
	--make-bed \
	--threads 4 \
	--out LATINO_chr${array}_beforePhase 

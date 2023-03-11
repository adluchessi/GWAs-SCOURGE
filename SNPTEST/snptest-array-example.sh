#!/bin/bash
#SBATCH --job-name=post-snptest-hospRaquel
#SBATCH --array=1-23
#SBATCH --nodes=1
#SBATCH --mem=8gb
#SBATCH --ntasks=23
#SBATCH --time=0-12:0
#SBATCH --mail-user=andre.luchessi@outlook.com
#SBATCH --mail-type=ALL
#SBATCH --output=/home/adluchessi/scratch/my-snptest-job-hospRaquel.out
#SBATCH --error=/home/adluchessi/scratch/my-snptest-job-hospRaquel.err

srun /home/adluchessi/snptest_v2.5.6/snptest_v2.5.6  
		-data /home/adluchessi/data/ped_files/chr${SLURM_ARRAY_TASK_ID}.dose.maf01.R28.onlysnp.uniq3503.snptest.bed /home/adluchessi/data/pheno_files/pheno_oficial_hospitalization_Raquel_snptest.txt 
		-o /home/adluchessi/snptest_v2.5.6/results_files/hosp_raquel/hosp_raquel_${SLURM_ARRAY_TASK_ID}.out 
		-frequentist 1 
		-method expected 
		-pheno pheno 
		-cov_names age sex agesex agesquare PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10

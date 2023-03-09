#!/bin/bash
#SBATCH --job-name=post-snptest-sevcont
#SBATCH --array=1-23
#SBATCH --nodes=1 #número de nós
#SBATCH --ntasks=23 #número total de tarefas
#SBATCH --mem=5gb
#SBATCH --time=0-6:00
#SBATCH --mail-user=andre.luchessi@outlook.com
#SBATCH --mail-type=ALL
#SBATCH --output=/home/adluchessi/scratch/my-snptest-job-1.out
#SBATCH --error=/home/adluchessi/scratch/my-snptest-job-1.err

srun /home/adluchessi/snptest_v2.5.6/snptest_v2.5.6  \
        -data /home/adluchessi/ped_files/chr${SLURM_ARRAY_TASK_ID}.dose.maf01.R28.onlysnp.uniq3503.snptest.bed /home/adluchessi/pheno_files/pheno_oficial_severity_cont_snptest.txt \
        -o results_files/severity_cont/severity_cont_${SLURM_ARRAY_TASK_ID}.out \
        -frequentist 1 \
        -method expected \
        -pheno severity \
        -cov_names age sex agesquare agesex PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10

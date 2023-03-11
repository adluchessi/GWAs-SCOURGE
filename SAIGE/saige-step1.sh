#!/bin/bash

#SBATCH --array=1-23
#SBATCH --time=0-3:0
#SBATCH --job-name=saige-step1
#SBATCH --output=saige-step1.out
#SBATCH --error=saige-step1.err
#SBATCH --mail-user=andre.luchessi@ufrn.br
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1G

module load softwares/R/4.2.0-gnu8

Rscript /home/aprneta/Saige/step1_fitNULLGLMM.R \
  --plinkFile=/home/aprneta/ped_flies_beforphase_prune/LLATINO_chr${SLURM_ARRAY_TASK_ID}_beforePhase_prune \
  --phenoFile=/home/aprneta/Saige/pheno.saige.txt \
  --phenoCol=pheno \
  --covarColList=age sex agesquare agesex PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 \
  --qcovarColList=sex \
  --sampleIDColinphenoFile=IID \
  --traitType=binary \
  --outputPrefix=/home/aprneta/Saige/chr${SLURM_ARRAY_TASK_ID}-pheno \
  --nThreads=8 \
  --LOCO=FALSE

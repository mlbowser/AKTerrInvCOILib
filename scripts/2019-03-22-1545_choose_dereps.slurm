#!/bin/bash
#SBATCH --job-name=choosedereps 
#SBATCH -n 1 # number of nodes    
#SBATCH -n 1 # number of tasks 
#SBATCH -p long # parition
#SBATCH --account=bio # account code
#SBATCH --time=1-01:00:00 # requested job time D-HH:MM:SS
#SBATCH --mail-type=ALL # choose when you want to be emailed
#SBATCH --mail-user=matt_bowser@fws.gov # add your email address
#SBATCH -o 2019-03-22-0935_choose_dereps-%j.out # name of output file (the %j inserts the jobid)

module load R/3.5.1-gcc7.1.0

cd /home/mattbowser/AK_arhropod_COI_library

R CMD BATCH 2019-03-22-1545_choose_dereps.R 2019-03-22-1545_choose_dereps.txt

module purge
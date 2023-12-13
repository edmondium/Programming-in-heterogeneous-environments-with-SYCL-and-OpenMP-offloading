#!/bin/bash

#SBATCH --job-name    name
#SBATCH --cluster     vsc5
#SBATCH --reservation training_cpu
#SBATCH --qos         zen3_0512
#SBATCH --partition   zen3_0512
#SBATCH --mem         1G
#SBATCH --time        00:02:00
###########################

source /opt/sw/vsc4/VSC/x86_64/generic/intel/oneapi/setvars.sh 

###########################

export OMP_NUM_THREADS=4

echo "starting program Hello.x on the cpu"
echo "**********************************************"
00-Hello/00-Hello.x 
echo "**********************************************"

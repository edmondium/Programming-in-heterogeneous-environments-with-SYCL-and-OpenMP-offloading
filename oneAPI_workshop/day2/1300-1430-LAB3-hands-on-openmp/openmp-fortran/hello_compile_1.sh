#!/bin/bash

#SBATCH --job-name    name
#SBATCH --cluster     vsc5
#SBATCH --reservation training_cpu
#SBATCH --qos         zen3_0512
#SBATCH --partition   zen3_0512
#SBATCH --mem         1G
#SBATCH --time        00:05:00

###########################

source /opt/sw/vsc4/VSC/x86_64/generic/intel/oneapi/setvars.sh 

###########################

echo "**********************************************"
echo "compiling "
echo "ifx -fiopenmp Hello.f90 -o Hello.x"
echo "**********************************************"
ifx -fiopenmp 00-Hello/00-Hello.f90 -o 00-Hello/00-Hello.x 
echo "**********************************************"

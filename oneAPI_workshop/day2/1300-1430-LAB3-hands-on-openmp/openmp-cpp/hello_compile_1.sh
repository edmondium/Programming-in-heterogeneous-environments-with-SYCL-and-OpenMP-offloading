#!/bin/bash

#SBATCH --job-name    name
#SBATCH --cluster     vsc5
##SBATCH --reservation training_cpu
#SBATCH --qos         zen3_0512
#SBATCH --partition   zen3_0512
#SBATCH --mem         1G
#SBATCH --time        00:01:00

###########################

source /opt/sw/vsc4/VSC/x86_64/generic/intel/oneapi/setvars.sh 

###########################

echo "**********************************************"
echo "compiling "
echo "ifx -fiopenmp -fopenmp-targets=spir64 Hello.cpp -o Hello.x"
echo "**********************************************"
icpx -fiopenmp 00-Hello/00-Hello.cpp -o 00-Hello/00-Hello.x 
echo "**********************************************"

#!/bin/bash

#SBATCH --job-name    name
#SBATCH --cluster     vsc5
##SBATCH --reservation training_cpu
#SBATCH --nodes       1
#SBATCH --qos         zen3_0512
#SBATCH --partition   zen3_0512
#SBATCH --time        00:01:00
###########################

source /opt/sw/vsc4/VSC/x86_64/generic/intel/oneapi/setvars.sh 

###########################

echo "starting program simple-sycl-app on the cpu"
echo "**********************************************"
./simple-sycl-app
echo "**********************************************"

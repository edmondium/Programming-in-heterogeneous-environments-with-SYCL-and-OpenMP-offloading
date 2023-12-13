#!/bin/bash

#SBATCH --job-name    your_jobname
#SBATCH --cluster     vsc5
# #SBATCH --reservation training_gpu
#SBATCH --qos         zen3_0512_a100x2_training
#SBATCH --partition   zen3_0512_a100x2
#SBATCH --gres        gpu:1
#SBATCH --time        00:01:00

###########################

spack unload
spack load cuda@11.8.0

source /opt/sw/vsc4/VSC/x86_64/generic/intel/oneapi/setvars.sh 
export LD_LIBRARY_PATH=/gpfs/opt/sw/cuda-zen/spack-0.19.0/opt/spack/linux-almalinux8-zen/gcc-9.5.0/gcc-12.2.0-nu5le4qn6edhcjiocq7wddclrvdj4xfg/lib64:$LD_LIBRARY_PATH    

###########################

echo "**********************************************"
echo "output of nvidia-smi"
echo "**********************************************"
nvidia-smi


echo "**********************************************"
echo "output of sycl-ls"
echo "**********************************************"
sycl-ls


echo "**********************************************"
echo "compiling "
echo "icpx -fsycl -fsycl-targets=nvptx64-nvidia-cuda,spir64_x86_64 simple-sycl-app.cpp -o simple-sycl-app"
echo "**********************************************"
icpx -fsycl -fsycl-targets=nvptx64-nvidia-cuda simple-sycl-app.cpp -o simple-sycl-app 

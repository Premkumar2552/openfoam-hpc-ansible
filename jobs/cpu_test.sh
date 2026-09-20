#!/bin/bash

#SBATCH --job-name=cpu_test
#SBATCH --partition=debug
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=00:02:00
#SBATCH --output=cpu_test_%j.out

echo "HPC job information"
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $SLURMD_NODENAME"
echo "CPUs allocated: $SLURM_CPUS_PER_TASK"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

echo ""
echo "CPU information"
lscpu | grep -E "Model name|CPU\(s\)|Core|Thread"

echo ""
echo "Memory"
free -h

echo ""
echo "Slurm environment"
env | grep SLURM | sort


#!/bin/bash

#SBATCH --job-name=pitzDaily
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G
#SBATCH --time=00:30:00
#SBATCH --output=/home/cfd07/CFD_Projects/HPC_Platform/results/pitzDaily_%j.out
#SBATCH --error=/home/cfd07/CFD_Projects/HPC_Platform/results/pitzDaily_%j.err

echo "======================================"
echo "OpenFOAM Slurm HPC Job"
echo "======================================"

echo "Job ID       : $SLURM_JOB_ID"
echo "Job Name     : $SLURM_JOB_NAME"
echo "Node         : $SLURMD_NODENAME"
echo "CPUs         : $SLURM_CPUS_PER_TASK"
echo "Memory       : $SLURM_MEM_PER_NODE"
echo "Start time   : $(date)"

echo ""
echo "===== LOADING OPENFOAM ====="

source /usr/lib/openfoam/openfoam2412/etc/bashrc

echo "OpenFOAM Version : $WM_PROJECT_VERSION"
echo "OpenFOAM Dir     : $WM_PROJECT_DIR"

echo ""
echo "===== EXECUTABLES ====="

which blockMesh
which checkMesh
which simpleFoam

CASE=/home/cfd07/CFD_Projects/HPC_Platform/openfoam/pitzDaily

cd "$CASE"

echo ""
echo "===== RUNNING BLOCKMESH ====="

blockMesh

echo ""
echo "===== RUNNING CHECKMESH ====="

checkMesh

echo ""
echo "===== RUNNING SIMPLEFOAM ====="

simpleFoam

echo ""
echo "======================================"
echo "JOB COMPLETED"
echo "======================================"

date

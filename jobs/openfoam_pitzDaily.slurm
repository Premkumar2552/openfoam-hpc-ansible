#!/bin/bash

#SBATCH --job-name=pitzDaily
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G
#SBATCH --time=00:30:00

PROJECT_DIR="$SLURM_SUBMIT_DIR"
CASE="$PROJECT_DIR/openfoam/pitzDaily"

echo "OpenFOAM Slurm job"
echo "Job ID: $SLURM_JOB_ID"
echo "Job name: $SLURM_JOB_NAME"
echo "Node: $SLURMD_NODENAME"
echo "CPUs: $SLURM_CPUS_PER_TASK"
echo "Memory: $SLURM_MEM_PER_NODE"
echo "Start time: $(date)"
echo "Project directory: $PROJECT_DIR"

echo ""
echo "Loading OpenFOAM"

source /usr/lib/openfoam/openfoam2412/etc/bashrc

echo "OpenFOAM version: $WM_PROJECT_VERSION"
echo "OpenFOAM directory: $WM_PROJECT_DIR"

echo ""
echo "Checking OpenFOAM executables"

which blockMesh
which checkMesh
which simpleFoam

cd "$CASE" || exit 1

echo ""
echo "Running blockMesh"

blockMesh

echo ""
echo "Running checkMesh"

checkMesh

echo ""
echo "Running simpleFoam"

simpleFoam

echo ""
echo "Job completed"

date

# Automated HPC Platform for OpenFOAM CFD

An Ansible-based HPC workflow for configuring and monitoring Slurm and running OpenFOAM CFD simulations through automated job submission and verification.

## Overview

This project demonstrates a reproducible workflow for running CFD simulations on an HPC environment using Ansible, Slurm and OpenFOAM.

The repository contains the Ansible playbooks, Slurm configuration template, job scripts and OpenFOAM case required to set up and run the workflow.

The workflow covers:

- HPC environment health checks
- Slurm service monitoring and remediation
- OpenFOAM installation verification
- Automated CFD job submission through Slurm
- OpenFOAM mesh and result verification
- Automated reporting of simulation status

## Workflow

```text
Ansible
   |
   v
HPC Health Check
   |
   v
Slurm Validation
   |
   v
OpenFOAM Verification
   |
   v
CFD Case
   |
   v
Slurm Job Submission
   |
   v
OpenFOAM Simulation
   |
   v
Mesh & Result Verification
   |
   v
HPC CFD Job Report

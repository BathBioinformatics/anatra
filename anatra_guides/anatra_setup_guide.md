#Anatra usage intro

1. Check user setup. Account is the project account (things charged to this account). Partition is the queue of nodes. 

```
sacctmgr show assoc where user=$USER format=User,Account,Partition
```

2. Set up slurmzy, the slurm wrapper script that simplifies job submission, and automatically makes a log of job activity. 
Path tells the shell where to find slurmzy, so slurmzy excutable. 
Need to edit default account to your default account!

```
export PATH=/mnt/lifesciences/shared-data/software/slurmzy/bin:$PATH
export SLURMZY_DEFAULT_ACCOUNT=pra-0066
export SLURMZY_DEFAULT_PARTITION=lifesci
```

3. Check slumrzy works
```
which -a slurmzy
slurmzy --help
```

4. Conda set up. Add conda-forge and bioconda channels (bioconda hosts bioinformatics software)
```
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --set channel_priority strict

#Load centrally maintained Anaconda module and initialise conda
#Create a conda environment 

module load anaconda
source "$(conda info --base)/etc/profile.d/conda.sh"

conda create -p /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/lexicmap -c bioconda lexicmap
```

5. Example of using slurmzy. This requests 2GB memory, 4 CPU and 6 hours of run time. Make sure script is executable. 
```
chmod 700 test.sh
slurmzy run 2 -c 4 -t 6 test  ./test.sh
```
6. Check running job and check stats of running job. Average RSS = mean RAM(memory) usage across time. MaxRSS= peak ram(memory) use
```
squeue --me

sstat -j  1004715.batch --format=JobID,MaxRSS,AveRSS
```

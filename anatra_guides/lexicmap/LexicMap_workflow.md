13th Jan 2026

# LexicMap example # 
Detailed guidance: https://bioinf.shenwei.me/LexicMap/tutorials/index/

For this example i want to search for a  hybrid plasmid in other bacteria. To do this, I will query the large-scale collection of bacterial assemblies in AllTheBacteria (ATB) using LexicMap.
ATB assemblies have been indexed and stored in a shared directory on Anatra.

**Step 1. Install lexicmap with conda **
```
#Load the HPC provided anaconda module
module load anaconda/2025.06

conda create -p /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/lexicmap -c bioconda lexicmap
```
**Step 2. Index Database **
ATB index database is already saved on anatra: /mnt/lifesciences/shared-data/AllTheBacteria/indexes/lexicmap/atb.lm

**Step 3. Use Slurmzy to submit a slurm script to Anatra. This script will Align the plasmid genome to ATB assemblies. **
Slurmzy ia s Slurm wrapper script, simplifies job submission and records job activity in a log file. 

Below we request 8GB, 8CPUs, and 10 hours. 
```
chmod 700 
slurmzy run 8 --cpu 8 -t 10 lexicmap ./lexicmap_search_atb.sh
```

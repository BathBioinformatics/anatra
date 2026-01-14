13th Jan 2026

# LexicMap example # 
Detailed guidance: https://bioinf.shenwei.me/LexicMap/tutorials/index/

Example: I have a hybrid plasmid and I want to know if the same plasmid exists in other bacteria. I will use the large-scale resource of bacterial assemblies, AllTheBacteria (ATB), and LexicMap. 
ATB has been indexed, so I can do a 'blast-like search' of my plasmid to find it in ATB. 

**Step 1. Install lexicmap with conda **
```
#Load the HPC provided anaconda module
module load anaconda/2025.06

conda create -p /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/lexicmap -c bioconda lexicmap
```
**Step 2. Index Database **
Fortunately ATB index database is already saved on anatra: /mnt/lifesciences/shared-data/AllTheBacteria/indexes/lexicmap/atb.lmi
If you need to build your own, follow the guidance. 

**Step 3. Align the plasmid genome to ATB genomes, searching for similar plasmids on a compute node. **
The search returns the top 100 hits, a minimum alignment length of 1000 and a minimum 70% identity match of HSP.

```
#!/bin/bash
#SBATCH --account=pra-0070
#SBATCH --output=lexicmap.out
#SBATCH --error=lexicmap.err
#SBATCH --time=04:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G
#SBATCH --partition=lifesci

#Load my conda environments
module load anaconda/2025.06
conda activate /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/lexicmap
#Paths to files & folders
reference='/mnt/lifesciences/shared-data/AllTheBacteria/indexes/lexicmap/atb.lmi'
plasmid='/mnt/lifesciences/pra-0066/users/ajrh20_alex/anatra/anatra_guides/lexicmap/example_hybrid_plasmid_CP153139.fasta'
output='/mnt/lifesciences/pra-0066/users/ajrh20_alex/anatra/anatra_guides/lexicmap/plasmid_search_atb.tsv'

#Run LexicMap search. 
lexicmap search \
    -d "$reference" \
    "$plasmid" \
    -o "$output" \
    --align-min-match-pident 70 \
    --min-qcov-per-hsp 0 \
    --min-qcov-per-genome 50 \
    --align-min-match-len 1000 \
    --top-n-genomes 100
```

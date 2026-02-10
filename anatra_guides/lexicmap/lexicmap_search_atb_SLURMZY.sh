#!/bin/bash
#SLURMZY VERSION

# This scripts searchs for a plasmid in the ATB database using the aligner LexicMap. 
# The search returns the top 100 hits, a minimum alignment length of 1000, a minimum 70% identity match of HSP. 

#Load my conda environments
module load anaconda/2025.06
conda activate /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/lexicmap
#Paths to files & folders
reference='/mnt/lifesciences/shared-data/AllTheBacteria/indexes/lexicmap/atb.lmi'
plasmid='/mnt/lifesciences/pra-0066/users/ajrh20_alex/anatra/anatra_guides/lexicmap/example_hybrid_plasmid_CP153139.fasta'
outputdir='/mnt/lifesciences/pra-0066/users/ajrh20_alex/anatra/anatra_guides/lexicmap/plasmid_search_atb'

#Run LexicMap search. 
lexicmap search \
    -d "$reference" \
    "$plasmid" \
    -o "$outputdir" \
    --align-min-match-pident 70 \
    --min-qcov-per-hsp 0 \
    --min-qcov-per-genome 50 \
    --align-min-match-len 1000 \
    --top-n-genomes 100



This is how the AllTheBacteria data was downloaded to anatra

## Lexicmap Indexes.

**Step1. Create conda env and install awscli**

```
conda create --prefix /mnt/lifesciences/pra-0066/users/ajrh20_alex/envs/aws -c conda-forge awscli
```

**Step2. Test aws** 

```
aws s3 ls s3://allthebacteria-lexicmap/202408/ --no-sign-request
```

Step3. Download index in tmux

```
tmux new -s lexicmap-index
aws s3 cp s3://allthebacteria-lexicmap/202408/ atb.lmi --recursive --no-sign-request
```

## sketchlib indexes
Downloaded release 0.2 + incremental release 2024-08, from
https://osf.io/rceq5/files/osfstorage


## ATB Assemblies

```
#!/bin/bash
output="/mnt/lifesciences/shared-data/AllTheBacteria/genomes/assemblies_download"
log="/mnt/lifesciences/shared-data/AllTheBacteria/genomes/wget_download.log"
err="/mnt/lifesciences/shared-data/AllTheBacteria/genomes/wget_download.err"
mkdir -p "$output"
while IFS=$'\t' read -r name url; do
  echo "$(date) downloading $name" >> "$log"
  wget -O "$output/$name" "$url"
done < unique_tarurls.tsv (edited) 
```

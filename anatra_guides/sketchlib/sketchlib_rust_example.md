#Example of sketchlib usage 
#Guidance on https://docs.rs/sketchlib/latest/sketchlib/
#Github 4 ways to install https://github.com/bacpop/sketchlib.rust?tab=readme-ov-file


#Example installl
#Step1 install rust and sketchlib
###Install rustup, rustup is a tool chain manager. Using --default-toolchain none, installs rustup only.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
#Source to make available in shell
source $HOME/.cargo/env
#Install the stable rust tool chain, installs rustc (the compiler) and cargo (the build and dependency manager)
rustup toolchain install stable
rustup default stable

#Check
rustc --version
cargo --version


#lone the sketchlib rust repository and build a release binary.
git clone https://github.com/bacpop/sketchlib.rust.git
cd sketchlib.rust
cargo build --release


#####Example of sketch of a reference genome##################
sketchlib sketch \
  -k 17 \
  --out S_agama_HC20_7700_SAL_DB3893AA_AS.result_sketch \
  S_agama_HC20_7700_SAL_DB3893AA.fasta


#######Compute ANI distances of Salmonella sketches and the All The Bacteria (ATB) aggregated sketch database ###########
#!/bin/bash

# Common paths
DB="/mnt/lifesciences/pra-0066/users/ajrh20_alex/masters_mutationspectra/atb/atb_sketchlib.aggregated.202408"
SKETCHDIR="/mnt/lifesciences/pra-0066/users/ajrh20_alex/masters_mutationspectra/Outbreak_representative_assemblies/sketchdb"

# Each dist comparison
sketchlib dist -k 17 --ani -o S_agama_HC20_7700_SAL_DB3893AA.tsv \
"$DB" \
"${SKETCHDIR}/S_agama_HC20_7700_SAL_DB3893AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_typhimurium_HC5_298160_SAL_FD8782AA.tsv \
"$DB" \
"${SKETCHDIR}/S_typhimurium_HC5_298160_SAL_FD8782AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o STEC_HC10_75047_ESC_ZA1934AA.tsv \
"$DB" \
"${SKETCHDIR}/STEC_HC10_75047_ESC_ZA1934AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_typhimurium_HC5_296366_SAL_TC7523AA.tsv \
"$DB" \
"${SKETCHDIR}/S_typhimurium_HC5_296366_SAL_TC7523AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_sonnei_HC10_463_ESC_WB4460AA.tsv \
"$DB" \
"${SKETCHDIR}/S_sonnei_HC10_463_ESC_WB4460AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_anatum_HC20_236760_SAL_KC0604AA.tsv \
"$DB" \
"${SKETCHDIR}/S_anatum_HC20_236760_SAL_KC0604AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_poona_HC5_164707_SAL_JB7720AA.tsv \
"$DB" \
"${SKETCHDIR}/S_poona_HC5_164707_SAL_JB7720AA_AS.result_sketch"

sketchlib dist -k 17 --ani -o S_typhimurium_HC10_138472_SAL_JC0397AA.tsv \
"$DB" \
"${SKETCHDIR}/S_typhimurium_HC10_138472_SAL_JC0397AA_AS.result_sketch"

echo "All distance calculations completed."


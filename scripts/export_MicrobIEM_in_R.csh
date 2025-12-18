#!/bin/sh
#
##SBATCH --job-name=QIIME2_single
#SBATCH --time=24:00:00
#SBATCH --tasks=1
#SBATCH --nodes=1
#SBATCH --partition=bigmem

module load qiime2/2023.5.1
module load r/4.2.0

source ./export_MicrobIEM_in_R.config

#taxonomy
echo "Export table"
date

qiime tools export \
 --input-path ${TABLE}\
 --output-path ${PREFIX}_dir

biom convert -i ${PREFIX}_dir/feature-table.biom -o ${PREFIX}_dir/feature-table.biom.txt --table-type="OTU table" --to-tsv

qiime tools export --input-path ${TAXA} --output-path ${TAXAPRE}_dir

#Only do this once
git clone https://github.com/LuiseRauer/MicrobIEM.git

#Remove the extra first line of the OTU table
grep -v "# Constructed from biom file" ${PREFIX}_dir/feature-table.biom.txt > ${PREFIX}_dir/feature-table.biom.txt2

#Remove \# and Change OTU ID to OTU_ID
perl ../../scripts/adjust_mat.pl ${PREFIX}_dir/feature-table.biom.txt2 > ${PREFIX}_dir/feature-table.biom.txt3

echo "End of script"
date


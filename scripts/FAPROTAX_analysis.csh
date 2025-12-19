#!/bin/sh
#
##SBATCH --job-name=QIIME2_single
#SBATCH --time=24:00:00
#SBATCH --tasks=5
#SBATCH --nodes=1
#SBATCH --partition=bigmem

module load qiime2/2023.5.1

source ./FAPROTAX_analysis.config

#get proper classifier

#echo the time for each
echo "Starting FAPROTAX analysis"
date

wget https://pages.uoregon.edu/slouca/LoucaLab/archive/FAPROTAX/SECTION_Download/MODULE_Downloads/CLASS_Latest%20release/UNIT_FAPROTAX_1.2.12/FAPROTAX_1.2.12.zip

unzip FAPROTAX_1.2.12.zip

qiime taxa collapse \
--i-table ${TABLE} \
--i-taxonomy ${TAXA} \
--p-level 7 \
--o-collapsed-table ${PREFIX}_dada2_l7.qza

qiime feature-table rarefy \
 --i-table ${PREFIX}_dada2_l7.qza\
 --p-sampling-depth 30947\
 --o-rarefied-table ${PREFIX}_dada2_l7_rare.qza


qiime tools export \
 --input-path ${PREFIX}_dada2_l7_rare.qza\
 --output-path ${PREFIX}_dada2_l7_rare_dir

FAPROTAX_1.2.12/collapse_table.py -i ${PREFIX}_dada2_l7_rare_dir/feature-table.biom -o ${PREFIX}_dada2_l7_rare_dir/feature-table_FAPROTAX.txt -r ${PREFIX}_dada2_l7_rare_dir/FAPROTAX_report.txt -l ${PREFIX}_dada2_l7_rare_dir/FAPROTAX_log.txt --input_groups_file FAPROTAX_1.2.12/FAPROTAX.txt --missing_entry NO_FAPROTAX_ASSIGNMENT

echo "End of script"
date


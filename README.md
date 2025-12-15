# 16S_analysis_Rockfish_SR_Biomass
16S rRNA gene analysis on the Rockfish cluster to analyze the microbial community of sulfate reducing enrichment cultures grown on different biomass substrates.

This is a guide to the analysis of the microbial community used for manuscript Mohammed et al. "Changing organic matter availability is insufficient to explain changes in the apparent fractionation of modern sulfate-reducing systems".

Begin by downloading the raw data from NCBI (BioProject XXXX), cloning this repository, and executing the following commands.

#Dada2 works best to identify errors at the sequencing run level. Thus, for each separate MiSeq run (BoxA, BoxB), import and run dada2 separately:

sbatch ../../scripts/manifest_import.csh

#Once complete, check the demux.qzv file

#Next, run dada2 on each sequence run (BoxA, BoxB) separately

#cp and manually update the config file

cp ../../config_files/dada2_only.config .

#submit the dada2 script for each (will take a long time)

sbatch ../../scripts/dada2_only.csh

#Merge the two outputs in a new folder (kabirs_merged)

cp ../../config_files/qiime2_merge_sequence.config .

sbatch ../../scripts/qiime2_merge_sequence_2_runs.csh

#Make the taxonomy file to run MicrobIEM

cp ../../config_files/taxonomy_only.config .

sbatch ../../scripts/taxonomy_only.csh

#edit with the appropriate variables

#Including the path to the classifier

sbatch ../../scripts/taxonomy_only.csh



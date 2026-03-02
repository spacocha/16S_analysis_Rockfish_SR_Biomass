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

#Merge the two outputs in a new folder (e.g. make a new director called kabirs_merged and work in that folder)

cp ../../config_files/qiime2_merge_sequence.config .

#edit the config file for your specific analysis then run

sbatch ../../scripts/qiime2_merge_sequence_2_runs.csh

#Make the taxonomy file to run MicrobIEM

cp ../../config_files/taxonomy_only.config .

#Edit the config file and run

sbatch ../../scripts/taxonomy_only.csh

#Export and run MicrobIEM

cp ../../config_files/quality_control_biomass.config .

#Edit the config file and run the following script to clean contaminants
#note that this clones MicrobIEM, which should be done once
#It also uses a blast against a database of known contaminants
#Fianlly removes euks and mito sequences

sbatch ../../scripts/quality_control_biomass.csh

#Next, filter out the experimental samples and quantify the total number of reads to use

cp ../../config_files/filter_and_quantify.config .

#Then submit the script

sbatch ../../scripts/filter_and_quantify.csh

#Check the count file in ${PREFIX}_biomass_exp_group_dir/feature-table.biom.count.txt
#Use the first number as the sequence depth in the following file

cp ../../config_files/exp_only_moving_pictures.config .

#Then submit as

sbatch ../../scripts/exp_only_moving_pictures.csh

#Do the beta diversity analysis on BC and Weighted Unifrac distance matrices

cp ../../config_files/beta_group_significance.config .

#Submit the job

sbatch ../../scripts/beta_group_significance.csh

#Do FAPROTAX analysis of functions

#This includes downloading FAPROTAX, which should only be done once

cp ../../config_files/FAPROTAX_analysis.config .

#Adjust parameters and run

sbatch ../../scripts/FAPROTAX_analysis.csh

#Run the analysis on just the final timepoints

cp ../../config_files/FINAL_analysis.config .

#Edit the config file with parameters and run

sbatch ../../scripts/FINAL_analysis.csh

#Additional analyses can be run with the generic script

cp ../../config_files/filter_and_ANCOM_generic.config .

#Run this with the config file as a command line variable (./ is important)

sbatch ../../scripts/filter_and_ANCOM_generic.csh ./filter_and_ANCOM_generic.config

#export the PCs for the distance matrix you are interested in

sbatch ../../scripts/export_PCs_MATLAB.csh ./cleaned_grouped_MPA_core-metrics-results/bray_curtis_pcoa_results.qza ./cleaned_grouped_MPA_core-metrics-results/bray_curtis_pcoa_results_dir


#complete the analysis by making the metadata file with only the no inhibition final time points
#Then copy and submit the following
#Substate without inhibition is the variable being tested

cp ../../config_files/filtered_analysis_generic.config no_final_substrate_analysis.config .

#Submit with the correct config file (./ is important)

sbatch ../../scripts/filtered_analysis_generic.csh ./no_final_substrate_analysis.config


#complete the analysis by making the metadata file with only the inhibited final time points
#Then copy and submit the following
#substrate with inhibition is being tested

cp ../../config_files/filtered_analysis_generic.config yes_final_substrate_analysis.config .

#Submit with the correct config file (./ is important)

sbatch ../../scripts/filtered_analysis_generic.csh ./yes_final_substrate_analysis.config

#complete the analysis
#This provides differences between early and later time points

cp ../../config_files/filtered_analysis_generic.config start_analysis_substrate.config .

#the ./ is important

sbatch ../../scripts/filtered_analysis_generic.csh ./start_analysis_substrate.config                                         

#complete the analysis
#This provides differences between inhibition and no inhibition

cp ../../config_files/filtered_analysis_generic.config K0824_analysis_substrate.config .

#the ./ is important

sbatch ../../scripts/filtered_analysis_generic.csh ./K0824_analysis_substrate.config


#This needs to be edited so it's only the PCS (and labeled)
#I aligned the sample_metadata file so the order was the same, not sure if that's necessary

#Using MATLAB online, upload the following files to your MATLAB drive
#cleaned_grouped_MPA_taxonomy_barplots_T0_no.txt (T0 uninhibited)
#cleaned_grouped_MPA_taxonomy_barplots_T0_yes.txt (T0 inhibited)
#cleaned_grouped_MPA_taxonomy_barplots_T10_M.txt (T10 uninhibited)
#cleaned_grouped_MPA_taxonomy_barplots_T10_O.txt (T10 inhibited)
#cleaned_grouped_MPA_taxonomy_barplots_T5_M.tx (T5 uninhibited)
#cleaned_grouped_MPA_taxonomy_barplots_T5_NO.txt (T5 inhibited)

#Then open and run the following scripts from the editor
PCoA_plot_2.m
Taxa_plots_3_nbo.m

#The taxa bar chart legend has to be moved manually in MATLAB before being exported.

#Create the ASV analysis on substrates

sbatch filter_and_ANCOM_ASV.csh ./filter_and_ANCOM_ASV.config

#Pull out the sulfate reducing ASVs and compare between substrate types for uninhibited final time points

qiime tools export --input-path emp_paired_MPA_taxonomy.qza --output-path emp_paired_MPA_taxonomy_export_dir

perl ../../scripts/extract_functions_to_ASVs.pl FAPROTAX_analysis_dada2_l7_rare_dir/FAPROTAX_report.txt emp_paired_MPA_taxonomy_export_dir/taxonomy.tsv > function_ASV_output.txt

Filter table with ASVs with function: 

qiime tools export --input-path no_final_analysis_test2_filtered.qza --output-path no_final_analysis_test2_filtered_dir 

cd no_final_analysis_test2_filtered_dir
 
biom convert -i feature-table.biom -o feature-table.biom.txt --table-type="OTU table" --to-tsv 

perl ../../../scripts/filter_table_by_ASVs.pl feature-table.biom.txt ../function_ASV_output.txt respiration_of_sulfur_compounds > sulfate_reducing_feature-table.txt 


Import into qiime: 

biom convert -i sulfate_reducing_feature-table.txt -o sulfate_reducing_feature-table.biom --table-type="OTU table" --to-hdf5 

qiime tools import --input-path sulfate_reducing_feature-table.biom --type 'FeatureTable[Frequency]' --output-path sulfate_reducing_feature-table.qza 


Test with ANOSIM: 

qiime diversity beta-group-significance --i-distance-matrix Sulfate_reducers_only_analysis_weighted_unifrac_distance_matrix.qza --m-metadata-file ../sample-metadata_no_final_analysis2.tsv --m-metadata-column Substrate --p-method 'anosim' --o-visualization Sulfate_reducers_only_analysis_weighted_unifrac_anosim.qzv

perl ../../../scripts/filter_table_by_ASVs.pl feature-table.biom.txt ../function_ASV_output.txt fermentation > fermentation_feature-table.txt

biom convert -i fermentation_feature-table.txt -o fermentation_feature-table.biom --table-type="OTU table" --to-hdf5

qiime tools import --input-path fermentation_feature-table.biom --type 'FeatureTable[Frequency]' --output-path fermentation_feature-table.qza

qiime diversity-lib weighted-unifrac --i-table fermentation_feature-table.qza --i-phylogeny ../cleaned_grouped_MPA_rooted-tree.qza --o-distance-matrix fermentation_only_weighted_unifrac_distance_matrix.qza
(base) [sprehei1@bigmem25 no_final_analysis_test2_filtered_dir]$ qiime diversity beta-group-significance --i-distance-matrix fermentation_only_weighted_unifrac_distance_matrix.qza --m-metadata-file ../sample-metadata_no_final_analysis2.tsv --m-metadata-column Substrate --p-method 'anosim' --o-visualization fermentation_only_weighted_unifrac_anosim_Substrate.qzv




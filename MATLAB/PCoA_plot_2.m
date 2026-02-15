%Export results from QIIME bray curtis

PCs=readtable("Kabirs/PC_results.txt");
metadata=readtable("Kabirs/sample-metadata.tsv_biomass_exp_group_PC_sort.txt");

inhibitor_Cy_T0=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Cy", metadata.Timepoint == 0));
inhibitor_Eu_T0=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Eu", metadata.Timepoint == 0));

inhibitor_Cy_T5=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Cy", metadata.Timepoint == 5));
inhibitor_Eu_T5=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Eu", metadata.Timepoint == 5));

inhibitor_Cy_T10=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Cy", metadata.Timepoint == 10));
inhibitor_Eu_T10=and(metadata.Inhibitor == "yes", and(metadata.Substrate == "Eu", metadata.Timepoint == 10));

noinhibitor_Cy_T0=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Cy", metadata.Timepoint == 0));
noinhibitor_Eu_T0=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Eu", metadata.Timepoint == 0));

noinhibitor_Cy_T5=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Cy", metadata.Timepoint == 5));
noinhibitor_Eu_T5=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Eu", metadata.Timepoint == 5));


noinhibitor_Cy_T7=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Cy", metadata.Timepoint == 7));
noinhibitor_Eu_T7=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Eu", metadata.Timepoint == 7));

noinhibitor_Cy_T10=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Cy", metadata.Timepoint == 10));
noinhibitor_Eu_T10=and(metadata.Inhibitor == "no", and(metadata.Substrate == "Eu", metadata.Timepoint == 10));

hex_blue = '#0f9ed5';
rgb_blue = hex2rgb(hex_blue);

hex_green = '#4ea72e';
rgb_green = hex2rgb(hex_green);

%inhib T0 is circles, open (green blue)
scatter(PCs.PC1(noinhibitor_Cy_T0),PCs.PC2(noinhibitor_Cy_T0),50, rgb_blue,  'filled', LineWidth=1); hold on

scatter(PCs.PC1(noinhibitor_Cy_T5),PCs.PC2(noinhibitor_Cy_T5),50, rgb_blue,  'filled', 'diamond', LineWidth=1); hold on

scatter(PCs.PC1(noinhibitor_Cy_T7),PCs.PC2(noinhibitor_Cy_T7),150, rgb_blue,  'filled', 'hexagram', LineWidth=1); hold on

scatter(PCs.PC1(noinhibitor_Cy_T10),PCs.PC2(noinhibitor_Cy_T10),50, rgb_blue,  'filled', 'square', LineWidth=1); hold on

scatter(PCs.PC1(inhibitor_Cy_T0),PCs.PC2(inhibitor_Cy_T0),50, rgb_blue, LineWidth=1); hold on

scatter(PCs.PC1(inhibitor_Cy_T5),PCs.PC2(inhibitor_Cy_T5),50, rgb_blue, 'diamond',  LineWidth=1); hold on

scatter(PCs.PC1(inhibitor_Cy_T10),PCs.PC2(inhibitor_Cy_T10),50, rgb_blue, 'square',  LineWidth=1); hold on


scatter(PCs.PC1(noinhibitor_Eu_T0),PCs.PC2(noinhibitor_Eu_T0),50, rgb_green, 'filled', LineWidth=1); hold on

%noinhib T5 is diamonds, filled (green blue)

scatter(PCs.PC1(noinhibitor_Eu_T5),PCs.PC2(noinhibitor_Eu_T5),50, rgb_green,  'filled', 'diamond', LineWidth=1); hold on

%noinhib T7 is pentagram, filled (green blue)

scatter(PCs.PC1(noinhibitor_Eu_T7),PCs.PC2(noinhibitor_Eu_T7),150, rgb_green,  'filled', 'hexagram', LineWidth=1); hold on

%noinhib T10 is square, filled (green blue)

scatter(PCs.PC1(noinhibitor_Eu_T10),PCs.PC2(noinhibitor_Eu_T10),50, rgb_green,  'filled', 'square', LineWidth=1); hold on


scatter(PCs.PC1(inhibitor_Eu_T0),PCs.PC2(inhibitor_Eu_T0),50, rgb_green, LineWidth=1); hold on

%inhib T5 is diamonds, open (green blue)

scatter(PCs.PC1(inhibitor_Eu_T5),PCs.PC2(inhibitor_Eu_T5),50, rgb_green, 'diamond',  LineWidth=1); hold on

%inhib T10 is squares, open (green blue)

scatter(PCs.PC1(inhibitor_Eu_T10),PCs.PC2(inhibitor_Eu_T10),50, rgb_green, 'square',  LineWidth=1); hold on

%noinhibitor T10 is circles, filled (green blue)




%These are found in the ordination file as the first and second field
%under Proportion explained
xlabel('PC1 (26.9%)')
ylabel('PC2 (11.8%)')


legend("noinhib Cy T0", "noinhib Cy T5",  "noinhib Cy T7",  "noinhib Cy T10", "inhib Cy T0", "inhib Cy T5", "inhib Cy T10",   "noinhib Euk T0",  "noinhib Euk T5",  "noinhib Euk T7", "noinhib Euk T10","inhib Euk T0",  "inhib Euk T5",  "inhib Euk T10",  'location', ['eastoutside'])



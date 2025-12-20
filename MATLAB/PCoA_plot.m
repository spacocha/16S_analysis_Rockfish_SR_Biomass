%Export results from QIIME bray curtis

PCs=readtable("PC_results.txt");
metadata=readtable("sample-metadata_biomass_exp.txt");

inhibitor_Cy=and(metadata.Inhibitor == "yes", metadata.Substrate == "Cy");
inhibitor_Eu=and(metadata.Inhibitor == "yes", metadata.Substrate == "Eu");

noinhibitor_Cy=and(metadata.Inhibitor == "no", metadata.Substrate == "Cy");
noinhibitor_Eu=and(metadata.Inhibitor == "no", metadata.Substrate == "Eu");

nainhibitor_Cy=and(metadata.Inhibitor == "NA", metadata.Substrate == "Cy");
nainhibitor_Eu=and(metadata.Inhibitor == "NA", metadata.Substrate == "Eu");



scatter(PCs.PC1(inhibitor_Cy),PCs.PC2(inhibitor_Cy),40, metadata.Timepoint(inhibitor_Cy), "filled", LineWidth=1); hold on
colormap winter
scatter(PCs.PC1(inhibitor_Eu),PCs.PC2(inhibitor_Eu),40, metadata.Timepoint(inhibitor_Eu),  LineWidth=1); hold on

scatter(PCs.PC1(noinhibitor_Cy),PCs.PC2(noinhibitor_Cy),40, metadata.Timepoint(noinhibitor_Cy), "filled",'d', LineWidth=1); hold on
scatter(PCs.PC1(noinhibitor_Eu),PCs.PC2(noinhibitor_Eu),40, metadata.Timepoint(noinhibitor_Eu), 'd',  LineWidth=1); hold on

scatter(PCs.PC1(nainhibitor_Cy),PCs.PC2(nainhibitor_Cy),40, metadata.Timepoint(nainhibitor_Cy), "filled",'square', LineWidth=1); hold on
scatter(PCs.PC1(nainhibitor_Eu),PCs.PC2(nainhibitor_Eu),40, metadata.Timepoint(nainhibitor_Eu), 'square',  LineWidth=1); hold on
xlabel('PC1 (25.1%)')
ylabel('PC2 (13.3%)')

hc=colorbar('Location',['eastoutside']);

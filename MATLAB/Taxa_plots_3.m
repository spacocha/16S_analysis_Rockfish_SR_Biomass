%Make different boxes
clf
colormap jet
newcolors=rand(31,3);

newcolors(27,:)=hex2rgb("#B22222");
newcolors(31,:)=hex2rgb("#FF6347");
newcolors(19,:)=hex2rgb("#FF4500");
newcolors(5,:)=hex2rgb("#FF8C00");
newcolors(1,:)=hex2rgb("#FFD700");
newcolors(29,:)=hex2rgb("#B8860B");
newcolors(4,:)=hex2rgb("#EEE8AA");
newcolors(28,:)=hex2rgb("#808000");
newcolors(30,:)=hex2rgb("#FFFF00");
newcolors(3,:)=hex2rgb("#9ACD32");
newcolors(6,:)=hex2rgb("#556B2F");
newcolors(26,:)=hex2rgb("#7CFC00");
newcolors(7,:)=hex2rgb("#006400");
newcolors(25,:)=hex2rgb("#32CD32");
newcolors(8,:)=hex2rgb("#98FB98");
newcolors(24,:)=hex2rgb("#8FBC8F");
newcolors(9,:)=hex2rgb("#00FA9A");
newcolors(23,:)=hex2rgb("#2E8B57");
newcolors(10,:)=hex2rgb("#20B2AA");
newcolors(22,:)=hex2rgb("#008B8B");
newcolors(11,:)=hex2rgb("#00FFFF");
newcolors(21,:)=hex2rgb("#00CED1");
newcolors(12,:)=hex2rgb("#7FFFD4");
newcolors(20,:)=hex2rgb("#5F9EA0");
newcolors(13,:)=hex2rgb("#4682B4");
newcolors(2,:)=hex2rgb("#6495ED");
newcolors(14,:)=hex2rgb("#191970");
newcolors(18,:)=hex2rgb("#0000FF");
newcolors(15,:)=hex2rgb("#4B0082");
newcolors(17,:)=hex2rgb("#6A5ACD");
newcolors(16,:)=hex2rgb("#800080");

subplot(331)

%foreach different set to be plotted (subset in excel manually)
T0NOtaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T0_no.txt", "ReadRowNames",true);
[norow,nocol]=size(T0NOtaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T0NOtaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T0NOtaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);

xlabel('Samples')
ylabel('Relative abundance (%)')
title("(a) Day 0, Uninhibited")
%legend(T0NOtaxa.MinName);

grid on

subplot(332)

T0yestaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T0_yes.txt", "ReadRowNames",true);
[norow,nocol]=size(T0yestaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T0yestaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T0yestaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);
xlabel('Samples')
ylabel('Relative abundance (%)')
title("(b) Day 0, Inhibited")

legend(T0NOtaxa.MinName,Location="eastoutside");

grid on

subplot(334)


T5Mtaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T5_M.txt", "ReadRowNames",true);
[norow,nocol]=size(T5Mtaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T5Mtaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T5Mtaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);
xlabel('Samples')
ylabel('Relative abundance (%)')
title("(d) Day 5, Uninhibited")

grid on

subplot(335)

T5NOtaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T5_NO.txt", "ReadRowNames",true);
[norow,nocol]=size(T5NOtaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T5NOtaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T5NOtaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);
xlabel('Samples')
ylabel('Relative abundance (%)')
title("(e) Day 5, Inhibited")

grid on

subplot(337)

T10Mtaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T10_M.txt", "ReadRowNames",true);
[norow,nocol]=size(T10Mtaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T10Mtaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T10Mtaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);
xlabel('Samples')
ylabel('Relative abundance (%)')
title("(f) T10 Uninhibited")

grid on

subplot(338)

T10Otaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T10_O.txt", "ReadRowNames",true);
[norow,nocol]=size(T10Otaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T10Otaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T10Otaxa.Properties.VariableNames,newmat',"stacked");
colororder(newcolors);
xlabel('Samples')
ylabel('Relative abundance (%)')
title("(g) T10 Inhibited")



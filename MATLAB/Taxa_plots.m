%Make different boxes
clf
colormap jet
subplot(331)

%foreach different set to be plotted (subset in excel manually)
T0notaxa=readtable("Kabirs/cleaned_grouped_MPA_taxonomy_barplots_T0_no.txt", "ReadRowNames",true);
[norow,nocol]=size(T0notaxa);
clear newmat;
for k = 1:nocol
    test1=table2array(T0notaxa(:,k));
    newmat(:,k)=100*test1./sum(test1);
end

bar(T0notaxa.Properties.VariableNames,newmat',"stacked");
xlabel('Samples')
ylabel('Relative abundance')
title("(a) Day 0, Uninhibited")
%legend(T0notaxa.MinName);

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
xlabel('Samples')
ylabel('Relative abundance')
title("(b) Day 0, Inhibited")


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
xlabel('Samples')
ylabel('Relative abundance')
title("(c) Day 5, Uninhibited")

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
xlabel('Samples')
ylabel('Relative abundance')
title("(d) Day 5, Inhibited")

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
xlabel('Samples')
ylabel('Relative abundance')
title("(e) Day 10 Uninhibited")

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
xlabel('Samples')
ylabel('Relative abundance')
title("(f) Day 10 Inhibited")

legend(T0yestaxa.MinName);



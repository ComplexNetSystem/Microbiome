clear all
fileName = 'HostLifeStyle_Stool.xlsx';
sheetName = 'StoolA_day72to122_abroad';
line4operation = 75;
arr_Excl = xlsread(fileName,sheetName);
opeData = arr_Excl(1:line4operation,:);

clear fileName sheetName line4operation arr_Excl
%%%%----Log Transition----%%%%
for i = 1:size(opeData,1)
    for j = 1:size(opeData,2)
        opeData(i,j) = log10(opeData(i,j)+1);
    end
end
opeData = opeData/max(max(opeData)); % Heat Map Matrix
clear i j
%%%%----Overall Variability Points----%%%%
ave_row = zeros(size(opeData,1),1);
for i = 1:size(opeData,1)
    ave_row(i) = sum(opeData(i,:))/size(opeData,2);
end
fluc = abs(opeData - ave_row);  % Overall Variability Points
figure,plot(fluc(1,:))
clear i j
%%%%----Difference Variability Points----%%%%
addAveInColumn_1 = [ave_row,opeData];
diffOpeData = zeros(size(opeData,1),size(opeData,2));
for i = 1:size(opeData,2)
    diffOpeData(:,i) = abs(addAveInColumn_1(:,i+1)-addAveInColumn_1(:,i));
end
figure,plot(diffOpeData(1,:))    % Difference Variability Points
clear i addAveInColumn_1 ave_row
%%%%----Visualization----%%%%
figure,imagesc(opeData),colormap(hot),colorbar;

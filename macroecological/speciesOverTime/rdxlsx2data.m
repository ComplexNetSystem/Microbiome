function [hData,tData,pData] = rdxlsx2data(path)

fileStruct = dir(path);
fileCell = struct2cell(fileStruct);
fileNameCell = fileCell(1,:);
[m,n] = size(fileNameCell);
% hData = cell(1,n);pData = cell(1,n);
ii = 1; kk = 1; jj =1;
for i = 1:n
    if strfind(fileNameCell{i},'.xlsx')
        if strfind(fileNameCell{i},'Healthy')  % Change Here
            hData(ii) = {xlsread([path,'\',[fileNameCell{i}]])}; 
            ii = ii + 1;
        elseif strfind(fileNameCell{i},'Transitory')
            tData(kk) = {xlsread([path,'\',[fileNameCell{i}]])}; 
            kk = kk + 1;
        elseif strfind(fileNameCell{i},'Patient')  % Change Here
            pData(jj) = {xlsread([path,'\',[fileNameCell{i}]])};
            jj = jj + 1;
        end
    else
        continue;
    end
end
end

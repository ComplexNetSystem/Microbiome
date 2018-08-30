function [hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell(path)

fileStruct = dir(path);
fileCell = struct2cell(fileStruct);
fileNameCell = fileCell(1,:);
[m,n] = size(fileNameCell);

h_count = 0;t_count = 0;p_count = 0;
for i = 1:n
    if strfind(fileNameCell{i},'.xlsx')
        if strfind(fileNameCell{i},'Healthy')
            h_count = h_count + 1;
        elseif strfind(fileNameCell{i},'Transitory')
            t_count = t_count + 1;
        elseif strfind(fileNameCell{i},'Patient')
            p_count = p_count + 1;
        end
    end
end
hDataCellCell = cell(1,h_count);
tDataCellCell = cell(1,t_count);
pDataCellCell = cell(1,p_count);

ii = 1; kk = 1; jj =1;
for i = 1:n
    if strfind(fileNameCell{i},'.xlsx')
        if strfind(fileNameCell{i},'Healthy')  % Change Here
            [hValue,hText,hRaw] = xlsread([path,'\',[fileNameCell{i}]]); 
            hDataCellCell{ii} = hRaw;
            ii = ii + 1;
        elseif strfind(fileNameCell{i},'Transitory')
            [tValue,tText,tRaw] = xlsread([path,'\',[fileNameCell{i}]]); 
            tDataCellCell{kk} = tRaw;
            kk = kk + 1;
        elseif strfind(fileNameCell{i},'Patient')  % Change Here
            [pValue,pText,pRaw] = xlsread([path,'\',[fileNameCell{i}]]);
            pDataCellCell{jj} = pRaw;
            jj = jj + 1;
        end
    else
        continue;
    end
end
end

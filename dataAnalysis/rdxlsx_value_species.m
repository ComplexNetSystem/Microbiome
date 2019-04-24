function [hDataCell,hTextCell,pDataCell,pTextCell] = rdxlsx_value_species(path)

fileStruct = dir(path);
fileCell = struct2cell(fileStruct);
fileNameCell = fileCell(1,:);
[m,n] = size(fileNameCell);

h_count = 0;p_count = 0;
for i = 1:n
    if strfind(fileNameCell{i},'.xlsx')
        if strfind(fileNameCell{i},'Healthy') % Change Here, 'Healthy'-->'Transitory'
            h_count = h_count + 1;
        elseif strfind(fileNameCell{i},'Patient') % Change Here
            p_count = p_count + 1;
        end
    end
end
hDataCell = cell(1,h_count);hTextCell = cell(1,h_count);
pDataCell = cell(1,p_count);pTextCell = cell(1,p_count);

ii = 1; jj =1;
for i = 1:n
    if strfind(fileNameCell{i},'.xlsx')
        if strfind(fileNameCell{i},'Healthy')  % Change Here
            [hValue,hText,hRaw] = xlsread([path,'\',[fileNameCell{i}]]); 
            hDataCell{ii} = hValue;hTextCell{ii} = hText(2:end,1);
            ii = ii + 1;
        elseif strfind(fileNameCell{i},'Patient')  % Change Here
             [pValue,pText,pRaw] = xlsread([path,'\',[fileNameCell{i}]]);
             pDataCell{jj} = pValue;pTextCell{jj} = pText(2:end,1);
             jj = jj + 1;
        end
    else
        continue;
    end
end
end

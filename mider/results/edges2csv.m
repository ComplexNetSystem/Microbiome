function [fid,index,degreeMat] = edges2csv(filename,interValue)

[nrows,ncols] = size(interValue);
fid = fopen(filename,'w');
index = [];
degreeMat = zeros(nrows,3);
% in_degree = 0;degree = 0;
for x = 0 : nrows
    out_degree = 0;
    if x == 0
        fprintf(fid,['Source',',','Target',',','Weight',',','Type','\n']);
    else
        for y = 1 : ncols
            if y == x
                continue;
            elseif interValue(x,y) == 0
                continue;
            else
                fprintf(fid,['%d',',','%d',',','%d',',','directed','\n'],x,y,interValue(x,y));
                index = [index,x,y];
                out_degree = out_degree + 1;
                degreeMat(y,2) = degreeMat(y,2) + 1;
            end
        end
        degreeMat(x,1) = out_degree;
    end
end
fclose(fid);
degreeMat(:,3) = sum(degreeMat,2);
index = unique(index);

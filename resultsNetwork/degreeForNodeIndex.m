function [index,degreeMat] = degreeForNodeIndex(interValue)

interValue(logical(eye(size(interValue)))) = 0;
interValue = interValue * 1000;
[nrows,ncols] = size(interValue);
index = [];
degreeMat = zeros(nrows,3);
for x = 1 : nrows
    out_degree = 0;
    for y = 1 : ncols
        if y == x
            continue;
        elseif interValue(x,y) == 0
            continue;
        else
            index = [index,x,y];
            out_degree = out_degree + 1;
            degreeMat(y,2) = degreeMat(y,2) + 1;
        end
    end
    degreeMat(x,1) = out_degree;
end

degreeMat(:,3) = sum(degreeMat,2);
index = unique(index);

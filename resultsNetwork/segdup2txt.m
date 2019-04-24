function fid = segdup2txt(filename,interValue,color,degree,index)

interValue(logical(eye(size(interValue)))) = 0;
interValue = interValue * 1000;
[nrows,ncols] = size(interValue);
fid = fopen(filename,'w');
degree(find(degree > size(color,1))) = size(color,1);
for x = 1 : nrows
    start1 = 10;
    start2 = 10;
    for y = 1 : ncols
        if y == x
            continue;
        elseif interValue(x,y) == 0
            continue;
        else
            fprintf(fid,['%s',' ','%d',' ','%d',' ','%s',' ','%d',' ','%d',' ','%s',',','%s','\n'],['s',num2str(x)],round(start1),round(start1),['s',num2str(y)],round(start2),round(start2),['color=',num2str(color(round(degree(index(x))),1)),',',num2str(color(round(degree(index(x))),2)),',',num2str(color(round(degree(index(x))),3)),',',num2str(0.1)],['thickness=',num2str(10)]);%ceil(interValue(x,y)/10)
            start1 = start1 + interValue(x,y);
            start2 = start2 + interValue(x,y);
        end
    end

end
fclose(fid);


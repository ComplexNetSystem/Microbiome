function fid = nodes2csv(filename,vars,Entropy,TE_Data,index)

% [nrows,ncols] = size(vars);
fid = fopen(filename,'w');
fprintf(fid,['Id',',','Label',',','Entropy',',','TE','\n']);
for i = 1:length(index)
    fprintf(fid,['%d',',','%s',',','%f',',','%f','\n'],index(i),vars{index(i)},Entropy(index(i)),sum(TE_Data(index(i),:)));
end
fclose(fid);

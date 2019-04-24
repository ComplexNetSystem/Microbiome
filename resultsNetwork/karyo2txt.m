function fid = karyo2txt(filename,variables,degree,color,Entropy,index)

Entropy = Entropy * 100000;

degree(find(degree > size(color,1))) = size(color,1);

% [nrows,ncols] = size(vars);
fid = fopen(filename,'w');
% R = 0;G = 255;B = 255;
for i = 1:length(index)

    % fprintf(fid,['%s',' ','-',' ','%s',' ','%d',' ','%d',' ','%d',' ','%s','\n'],'chr',['s',num2str(index(i))],index(i),0,round(Entropy(index(i))),[num2str(color(degree(index(i)),1)),',',num2str(color(degree(index(i)),2)),',',num2str(color(degree(index(i)),3))]);
 %   fprintf(fid,['%s',' ','-',' ','%s',' ','%s',' ','%d',' ','%d',' ','%s','\n'],'chr',['s',num2str(index(i))],variables{index(i)},0,round(Entropy(index(i))),[num2str(color(round(degree(index(i))/2),1)),',',num2str(color(round(degree(index(i))/2),2)),',',num2str(color(round(degree(index(i))/2),3))]);
    fprintf(fid,['%s',' ','-',' ','%s',' ','%s',' ','%d',' ','%d',' ','%s','\n'],'chr',['s',num2str(index(i))],variables{index(i)},0,round(Entropy(index(i))),[num2str(color(round(degree(index(i))),1)),',',num2str(color(round(degree(index(i))),2)),',',num2str(color(round(degree(index(i))),3))]);
 
%     if G > 0
%         G = G - round(degree(index(i))/10);
%         if G <= 0
%             G = 0;
%         end
%         
%     elseif B > 0
%         B = B - round(degree(index(i))/10);
%         if B <= 0
%             B = 0;
%         end
%     elseif R < 255
%         R = R + round(degree(index(i))/10);
%         if R >= 255
%             R = 255;
%         end
%     else
%         G = G + round(degree(index(i))/10);
%     end
%     
end
fclose(fid);
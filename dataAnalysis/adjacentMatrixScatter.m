function adjacentMatrixScatter(adjMat)
[m,n] = size(adjMat);
% Plot dots for Adjacent Matrix.
figure;
for jj = 1:m
    x = find(adjMat(jj,:) ~= 0);
    y = jj * ones(1,length(x));
    scatter(x,y,80,'r','o','filled');hold on
end
xlim([1,m]);ylim([1,n])
set(gca,'YDir','reverse')
set(gca,'fontsize',28)
hold off
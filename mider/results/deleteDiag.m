function B = deleteDiag(A)
B = [];
[row,clm] = size(A);
for i = 1 : row
    B = [B;A(i,[1:i-1 i+1:clm])];
end


function min_lcm = multi_lcm(A)

n = length(A);
min_lcm = A(1);
for i = 1:n
    min_lcm = lcm(min_lcm,A(i));
end

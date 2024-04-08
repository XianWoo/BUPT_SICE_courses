%% Example 1

% solve equations
syms a b c d e;
v = [a, b, c, d, e];

n = length(v);

v = v(:);

R_tilde = Inf;

%error('error');

warning('warning');

A = sym(ones(n));

for j = n-1:-1:1
    A(:,j) = v.* A(:,j+1);
end

%% Example 2

B = 20;
C = 30;


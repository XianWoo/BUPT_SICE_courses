%% 余弦定律

a = 4.5;
b = 6;

c = a^2 + b^2 - 2 * a * b * cos(35 * 2*pi / 360);

%
c = a^2 + b^2 - 2 * a * b * cos(deg2rad(35));

%% 等额本金

A = 300 * 0.6;
beta = 0.045 / 12;
m = 30 * 12;

% A = 12;
% beta = 0.06/12;
% m = 12;

meiyuehuankuan = A / m;
meiyueshengyu = A:-meiyuehuankuan:0;

lixi = sum(meiyueshengyu .* beta);

% zonglixi = sum(lixi);

%% 等额本息

A = 300 * 0.6;

beta = 0.045 / 12;

m = 30 * 12;

%

% A = 12;
% beta = 0.06/12;
% m = 12;

yuehuankuan = A * beta * (1 + beta) ^ m / ((1+beta)^m - 1);

lixi2 = yuehuankuan * m - A;
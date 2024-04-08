function [ a, b ] = exch(a,b)
%EXCH exchange the value of two input parameters
%Detailed explanation goes here

global x y

disp(x)

disp(y)

x = x + 2;

y = y + 3;

temp=a;
a=b;
b=temp;

end
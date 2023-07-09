%% 
% 第9周作业
% 
% 1、第2周贷款问题：
% 
% |你想买一套|300|万元的房子，首付|40%|，贷款20年，等额本息，已知月还款额为1.2万元，求贷款月利率为多少？|
% 
% |(1) 编写 结合牛顿下山法和割线法的综合迭代方法求解函数，调用后求解；|
% 
% |（2）使用steffenson法求解。|
%% 
% |解体过程|
% 
% |（1）|

% 给出房贷利率计算方程，画曲线
%
r = 0.002 : .001:.005;
y = 180*r.*(1+r).^240./((1+r).^240-1)-1.2;
plot(r,y)
%%
% 牛顿下山法
[x,iter,X]=newton_down(@hw91,5e-3)
%%
% 牛顿下山割线法
y = @(x) 180*x.*(1+x).^240./((1+x).^240-1)-1.2;
[x,iter,X]=newton_down_secant(y,4.7e-3,4.6e-3)
%%
y = @(x) 180*x.*(1+x).^240./((1+x).^240-1)-1.2;
% y = @(x)180*(1+x/1000)^240-1.2*1000*((1+x/1000)^240-1)/x; %
% x相对于y太小了，需要用x/1000替换x才能使用steffenson法
[x,iter,X]=steffenson(y,4e-3)
%% 
% 
% 
% |2、用牛顿法求解二元方程组的根|
% 
% $$\left\lbrace \begin{array}{cc}x^2 \textrm{cos2x}+y^2 \textrm{sin2y}=1 & 
% \\x^3 +y^3 -6\textrm{cos2xy}=-1 & \end{array}\right.$$

% 第二道题解题过程：
% x = [-5:5];
% yy = [-5:5];
% figure
% hold on

% for y = yy
%     ff = [x.^2.*cos(2*x)+y.^2.*sin(2*y)-1;x.^3+y.^3-6*cos(2*x.*y)+1];
%     plot(x,ff(1,:),'r',x,ff(2,:),'b')
% end

% [x y] = meshgrid(-5:5);
% z1 = x.^2.*cos(2*x)+y.^2.*sin(2*y)-1;
% z2 = x.^3+y.^3-6*cos(2*x.*y)+1;
% surf(x,y,z1);
% hold on
% surf(x,y,z2)
z1 = @(x,y)x.^2.*cos(2*x)+y.^2.*sin(2*y)-1;
z2 = @(x,y)x.^3+y.^3-6*cos(2*x.*y)+1;
ezplot(z1,[-5,5,-5,5]);
hold on
h2 = ezplot(z2,[-5,5,-5,5]);
set(h2,'color','r')

%%

x0 = [-1; -1];
[x,iter,X]=newtong(@fg,x0)  % 牛顿法求根
%%
function [y,J]=fg(x)
    % 例4-9 非线性方程组
    % 函数文件描述，返回函数值和jacobi矩阵
    y=[x(1)^2*cos(2*x(1))+x(2)^2*sin(2*x(2))-1;x(1)^3+x(2)^3-6*cos(2*x(1)*x(2))+1];  % 计算函数值
    % 求Jacobi矩阵
    syms xx yy;  % 声明符号变量
    J=jacobian([xx^2*cos(2*xx)+yy^2*sin(2*yy)-1;xx^3+yy^3-6*cos(2*xx*yy)+1],[xx yy]);  % 求符号jacobi矩阵
    xx = x(1);
    yy = x(2);
    J=eval(J);  % 替换
    % J=subs(J,yy,x(2));  % 替换
end

function [y dy] = hw91(x)
% 例4-1 humps函数，返回函数值和一阶导数值
% 函数描述文件，主要功能是求解函数表达式的值及其导数值
    syms t
%     y = 180*t.*(1+t).^240./((1+t).^240-1)-1.2;;  % 计算函数值
    y = 180*(1+t)^240-1.2*((1+t)^240-1)/t;
    dy = diff(y);  % 求1阶导数
    t = x;
    dy = eval(dy);  % 求数值
    y = eval(y);
end
function [x,iter,X]=newton_down_secant(fun,x0,x1,eps,maxiter)
% Newton下山法求解非线性方程的根
% 输入参数：
%      ---fun：迭代函数
%      ---x0：初始迭代点
%      ---eps：精度要求，默认值为1e-6
%      ---maxiter：最大迭代次数，默认值为1e4
% 输出参数：
%      ---x：非线性方程的近似根
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<3,error('输入参数至少需要2个！'),end
if nargin<4|isempty(eps),eps=1e-6;end
if nargin<5|isempty(maxiter),maxiter=1e4;end
f0 = feval(fun,x0); % 计算x0处的函数值
f1 = feval(fun,x1); % 计算x1处的函数值
k=0;
while abs(x1-x0)>eps
    k = k+1;
    lambda=1;
    x2=x1-lambda*f1*(x1-x0)/(f1-f0);  % 割线法
    f2 = feval(fun,x2);
    while abs(f2)>=abs(f1) 
        lambda=lambda/2;  % 更新lambda
        x2=x1-lambda*f1*(x1-x0)/(f1-f0);;  % 牛顿下山迭代
        f2=feval(fun,x2);
    end
    f0 = f1;
    x0 = x1; x1 = x2;
    f1 = f2;
    X(k)=x2;
end
if k==maxiter
    error('迭代次数超限，迭代失败！')
end
x=x2;iter=k;X=X';

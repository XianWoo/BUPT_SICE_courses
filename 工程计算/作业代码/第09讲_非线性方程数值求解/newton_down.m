function [x,iter,X]=newton_down(fun,x0,eps,maxiter)
% Newton��ɽ���������Է��̵ĸ�
% ���������
%      ---fun����������
%      ---x0����ʼ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<2,error('�������������Ҫ2����');end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
k=1;tol=1;
while abs(tol)>eps
    lambda=1;
    [fx0,dfx0]=feval(fun,x0);
    x1=x0-lambda*fx0/dfx0;
    [fx1,dfx1]=feval(fun,x1);
    while abs(fx1)>=abs(fx0) 
        lambda=lambda/2;  % ����lambda
        x1=x0-lambda*fx0/dfx0;  % ţ����ɽ����
        [fx1,dfx1]=feval(fun,x1);
        %x0=x1;
    end
    tol=fx1/dfx1;
    k=k+1;
    x0=x1;
    X(k)=x1;
end

if k==maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x1;iter=k;X=X';
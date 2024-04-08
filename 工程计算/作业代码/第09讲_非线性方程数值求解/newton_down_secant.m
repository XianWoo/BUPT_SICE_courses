function [x,iter,X]=newton_down_secant(fun,x0,x1,eps,maxiter)
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
if nargin<3,error('�������������Ҫ2����'),end
if nargin<4|isempty(eps),eps=1e-6;end
if nargin<5|isempty(maxiter),maxiter=1e4;end
f0 = feval(fun,x0); % ����x0���ĺ���ֵ
f1 = feval(fun,x1); % ����x1���ĺ���ֵ
k=0;
while abs(x1-x0)>eps
    k = k+1;
    lambda=1;
    x2=x1-lambda*f1*(x1-x0)/(f1-f0);  % ���߷�
    f2 = feval(fun,x2);
    while abs(f2)>=abs(f1) 
        lambda=lambda/2;  % ����lambda
        x2=x1-lambda*f1*(x1-x0)/(f1-f0);;  % ţ����ɽ����
        f2=feval(fun,x2);
    end
    f0 = f1;
    x0 = x1; x1 = x2;
    f1 = f2;
    X(k)=x2;
end
if k==maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x2;iter=k;X=X';

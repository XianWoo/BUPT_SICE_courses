function [x,iter,X] = steffenson(fun,x0,eps,maxiter)
% Steffenson���������Է��̵ĸ�
% ���������
%      ---fun����������
%      ---x0����ʼ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<2,error('�������������Ҫ2����'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
k=0;err=1;
while abs(err)>eps;
    k=k+1;
    f0 = feval(fun,x0); % ����x0���ĺ���ֵ
    x1=x0-f0^2/(feval(fun,x0+f0)-f0);  % Steffenson��������ʽ
    err=x1-x0;
    x0 = x1; % ����x0��ֵ
    X(k)=x1;
end
x=x1;iter=k;X=X';

function [x,iter,X]=newtong(fun,x0,eps,maxiter)
% Newton���������Է�����ĸ�
% ���������
%      ---fun����������
%      ---x0����ʼ����������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---maxiter��������������Ĭ��ֵΪ1e4
% ���������
%      ---x�������Է��̵Ľ��ƽ�����
%      ---iter����������
%      ---X��ÿһ�������Ľ��
if nargin<2,error('�������������Ҫ2����'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
k=0;err=1;
while err>eps
    k=k+1;
    [fx0,J]=feval(fun,x0);  % ����fun��ֵ��jacobi����
    x1=x0-J\fx0;  % ţ�ٷ�������ʽ
    err=norm(x1-x0);
    x0=x1;
    X(k,:)=x1;
end
if k==maxiter
    error('�����������ޣ�����ʧ�ܣ�')
end
x=x1;iter=k;

function I=double_integral(fun,a,b,lowfun,upfun,m,n,varargin)
% һ����ʽ�Ķ��ػ�����ֵ���
% ���������
%       ---fun����������(�Ƕ�ά����)
%       ---a,b,lowfun,upfun����������lowfun,upfun��x�ĺ���
%       ---m��[a,b]����ĵȷ���
%       ---n��[lowfun,upfun]����ȷ���
%       ---p1,p2,...��fun��lowfun��upfun�ĸ��Ӳ���
% ���������
%       ---I������ֵ
if nargin<7|isempty(n),n=100;end
if nargin<6|isempty(m),m=100;end
hx=(b-a)/m;
x=a+(0:m)*hx;
for i=1:m+1
    ylow= feval(lowfun,x(i));
    yup=feval(upfun,x(i));
    hy=(yup - ylow)/n;
    y(i,:)=ylow+(0:n)*hy;
    f(i,:)=feval(fun,x(i),y(i,:));
    G(i)=trapz(y(i,:),f(i,:));
end
I=trapz(x,G);

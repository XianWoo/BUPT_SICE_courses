function I=Cotes(fun,a,b,n,varargin)
% ����Cotes��ʽ�����ֵ����(��֪����ԭ��)
% ���������
%      ---fun����������
%      ---a,b����������Ķ˵�
%      ---n������ȼ��ָ��������Ŀ
%      ---p1,p2,...��fun�ĸ��Ӳ���
% ���������
%      ---I����õĻ���ֵ
if nargin<4|isempty(n);
    n=1e4;
end
h=(b-a)/n;
x=a+h*(0:n);
fx=feval(fun,x,varargin{:});
%I=h*[(7*fx(1)+7*fx(end))+32*sum(feval(fun,x(2:4:end),varargin{:}))+...
    %12*sum(feval(fun,x(3:4:end),varargin{:}))+...
    %32*sum(feval(fun,x(4:4:end),varargin{:}))+...
    %14*sum(feval(fun,x(5:4:end),varargin{:}))]/90;
I=h*[(7*fx(1)+7*fx(end))+32*sum(feval(fun,x(1:end-1)+1/4*h,varargin{:}))+...
    12*sum(feval(fun,x(1:end-1)+1/2*h,varargin{:}))+...
    32*sum(feval(fun,x(1:end-1)+3/4*h,varargin{:}))+...
    14*sum(feval(fun,x(1:end-1)+h,varargin{:}))]/90;  % ��ʽ8-14

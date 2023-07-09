function I=simpson(fun,a,b,n,varargin)
% ��������ɭ��ʽ�����ֵ����(��֪����ԭ��)
% ���������
%      ---fun����������
%      ---a,b����������Ķ˵�
%      ---n������ȼ��ָ��������Ŀ
%      ---��p1,p2,��������fun�ĸ��Ӳ���
% ���������
%      ---I����õĻ���ֵ
if nargin<4|isempty(n)
    n=1e4;
end
h=(b-a)/n;
x=a+h*(0:n);
fx=feval(fun,x,varargin{:});
I=h*[fx(1)+fx(end)+2*sum(fx(2:end-1))+...
    4*sum(feval(fun,(x(1:end-1)+x(2:end))/2,varargin{:}))]/6;  % ��ʽ8-11

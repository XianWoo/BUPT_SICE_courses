function I=trape(fun,a,b,n,varargin)
% �������ι�ʽ�����ֵ����
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
h=(b-a)/n;  % ����
x=a+h*(0:n);  % �ڵ�
fx=feval(fun,x,varargin{:});  % ��ȡx���ĺ���ֵ
I=h*[(fx(1)+fx(end))+2*sum(fx(2:end-1))]/2;  % ��ʽ8-9

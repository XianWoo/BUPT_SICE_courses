function I=quad_inf(fun,a,b,tol,eps)
% ��������Ļ���
% ���������
%       ---fun����������
%       ---a,b����������Ķ˵㣬Ҫ��a<b
%       ---tol������Ҫ�������������֣�ȱʡֵΪ1e-6
%       ---eps������Ҫ�󣬵�����ֹ׼��ȱʡֵΪ1e-5
% ���������
%       ---I����õĻ���ֵ
if nargin<5|isempty(eps);eps=1e-5;end;
if nargin<4|isempty(tol);tol=1e-6;end;
N=2;I=0;T=1;
if isinf(a)&isinf(b)
    I=quad_inf(fun,-inf,0)+quad_inf(fun,0,inf);  % �ݹ����
elseif isinf(b)
    while T>eps
        b=a+N;
        T=quadl(fun,a,b,tol);
        I=I+T;
        a=b; N=2*N;
    end
elseif isinf(a)
    while T>eps
        a=b-N;
        T=quadl(fun,a,b,tol);
        I=I+T;
        b=a; N=2*N;
    end
else
    I=quadl(fun,a,b,tol);
end

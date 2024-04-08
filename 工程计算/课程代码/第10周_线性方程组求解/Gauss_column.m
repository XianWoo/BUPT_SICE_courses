function [U,x]=Gauss_column(A,b)
% ����ԪGauss��ȥ��������Է�����
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
% ���������
%      ---U����Ԫ��������Ƿ�������������
%      ---x�����Է�����Ľ�
n=length(b);
for k=1:(n-1)
    % ѡ��Ԫ
    [Y,I]=max(abs(A(k:n,k)));
    I=I+k-1;
    if I>k
        t=A(k,:); A(k,:)=A(I,:); A(I,:)=t;
        t=b(k); b(k)=b(I); b(I)=t;
    end
    % ��Ԫ
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n)=b(k+1:n)-m*b(k);
    A(k+1:n,k)=zeros(n-k,1);
end
U=[A,b];
% �ش�
x=zeros(n,1);
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end

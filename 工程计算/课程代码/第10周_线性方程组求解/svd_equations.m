function x=svd_equations(A,b)
% ����ֵ�ֽ��������(��̬)������
% ���������
%       ---A���������ϵ������
%       ---b����������Ҷ�����
% ���������
%       ---x�����Է�����Ľ�
ep=1e-10;n=length(A);
[U,S,V]=svd(A);
s=diag(S);
x=zeros(n,1);
for i=1:n
    if abs(s(i))>=ep
        x=x+(U(:,i)'*b)/s(i)*V(:,i);
    end
end

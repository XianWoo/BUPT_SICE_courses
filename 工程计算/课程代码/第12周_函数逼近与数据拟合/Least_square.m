function [A,b,p]=Least_square(wfun,phifun,x,y)
% ��С�������
% ���������
%      ---wfun��Ȩϵ��
%      ---phifun����ϻ�����
%      ---x,y����֪���ݵ�x,y����
%      ---n��������ϵĴ�����Ĭ��ֵΪ1
% ���������
%      ---A�����������ϵ������
%      ---b������������Ҷ�����
%      ---p����С�������ϵ��
phifun=phifun(x);
n=size(phifun,1);
A=zeros(n);
for i=1:n
    for j=1:n
        A(i,j)=sum(wfun(i).*phifun(i,:).*phifun(j,:));
    end
    b(i)=sum(wfun(i).*phifun(i,:).*y);
end
b=b';
a=A\b;p= a';

function [y,D]=newton_interp(xdata,ydata,x)
% Newton��ֵ
% ���������
%       ---xdata�������Ľڵ������
%       ---ydata�������Ľڵ�������
%       ---x����Ҫ���в�ֵ�Ľڵ������
% ���������
%       ---y��Newton��ֵ������x���ĺ���ֵ
%       ---D�����̱�
n=length(xdata);m=length(ydata);
if n~=m
    error('��ֵ���ݳ��Ȳ��ȣ�');
end
D=zeros(n);D(:,1)=ydata';H=1;
for j=1:n-1
    for k=1:n-j
        if abs(xdata(j+k)-xdata(k))<eps
            error('�����n+1���ڵ㲻�ǻ���ġ�');
        end
        D(k,j+1)=(D(k+1,j)-D(k,j))/(xdata(j+k)-xdata(k));
    end
    H=H.*(x-xdata(j));
    L(j,:)=H;
end
L=[ones(size(x));L];
y=L.*repmat(D(1,:)',1,length(x));
% �ڸ߰汾����������ͬ��y=bsxfun(@times,D(1,:)',L);
y=sum(y);

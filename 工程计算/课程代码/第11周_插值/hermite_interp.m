function y=hermite_interp(xdata,ydata,ydot,x)
% hermite��ֵ
% ���������
%       ---xdata�������Ľڵ������
%       ---ydata�������Ľڵ�������
%       ---ydot��������ֵ�ڵ㴦�ĵ���ֵ����ȱʡֵ�þ������
%       ---x����Ҫ���в�ֵ�Ľڵ������
% ���������
%       ---y��Lagrange��ֵ������x���ĺ���ֵ
if isempty(ydot)==1
    ydot=gradient(ydata,xdata);
end
n=length(xdata);m=length(ydata);h=length(ydot);y=zeros(size(x));
if n~=m|n~=h|m~=h
    error('��ֵ���ݳ��Ȳ��ȣ�')
end
ii=1:n;y=zeros(size(x));
for i=ii
    ij=find(ii~=i);V=1;
    for j=1:length(ij)
        if abs(xdata(i)-xdata(ij(j)))<eps
            error('�����n+1���ڵ㲻�ǻ���ġ�');
        end
        V=V.*(x-xdata(ij(j))).^2/(xdata(i)-xdata(ij(j)))^2;
    end
    y=y+V.*((1-2*(x-xdata(i))*sum(1./(xdata(i)-xdata(ij))))*...
        ydata(i)+(x-xdata(i))*ydot(i));
end

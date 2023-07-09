function y=lagrange_interp(xdata,ydata,x)
% Lagrange��ֵ
% ���������
%       ---xdata�������Ľڵ������
%       ---ydata�������Ľڵ�������
%       ---x����Ҫ���в�ֵ�Ľڵ������
% ���������
%       ---y��Lagrange��ֵ������x���ĺ���ֵ
n=length(xdata);m=length(ydata);
if n~=m
    error('��ֵ���ݳ��Ȳ��ȣ�');
end
ii=1:n;y=zeros(size(x));
for i=ii
    ij=find(ii~=i);V=1;
    for j=1:length(ij)
        if abs(xdata(i)-xdata(ij(j)))<eps
            error('�����n+1���ڵ㲻�ǻ���ġ�');
        end
        V=V.*(x-xdata(ij(j)));
    end
    y=y+V*ydata(i)/prod(xdata(i)-xdata(ij));
end

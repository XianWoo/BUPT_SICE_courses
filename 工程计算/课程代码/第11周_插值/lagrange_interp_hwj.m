function y=lagrange_interp_hwj(xdata,ydata,x)
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
    
    % ���ݻ����Լ��
    for i=1:n-1
        for j=(i+1):n
            if abs(xdata(i)-xdata(j))<eps
                error('�����n+1���ڵ㲻�ǻ���ġ�');
            end
        end
    end
    
%     ii=1:n; 
    V = ones(n,length(x));
%     for i=ii
%         ij=find(ii~=i);
%         for j=1:length(ij)
%             V(i,:)=V(i,:).*(x-xdata(ij(j)))/(xdata(i)-xdata(ij(j)));
%         end
%     end
    
% lk(x)���������㷨
%     for i = 1:n
%         XN = ones(length(x),n);
%         XN = (x.'*ones(1,n)-(xdata.'*ones(1,length(x))).')./((xdata(i)-xdata).'*ones(1,length(x))).';
%         XN(:,i) = [];
%         V(i,:) = prod(XN.');
%     end
    
    for i = 1:n
        XN = ones(length(x),n);
        XN = (x.'-xdata)./(xdata(i)-xdata);
        XN(:,i) = [];
        V(i,:) = prod(XN.');
    end
    
    y = ydata*V;   % �豣֤y��������
end
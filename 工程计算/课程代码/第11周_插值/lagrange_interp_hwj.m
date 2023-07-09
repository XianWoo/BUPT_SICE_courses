function y=lagrange_interp_hwj(xdata,ydata,x)
% Lagrange插值
% 输入参数：
%       ---xdata：给定的节点横坐标
%       ---ydata：给定的节点纵坐标
%       ---x：需要进行插值的节点横坐标
% 输出参数：
%       ---y：Lagrange插值函数在x处的函数值
    n=length(xdata);m=length(ydata);
    if n~=m
        error('插值数据长度不等！');
    end
    
    % 数据互异性检查
    for i=1:n-1
        for j=(i+1):n
            if abs(xdata(i)-xdata(j))<eps
                error('输入的n+1个节点不是互异的。');
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
    
% lk(x)计算的替代算法
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
    
    y = ydata*V;   % 需保证y是行向量
end
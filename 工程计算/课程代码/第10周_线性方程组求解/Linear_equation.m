function [x,e]=Linear_equation(A,b)
% ���Է���������
% ���������
%       ---A���������ϵ������
%       ---b����������Ҷ�����
% ���������
%       ---x��������Ľ�
%       ---e��������
[m,n]=size(A);
r1=rank(A);
r2=rank([A b]);
if r1==r2
    if r1==n
        disp('��������ǡ���ģ���Ψһ�⣡')
        x=A\b;
        e=norm(A*x-b);
    else
        disp('��������Ƿ���ģ�������⣡')
        z=null(sym(A));   %����淶���Ļ���ռ�
        x0=sym(A)\sym(b);  %���һ���ؽ�
       
        colnum = size(z,2);
        k =[];
        for i = 1:colnum
            k = [k sym(['k' num2str(i)])];
        end
        
        x=x0+z*k.';   %ԭ���̵�ͨ��
        e=A*x-b;   %������׼ȷ��
    end
else
    disp('�������ǳ����ģ�ֻ����С���������µĽ⣡')
    x=A\b;
    e=norm(A*x-b);
end

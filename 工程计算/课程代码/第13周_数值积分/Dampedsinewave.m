function f=Dampedsinewave(t,xi)
alpha=atan(-xi/sqrt(1-xi^2)); %计算alpha
f=exp(-xi*t).*cos(t*sqrt(1-xi^2) +alpha)/cos(alpha) %求函数值
end
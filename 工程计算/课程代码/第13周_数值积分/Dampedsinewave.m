function f=Dampedsinewave(t,xi)
alpha=atan(-xi/sqrt(1-xi^2)); %����alpha
f=exp(-xi*t).*cos(t*sqrt(1-xi^2) +alpha)/cos(alpha) %����ֵ
end
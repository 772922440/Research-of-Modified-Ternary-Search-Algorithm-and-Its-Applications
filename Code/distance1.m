function [m] = distance1(p,q)
%UNTITLED3 此处显示有关此函数的摘要
%   输出的值是计算最短距离 p,q要求是弧度
% 解决的办法可以是加参量
R=90;
H=49;
r1=65;
sita1=52;
z1=0;
r2=39;
sita2=312;
z2=49;
sita1=hu(sita1);
sita2=hu(sita2);%弧度化
l=0;%初始化
r=(2*pi-sita2+sita1);%B点对应初始化
l=jiao(l);
r=jiao(r);
A=[r1,l,z1];%A B两个点
B=[r2,r,z2];
%%
if (abs(p-q) <= pi)
    m=yuxian(R,B(1),q-hu(B(2)))+yuxian(R,A(1),p-hu(A(2)))+sqrt(H*H+R*R*(abs(p-q))*(abs(p-q)));
else
    m=yuxian(R,B(1),q-hu(B(2)))+yuxian(R,A(1),p-hu(A(2)))+sqrt(H*H+R*R*(abs(p-q-pi))*(abs(p-q-pi)));
end


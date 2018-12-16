function [s] =yuxian(r1,r2,a)
%UNTITLED 此处显示有关此函数的摘要
%   余弦定理 %a要求是h弧度 r1 r2为两边的长度，a夹角
s=sqrt(r1.*r1+r2.*r2-2*r1.*r2.*cos(a))
end


function [m] = distance1(p,q)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �����ֵ�Ǽ�����̾��� p,qҪ���ǻ���
% ����İ취�����ǼӲ���
R=90;
H=49;
r1=65;
sita1=52;
z1=0;
r2=39;
sita2=312;
z2=49;
sita1=hu(sita1);
sita2=hu(sita2);%���Ȼ�
l=0;%��ʼ��
r=(2*pi-sita2+sita1);%B���Ӧ��ʼ��
l=jiao(l);
r=jiao(r);
A=[r1,l,z1];%A B������
B=[r2,r,z2];
%%
if (abs(p-q) <= pi)
    m=yuxian(R,B(1),q-hu(B(2)))+yuxian(R,A(1),p-hu(A(2)))+sqrt(H*H+R*R*(abs(p-q))*(abs(p-q)));
else
    m=yuxian(R,B(1),q-hu(B(2)))+yuxian(R,A(1),p-hu(A(2)))+sqrt(H*H+R*R*(abs(p-q-pi))*(abs(p-q-pi)));
end


%% ׼�������̻�Բ���߶ȺͰ뾶
clear,clc
tic
R=90;
H=49;
r1=65;
sita1=52;
z1=0;
r2=39;
sita2=312;
z2=49;
sita1=hu(sita1);%hu����
sita2=hu(sita2);%���Ȼ�
l=0;%��ʼ��
r=(2*pi-sita2+sita1);%B���Ӧ��ʼ��
sita1=l;
sita2=r;
%%
A=[r1,l,z1];%A B������
B=[r2,r,z2];
p=l;
q=s_p1(p);%����һ��p,����һ��q ������������
p=s_p2(q);%����һ��q,����һ��p
s1=distance1(q,p); %���� �������ĺ���
q=s_p1(p);
p=s_p2(q);
s2=distance1(q,p);
while abs(s2-s1)>0.001
    q=s_p1(p);
    p=s_p2(q);
    s1=s2;
    s2=distance1(q,p);
end
s1
toc
    


    
        
                
            
            

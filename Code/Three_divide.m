%% 准备条件刻画圆柱高度和半径
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
sita1=hu(sita1);%hu函数
sita2=hu(sita2);%弧度化
l=0;%初始化
r=(2*pi-sita2+sita1);%B点对应初始化
sita1=l;
sita2=r;
%%
A=[r1,l,z1];%A B两个点
B=[r2,r,z2];
p=l;
q=s_p1(p);%给定一个p,返回一个q 这是两个函数
p=s_p2(q);%给定一个q,返回一个p
s1=distance1(q,p); %函数 计算距离的函数
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
    


    
        
                
            
            

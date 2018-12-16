%%%遗传算法自编解决圆柱问题
clc;
clear all;
close all;
%% 自变量的取值范围：
tic
sita1=(100/180)*pi;
sita2=0;
R=90;
H=49;
r1=39;
r2=65;
lbx=0;%%;
ubx=sita1;%%;
lby=0;%%;
uby=sita1;%%;
%% 定义遗传算法
NIND=40;%种群大小
MAXGEN=50;%最大遗传代数 
PRECI=20;%个体长度
GGAP=0.95;%代沟
px=0.7;%交叉概率
pm=0.01;%变异概率
trace=zeros(3,MAXGEN);%寻优结果的初始值
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];%区域描述器（不懂这个）
Chrom=crtbp(NIND,PRECI*2);%创建任意离散种群 和变量多少有关系
%% 寻优开始
gen=0;%代计数器
XY=bs2rv(Chrom,FieldD);%初始种群的十进制转换
X=XY(:,1);Y=XY(:,2);
Objv=sqrt((R*R)+(r1*r1)-2*R*r1*cos(X-sita1))+sqrt(R*R+r2*r2-2*R*r2*cos(Y-sita2))+sqrt(H*H+(R*(X-Y)).^2);%目标函数
while gen<MAXGEN;
    Fitnv=ranking(Objv);%分配适应度值
    SelCh=select('sus',Chrom,Fitnv,GGAP);%选择
    SelCh=recombin('xovsp',SelCh,px);%重组
    SelCh=mut(SelCh,pm);%变异
    XY=bs2rv(SelCh,FieldD);%子代个体的十进制转换
    X=XY(:,1);Y=XY(:,2);
    ObjvSel=sqrt((R*R)+(r1*r1)-2*R*r1*cos(X-sita1))+sqrt(R*R+r2*r2-2*R*r2*cos(Y-sita2))+sqrt(H*H+(R*(X-Y)).^2);%子代目标函数
    [Chrom,Objv]=reins(Chrom,SelCh,1,1,Objv,ObjvSel);%重插入子代到父代，得到新种群
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;%计数器增加
    %获取每代的最优解及其序列，Y为最优解，I为个体的序号
    [Y,I]=max(Objv);
    trace(1:2,gen)=XY(I,:);%每代最优值
    trace(3,gen)=Y;
    bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
X=bestX;
Y=bestY;
Z=min(bestZ);
end
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
X=bestX;
Y=bestY;
Z=min(bestZ)
toc
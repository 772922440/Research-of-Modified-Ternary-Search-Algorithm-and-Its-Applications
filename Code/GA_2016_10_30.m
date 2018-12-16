%%%�Ŵ��㷨�Ա���Բ������
clc;
clear all;
close all;
%% �Ա�����ȡֵ��Χ��
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
%% �����Ŵ��㷨
NIND=40;%��Ⱥ��С
MAXGEN=50;%����Ŵ����� 
PRECI=20;%���峤��
GGAP=0.95;%����
px=0.7;%�������
pm=0.01;%�������
trace=zeros(3,MAXGEN);%Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];%���������������������
Chrom=crtbp(NIND,PRECI*2);%����������ɢ��Ⱥ �ͱ��������й�ϵ
%% Ѱ�ſ�ʼ
gen=0;%��������
XY=bs2rv(Chrom,FieldD);%��ʼ��Ⱥ��ʮ����ת��
X=XY(:,1);Y=XY(:,2);
Objv=sqrt((R*R)+(r1*r1)-2*R*r1*cos(X-sita1))+sqrt(R*R+r2*r2-2*R*r2*cos(Y-sita2))+sqrt(H*H+(R*(X-Y)).^2);%Ŀ�꺯��
while gen<MAXGEN;
    Fitnv=ranking(Objv);%������Ӧ��ֵ
    SelCh=select('sus',Chrom,Fitnv,GGAP);%ѡ��
    SelCh=recombin('xovsp',SelCh,px);%����
    SelCh=mut(SelCh,pm);%����
    XY=bs2rv(SelCh,FieldD);%�Ӵ������ʮ����ת��
    X=XY(:,1);Y=XY(:,2);
    ObjvSel=sqrt((R*R)+(r1*r1)-2*R*r1*cos(X-sita1))+sqrt(R*R+r2*r2-2*R*r2*cos(Y-sita2))+sqrt(H*H+(R*(X-Y)).^2);%�Ӵ�Ŀ�꺯��
    [Chrom,Objv]=reins(Chrom,SelCh,1,1,Objv,ObjvSel);%�ز����Ӵ����������õ�����Ⱥ
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;%����������
    %��ȡÿ�������Ž⼰�����У�YΪ���Ž⣬IΪ��������
    [Y,I]=max(Objv);
    trace(1:2,gen)=XY(I,:);%ÿ������ֵ
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
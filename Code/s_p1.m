function [q] = s_p1(p)
%�̶�q����p�Ƕȵĺ���
%%
sita1=52;
sita2=312;
sita1=hu(sita1);
sita2=hu(sita2);%���Ȼ�
l=0;%��ʼ��
r=(2*pi-sita2+sita1);%B���Ӧ��ʼ��
%%
mid=(r+l)/2;
mmid=(r+mid)/2;
while r-l>0.001
    mid=(r+l)/2;
    mmid=(r+mid)/2;
    pan=distance1(mid,p)-distance1(mmid,p);
    if pan>0
        l=mid;
    else if(pan<0)
            r=mmid;
        else
            r = mmid;
            l=mid;
        end
    end
end
if distance1(l,p)<distance1(r,p)
    q=l;
else
    q=r;
end


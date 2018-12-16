function [p] = s_p2(q)
%固定q点求p角度的函数
%%
sita1=52;
sita2=312;
sita1=hu(sita1);
sita2=hu(sita2);%弧度化
l=0;%初始化
r=(2*pi-sita2+sita1);%B点对应初始化
%%
l=0;
r=(2*pi-sita2+sita1);
mid=(r+l)/2;
mmid=(r+mid)/2;
while r-l>0.001
    mid=(r+l)/2;
    mmid=(r+mid)/2;
    pan=distance1(q,mid)-distance1(q,mmid);
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
if distance1(q,l)<distance1(q,r)
    p=l;
else
    p=r;
end

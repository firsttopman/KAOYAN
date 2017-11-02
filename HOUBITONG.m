function HOUBITONG
clear
clc
X=11;
Y=31;
THETA=0.5*pi;
RHO=5;
NGASPT=1; 
SS=surf_g(THETA,RHO,X,Y)

function [RCX,RCY]=segmentation(RHO,THETA,X,Y) %RHO MEAN ¦Ñ £» THETA ¦È ; 
RCX=zeros(X,1);
RCY=zeros(Y,1);
for I=1:X
    RCX(I)=RCX(I)+RHO*(1+(I-1)/(X-1));
end
for I=1:Y
    RCY(I)=RCY(I)+THETA*((I-1)/(Y-1));
end  

function [SS]=surf_g(THETA,RHO,X,Y)
SS=0;
POSGP=-0.0000000000000000;
WEIGP=2.000000000000000000;
[RCX,RCY]=segmentation(RHO,THETA,X,Y);
for IX=1:X-1
    D1=(RCX(IX+1)-RCX(IX))/2;
    D11=(RCX(IX+1)+RCX(IX))/2;
    for IY=1:Y-1
        D2=(RCY(IY+1)-RCY(IY))/2;      
        SS=SS+D1*D2*WEIGP*WEIGP*(D11+POSGP*D1);
    end
end

 
    



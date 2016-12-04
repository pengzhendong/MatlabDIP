point=imread('point.bmp'); 
pointsp=imread('point_sp.bmp'); 

X=zeros(12,12); 
Y=zeros(12,12); 

X=reshape(X,1,144); 
Y=reshape(Y,1,144); 
 
k=1; 
for i=1:128 
    for j=1:128 
        if point(i,j)==0 
            X(k)=i;
            Y(k)=j;
            k=k+1;
        end 
    end 
end 
 
X=reshape(X,12,12); 
Y=reshape(Y,12,12); 

 
Xsp=zeros(12,12); 
Ysp=zeros(12,12); 
 
Xsp=reshape(Xsp,1,144); 
Ysp=reshape(Ysp,1,144); 
 
k=1; 
count=0;xsum=0;ysum=0; 
[m,n]=size(point); 
pointRecord=zeros(m,n); 
 
for i=1:1:128 
    for j=1:1:128 
        
        if pointRecord(i,j)==0
            if pointsp(i,j)<125 
                pointRecord(i,j)=1;
                xsum=i;ysum=j;count=count+1; 
                if (i==1)|(j==1)|(i==128)|(j==128) 
                else 
                    if (pointRecord(i,j-1)==1)|(pointRecord(i,j+1)==1)|(pointRecord(i+1,j-1)==1)|(pointRecord(i+1,j+1)==1)|(pointRecord(i+1,j)==1)|(pointRecord(i-1,j)==1)|(pointRecord(i-1,j-1)==1)|(pointRecord(i-1,j+1)==1) 
                        pointRecord(i,j)=1; 
                        xsum=0; 
                        ysum=0; 
                        count=0; 
                    else 
                        i1=i;j1=j; 
                        while pointsp(i1,j1-1)<125 
                            pointRecord(i1,j1-1)=1; 
                            xsum=xsum+i1; 
                            ysum=ysum+j1-1; 
                            count=count+1; 
                            j1=j1-1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1,j1+1)<125 
                            pointRecord(i1,j1+1)=1; 
                            xsum=xsum+i1; 
                            ysum=ysum+j1+1; 
                            count=count+1; 
                            j1=j1+1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1-1,j1)<125 
                            pointRecord(i1-1,j1)=1; 
                            xsum=xsum+i1-1; 
                            ysum=ysum+j1; 
                            count=count+1; 
                            i1=i1-1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1+1,j1)<125 
                            pointRecord(i1+1,j1)=1; 
                            xsum=xsum+i1+1; 
                            ysum=ysum+j1; 
                            count=count+1; 
                            i1=i1+1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1+1,j1-1)<125 
                            pointRecord(i1+1,j1-1)=1; 
                            xsum=xsum+i1+1; 
                            ysum=ysum+j1-1; 
                            count=count+1; 
                            i1=i1+1;j1=j1-1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1+1,j1+1)<125 
                            pointRecord(i1+1,j1+1)=1; 
                            xsum=xsum+i1+1; 
                            ysum=ysum+j1+1; 
                            count=count+1; 
                            i1=i1+1;j1=j1+1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1-1,j1-1)<125 
                            pointRecord(i1-1,j1-1)=1; 
                            xsum=xsum+i1-1; 
                            ysum=ysum+j1-1; 
                            count=count+1; 
                            i1=i1-1;j1=j1-1; 
                        end 
                        i1=i;j1=j; 
                        while pointsp(i1-1,j1+1)<125 
                            pointRecord(i1-1,j1+1)=1; 
                            xsum=xsum+i1-1; 
                            ysum=ysum+j1+1; 
                            count=count+1; 
                            i1=i1-1;j1=j1+1; 
                        end 
                        xsum=fix(xsum/count); 
                        ysum=fix(ysum/count); 
                         
                        Xsp(k)=xsum;Ysp(k)=ysum; 
                        k=k+1; 
                        xsum=0; 
                        ysum=0; 
                        count=0; 
                    end 
                end 
            end 
        end 
    end 
end 
 
Xsp=reshape(Xsp,12,12); 
Ysp=reshape(Ysp,12,12); 
 

Xsptemp=zeros(12,12); 
Ysptemp=zeros(12,12); 
 
pointbak=zeros(128,128); 
for i=1:1:12 
    for j=1:1:12 
        if((Xsp(i,j)~=0)&(Ysp(i,j)~=0)) 
            pointbak(Xsp(i,j),Ysp(i,j))=1; 
        end 
    end 
end 
 
 
a1=80;b1=64; 
j=0;
for i=1:1:6 
    while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0; 
    Xsptemp(7,7-i)=a1-j; 
    Ysptemp(7,7-i)=b1; 
end 
 
a1=91;b1=61; 
j=0;
for i=1:1:6 
    while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0;  
    Xsptemp(8,7-i)=a1-j; 
    Ysptemp(8,7-i)=b1;  
    a1=a1-j;
end 
 
a1=103;b1=62; 
j=0;
for i=1:1:5 
    while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0; 
    Xsptemp(9,7-i)=a1-j; 
    Ysptemp(9,7-i)=b1; 
    a1=a1-j;
end 
 
a1=115;b1=62;
j=0;
for i=1:1:4 
    while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0; 
    Xsptemp(10,7-i)=a1-j; 
    Ysptemp(10,7-i)=b1;
    a1=a1-j;
end 
 
a1=123;b1=62; 
j=0;
for i=1:1:3 
    while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0; 
    Xsptemp(11,7-i)=a1-j; 
    Ysptemp(11,7-i)=b1; 
    a1=a1-j;
end 
 
a1=128;b1=62; 
j=0;
for i=1:1:2 
   while(pointbak(a1,b1)==0)
        b1=b1-1;
        while(pointbak(a1-j,b1)==0)
            j=j+1;
            if(j==12)
                j=0;
                break;
            end
        end
        if(pointbak(a1-j,b1)~=0)
            break;
        end
    end
    pointbak(a1-j,b1)=0; 
    Xsptemp(12,7-i)=a1-j; 
    Ysptemp(12,7-i)=b1;
    a1=a1-j;
end 
Xsptemp(10,1)=Y(10,1);
Xsptemp(11,1)=Y(11,1);
Xsptemp(11,2)=Y(11,2);
Xsptemp(12,1)=Y(12,1);
Xsptemp(12,2)=Y(12,2);
Xsptemp(12,3)=Y(12,3);
Ysptemp(10,1)=X(10,1);
Ysptemp(11,1)=X(11,1);
Ysptemp(11,2)=X(11,2);
Ysptemp(12,1)=X(12,1);
Ysptemp(12,2)=X(12,2);
Ysptemp(12,3)=X(12,3);
Xsptemp(9,1)=(Xsptemp(8,1)+Xsptemp(9,2))/2;
Xsptemp(10,2)=(Xsptemp(9,2)+Xsptemp(10,3))/2;
Xsptemp(11,3)=(Xsptemp(10,3)+Xsptemp(11,4))/2;
Xsptemp(12,4)=(Xsptemp(11,4)+Xsptemp(12,5))/2;
Ysptemp(9,1)=(Ysptemp(8,1)+Ysptemp(9,2))/2;
Ysptemp(10,2)=(Ysptemp(9,2)+Ysptemp(10,3))/2;
Ysptemp(11,3)=(Ysptemp(10,3)+Ysptemp(11,4))/2;
Ysptemp(12,4)=(Ysptemp(11,4)+Ysptemp(12,5))/2;

 
 
for x=1:1:6 
    for y =1:1:6 
        Xsptemp(x,y)=128-Xsptemp(13-x,y); 
        Ysptemp(x,y)=Ysptemp(13-x,y); 
    end 
end 
 

for x=1:1:6 
    for y =7:1:12 
        Xsptemp(x,y)=Xsptemp(x,13-y); 
        Ysptemp(x,y)=128-Ysptemp(x,13-y); 
    end 
end 
 
 
for x=7:1:12 
    for y =7:1:12 
        Xsptemp(x,y)=128-Xsptemp(13-x,y); 
        Ysptemp(x,y)=Ysptemp(13-x,y); 
    end 
end 

 
 
Xsp=Xsptemp; 
Ysp=Ysptemp; 
%--------------------------------------------------------------------------
 
  
tiger_sp1=imread('tiger_sp.bmp'); 
tiger_sp=imresize(tiger_sp1,[128,128],'bilinear'); 
imwrite(tiger_sp,'tiger_sps.bmp'); 
tiger=tiger_sp; 

subplot(1,3,1); 
imshow(tiger_sp1); 
title('原图');

PointC=zeros(14,14);
PointR=zeros(14,14);
PointX=zeros(14,14);
PointY=zeros(14,14);

for i=1:12
    for j=1:12
        PointC(i+1,j+1)=X(i,j);
        PointR(i+1,j+1)=Y(i,j);
        PointX(i+1,j+1)=Ysptemp(i,j);
        PointY(i+1,j+1)=Xsptemp(i,j);
    end
end




for k = 1 : 14 
    PointC(1, k) = PointC(2, k); 
    PointC(14,k) = PointC(13,k); 
    PointC(k, 1) = 1; 
    PointC(k, 14) = 128; 
    PointR(k, 1) = PointR(k, 2); 
    PointR(k, 14) = PointR(k, 13); 
    PointR(1, k) = 1; 
    PointR(14, k) = 128; 
    PointX(1, k) = PointX(2, k); 
    PointX(14, k) = PointX(13, k); 
    PointX(k, 1) = 1; 
    PointX(k, 14) = 128; 
    PointY(k, 1) = PointY(k, 2); 
    PointY(k, 14) = PointY(k, 13); 
    PointY(1, k) = 1; 
    PointY(14, k) = 128; 
end 

for i=1:1:13 
    for j=1:1:13
        A=[PointC(i,j),PointR(i,j),PointC(i,j)*PointR(i,j),1; 
           PointC(i,j+1),PointR(i,j+1),PointC(i,j+1)*PointR(i,j+1),1; 
           PointC(i+1,j),PointR(i+1,j),PointC(i+1,j)*PointR(i+1,j),1; 
           PointC(i+1,j+1),PointR(i+1,j+1),PointC(i+1,j+1)*PointR(i+1,j+1),1]; 
        TargetX=[PointX(i,j);PointX(i,j+1);PointX(i+1,j);PointX(i+1,j+1)]; 
        TargetY=[PointY(i,j);PointY(i,j+1);PointY(i+1,j);PointY(i+1,j+1)]; 
        A_1=inv(A); 
        CoefX=A_1*TargetX; 
        CoefY=A_1*TargetY; 
        for x=PointC(i,j):1:PointC(i,j+1) 
            for y=PointR(i,j):1:PointR(i+1,j) 
                a=[x,y,x*y,1]; 
                tiger(x,y)=tiger_sp(round(a*CoefX),round(a*CoefY)); 
                 
            end 
        end 
    end 
end 
tiger1=imresize(tiger,[216,176],'bilinear'); 
subplot(1,3,3); 
imshow(tiger1); 
title('变换后的图'); 
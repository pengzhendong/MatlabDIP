A=imread('lena24.bmp'); %????
A=rgb2gray(A);
[m,n]=size(A);
figure(4)
subplot(2,2,1);imshow(A);title('????');
subplot(2,2,2);imhist(A);title('???????');% ??????
k0=30;
k1=300;
k=1:256;
yr=256*(1-(1/(256-k0).^2)*(k-256).^2);
yg=256*(1-(1/((k1-k0)/2).^2)*(k-k0-(k1-k0)/2).^2);
yb=256*(1-(1/(k1-k0).^2)*(k-k0).^2)/2; %?2????????
yr(1:k0)=0;yg(1:k0)=0;yb(1:k0)=0;
subplot(2,2,3);plot(k,yr,'r',k,yg,'g',k,yb,'b');title('???????');
for j=1:n
for i=1:m
if(A(i,j)==0) 
A(i,j)=1; 
end
CC(i,j,1)=uint8(yr(A(i,j))); 
CC(i,j,2)=uint8(yg(A(i,j)));
CC(i,j,3)=uint8(yb(A(i,j))); 
end
end
subplot(2,2,4);imshow(CC);title('?????');
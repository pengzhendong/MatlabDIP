I=imread('lena.bmp');
subplot(221),imshow(I);
xlabel('a原图像');
s=fftshift(fft2(I));
subplot(222),imshow(log(abs(s)),[]);
xlabel('b图像傅里叶变换取对数所得频谱');
[a,b]=size(s);
a0=round(a/2);
b0=round(b/2);
d=10;
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=d
            h=1;
        else
            h=0;
        end;
        s(i,j)=h*s(i,j);
    end;
end;
F3=log(abs(s));%对傅里叶变换结果取绝对值，然后取对数??
subplot(223),imshow(F3,'InitialMagnification','fit');
xlabel('c滤波后的傅里叶变换图像');
s=uint8(real(ifft2(ifftshift(s))));
subplot(224),imshow(s);
xlabel('d理想低通滤波图像');
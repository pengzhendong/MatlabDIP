I=imread('lena.bmp');
subplot(221),imshow(I);
xlabel('aԭͼ��');
s=fftshift(fft2(I));
subplot(222),imshow(log(abs(s)),[]);
xlabel('bͼ����Ҷ�任ȡ��������Ƶ��');
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
F3=log(abs(s));%�Ը���Ҷ�任���ȡ����ֵ��Ȼ��ȡ����??
subplot(223),imshow(F3,'InitialMagnification','fit');
xlabel('c�˲���ĸ���Ҷ�任ͼ��');
s=uint8(real(ifft2(ifftshift(s))));
subplot(224),imshow(s);
xlabel('d�����ͨ�˲�ͼ��');
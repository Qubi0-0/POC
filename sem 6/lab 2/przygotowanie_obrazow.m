clc;

%% Obracanie Obrazów

t1=imread('triangle.png');
j=0;
for i=1:25:91
j=j+1;
t1r=imrotate(t1,i-1,'crop');
L1=fftshift(fft2(t1r));
subplot(2,4,j)
s1=strcat('kąt=',num2str(i-1));
imshow(t1r,[])
% imwrite(t1r,sprintf("triangle_rotated_%d.png",j));
title(s1);
end
subplot(2,4,1)
ylabel('Trójkąty rotacja');
sc= int8(-150 + 250.*rand(4,2));
for i=1:4
j=j+1;
t1t=imtranslate(t1,sc(i,:));
L1=fftshift(fft2(t1t));
subplot(2,4,j)
imshow(t1t,[])
imwrite(t1t,sprintf("traingle_translated_%d.png",j));
end
subplot(2,4,5)
ylabel('Trójkąty translacja');
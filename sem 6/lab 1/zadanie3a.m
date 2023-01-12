% img_boat_10 = imnoise(img_1, "salt & pepper", 0.1);
% 
% 
% 
% 
% disp(psnr(img_1,img_boat_1));
% disp(psnr(img_1,img_boat_2));
% disp(psnr(img_1,img_boat_10));
% disp(psnr(img_1,boat_median_1));
% disp(psnr(img_1,boat_median_2));
% disp(psnr(img_1,boat_median_10));
% 
% figure;
% subplot(3,4,1);
% imshow(img_1(300:450,300:450,1:end));
% xlabel("obraz 1");
% subplot(3,4,2);
% imshow(img_boat_1(300:450,300:450,1:end));
% xlabel('obraz1 + 1% PSNR: 25.7416');
% subplot(3,4,3);
% imshow(img_boat_2(300:450,300:450,1:end));
% xlabel('obraz1 + 2% PSNR: 22.0614');
% subplot(3,4,4);
% imshow(img_boat_10(300:450,300:450,1:end));
% xlabel('obraz1 + 10% PSNR: 15.1055');
% subplot(3,4,6);
% imshow(boat_median_1(300:450,300:450,1:end));
% xlabel('obraz1 + 1% + mediana PSNR: 27.8209');
% subplot(3,4,7);
% imshow(boat_median_2(300:450,300:450,1:end));
% xlabel('obraz1 + 2% + mediana PSNR: 27.7379');
% subplot(3,4,8);
% imshow(boat_median_10(300:450,300:450,1:end));
% xlabel('obraz1 + 10% + mediana PSNR: 27.0420');


img_butterfly_10 = imnoise(img_2, "salt & pepper", 0.1);




disp(psnr(img_2,img_butterfly_1));
disp(psnr(img_2,img_butterfly_2));
disp(psnr(img_2,img_butterfly_10));
disp(psnr(img_2,butterfly_median_1));
disp(psnr(img_2,butterfly_median_2));
disp(psnr(img_2,butterfly_median_10));

figure;
subplot(3,4,1);
imshow(img_2(300:450,300:450,1:end));
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_butterfly_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.1266');
subplot(3,4,3);
imshow(img_butterfly_2(300:450,300:450,1:end));
xlabel('obraz1 + 2% PSNR: 22.0686');
subplot(3,4,4);
imshow(img_butterfly_10(300:450,300:450,1:end));
xlabel('obraz1 + 10% PSNR: 15.1313');
subplot(3,4,6);
imshow(butterfly_median_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% + mediana PSNR: 31.5791');
subplot(3,4,7);
imshow(butterfly_median_2(300:450,300:450,1:end));
xlabel('obraz1 + 2% + mediana PSNR: 31.3538');
subplot(3,4,8);
imshow(butterfly_median_10(300:450,300:450,1:end));
xlabel('obraz1 + 10% + mediana PSNR: 29.6527');
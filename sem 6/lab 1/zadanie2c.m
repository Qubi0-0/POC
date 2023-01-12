%% Plotting

figure;
subplot(3,5,1);
imshow(img_1_grey(300:450,300:450,1:end));
xlabel("obraz1");
subplot(3,5,2);
imshow(img_boat_grey_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.7416');
subplot(3,5,3);
imshow(boat_median_3(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.4523');
subplot(3,5,4);
imshow(lum_boat_3(300:450,300:450,1:end));
xlabel('LUM 3x3 k=2 PSNR: 35.7389');
subplot(3,5,5);
imshow(lum_boat_4(300:450,300:450,1:end));
xlabel('Lum 3x3 k=3 PSNR: 32.6845');
subplot(3,5,7);
imshow(img_boat_grey_2(300:450,300:450,1:end));
xlabel('obraz1 + 3% PSNR: 23.8829');
subplot(3,5,8);
imshow(boat_3_mediana(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.4843');
subplot(3,5,9);
imshow(boat_3_lum_2(300:450,300:450,1:end));
xlabel('LUM 3x3 k=2 PSNR: 31.8026');
subplot(3,5,10)
imshow(boat_3_lum_3(300:450,300:450,1:end));
xlabel('LUM 3x3 k=3 PSNR: 29.4927');
subplot(3,5,12);
imshow(img_boat_grey_5(300:450,300:450,1:end));
xlabel('obraz1 + 15% PSNR: 22.1279');
subplot(3,5,13);
imshow(boat_5_mediana(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 25.5066');
subplot(3,5,14);
imshow(boat_5_lum_2(300:450,300:450,1:end));
xlabel('LUM 3x3 k=2 PSNR: 23.7709');
subplot(3,5,15)
imshow(boat_5_lum_3(300:450,300:450,1:end));
xlabel('LUM 3x3 k=3 PSNR: 19.4664');
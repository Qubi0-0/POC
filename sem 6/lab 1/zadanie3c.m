
% disp(psnr(img_1,boat_vmf_1_1));
% disp(psnr(img_1,boat_vmf_2_2));
% disp(psnr(img_1,boat_vmf_10_10));

figure;
subplot(3,5,1);
imshow(img_1(300:450,300:450,1:end));
xlabel("obraz1");
subplot(3,5,2);
imshow(img_boat_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.7416');
subplot(3,5,3);
imshow(boat_median_2(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.8209');
subplot(3,5,4);
imshow(boat_vmf_1(300:450,300:450,1:end));
xlabel('VMF PSNR: 26.5903');
subplot(3,5,5);
imshow(boat_vmf_1_1(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 25.7481');
subplot(3,5,7);
imshow(img_boat_2(300:450,300:450,1:end));
xlabel('obraz1 + 2% PSNR: 22.0614');
subplot(3,5,8);
imshow(boat_median_2(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.7379');
subplot(3,5,9);
imshow(boat_vmf_2(300:450,300:450,1:end));
xlabel('VMF PSNR: 31.8026');
subplot(3,5,10)
imshow(boat_vmf_2_2(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 25.3718');
subplot(3,5,12);
imshow(img_boat_10(300:450,300:450,1:end));
xlabel('obraz1 + 10% PSNR: 15.1055');
subplot(3,5,13);
imshow(boat_median_10(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.0420');
subplot(3,5,14);
imshow(boat_vmf_10(300:450,300:450,1:end));
xlabel('VMF PSNR: 22.6564');
subplot(3,5,15)
imshow(boat_vmf_10_10(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 23.0000');


disp(psnr(img_2,butterfly_vmf_1_1));
disp(psnr(img_2,butterfly_vmf_2_2));
disp(psnr(img_2,butterfly_vmf_10_10));

figure;
subplot(3,5,1);
imshow(img_2(300:450,300:450,1:end));
xlabel("obraz2");
subplot(3,5,2);
imshow(img_butterfly_1(300:450,300:450,1:end));
xlabel('obraz2 + 1% PSNR: 25.7416');
subplot(3,5,3);
imshow(butterfly_median_2(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 31.5791');
subplot(3,5,4);
imshow(butterfly_vmf_1(300:450,300:450,1:end));
xlabel('VMF PSNR: 29.7142');
subplot(3,5,5);
imshow(butterfly_vmf_1_1(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 28.8350');
subplot(3,5,7);
imshow(img_butterfly_2(300:450,300:450,1:end));
xlabel('obraz2 + 2% PSNR: 22.0614');
subplot(3,5,8);
imshow(butterfly_median_2(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 31.3538');
subplot(3,5,9);
imshow(butterfly_vmf_2(300:450,300:450,1:end));
xlabel('VMF PSNR: 28.8130');
subplot(3,5,10)
imshow(butterfly_vmf_2_2(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 28.1028');
subplot(3,5,12);
imshow(img_butterfly_10(300:450,300:450,1:end));
xlabel('obraz2 + 10% PSNR: 15.1313');
subplot(3,5,13);
imshow(butterfly_median_10(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 29.6527');
subplot(3,5,14);
imshow(butterfly_vmf_10(300:450,300:450,1:end));
xlabel('VMF PSNR: 23.5716');
subplot(3,5,15)
imshow(butterfly_vmf_10_10(300:450,300:450,1:end));
xlabel('2x VMF PSNR: 23.5373');
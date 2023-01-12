

disp(psnr(img_1,boat_vmf_1));
disp(psnr(img_1,boat_vmf_2));
disp(psnr(img_1,boat_vmf_10));
disp(psnr(img_2,butterfly_vmf_1));
disp(psnr(img_2,butterfly_vmf_2));
disp(psnr(img_2,butterfly_vmf_10));



figure;
subplot(3,4,1);
imshow(img_1(300:450,300:450,1:end));
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_boat_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.7416');
subplot(3,4,3);
imshow(img_boat_2(300:450,300:450,1:end));
xlabel('obraz1 + 2% PSNR: 22.0614');
subplot(3,4,4);
imshow(img_boat_10(300:450,300:450,1:end));
xlabel('obraz1 + 10% PSNR: 15.1055');
subplot(3,4,6);
imshow(boat_vmf_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% + VMF PSNR: 26.5903');
subplot(3,4,7);
imshow(boat_vmf_2(300:450,300:450,1:end));
xlabel('obraz1 + 2% + VMF PSNR: 25.9528');
subplot(3,4,8);
imshow(boat_vmf_10(300:450,300:450,1:end));
xlabel('obraz1 + 10% + VMF  PSNR: 22.6564');



figure;
subplot(3,4,1);
imshow(img_2(300:450,300:450,1:end));
xlabel("obraz 2");
subplot(3,4,2);
imshow(img_butterfly_1(300:450,300:450,1:end));
xlabel('obraz2 + 1% PSNR: 25.7416');
subplot(3,4,3);
imshow(img_butterfly_2(300:450,300:450,1:end));
xlabel('obraz2 + 2% PSNR: 22.0614');
subplot(3,4,4);
imshow(img_butterfly_10(300:450,300:450,1:end));
xlabel('obraz2 + 10% PSNR: 15.1055');
subplot(3,4,6);
imshow(butterfly_vmf_1(300:450,300:450,1:end));
xlabel('obraz2 + 1% + VMF PSNR: 29.7142');
subplot(3,4,7);
imshow(butterfly_vmf_2(300:450,300:450,1:end));
xlabel('obraz2 + 2% + VMF PSNR: 28.8130');
subplot(3,4,8);
imshow(butterfly_vmf_10(300:450,300:450,1:end));
xlabel('obraz2 + 10% + VMF  PSNR: 23.5716');
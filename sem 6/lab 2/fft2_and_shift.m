function result = fft2_and_shift(img,mode)
    [X,Y,DIM] = size(img);
    if DIM > 1
        img = rgb2gray(img);
    end
    img = double(img);
    if mode == "widmo"
        result = log(1+abs(fftshift(fft2(img))));
    elseif mode == "faza"
        result = angle(fftshift(fft2(img)));
    else
        disp('ERROR!');
    end
end
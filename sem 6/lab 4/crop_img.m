function result = crop_img(img,scale)
    dif_size = 256;
    scaled_img = imresize(img,scale,"bicubic");
    [X,Y] = size(scaled_img);
    result = scaled_img((X/2)-dif_size:(X/2)+dif_size,(Y/2)-dif_size:(Y/2)+dif_size);
end

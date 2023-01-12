function img = change_dim(img)
    [~,~,DIM] = size(img);
    if DIM > 1
        img = rgb2gray(img);
    end
end
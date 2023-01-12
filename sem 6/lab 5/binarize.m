
function result = binarize(img,treshold)
    [X,Y,DIM] = size(img);
    result = zeros(X,Y);
    if treshold <= 0 || treshold >= 255
        treshold = graythresh(img)*255; % OTSU
    end
        for i=1:1:X
            for j=1:1:Y
                if img(i,j) <= treshold
                    result(i,j) = 1;
                else
                    result(i,j) = 0;
                end
            end 
        end
end
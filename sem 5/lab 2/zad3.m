clear; clc;

% raw_img_path = 'cfa.png';
% color_img_path = 'srgb.png';

raw_img_path = 'cfa.png';
color_img_path = 'srgb.png';


raw_img = imread(raw_img_path);  %upload raw img
color_img = imread(color_img_path);  %upload color img
[row,col] = size(raw_img);


r = double(separate_color(raw_img, 'r'));
b = double(separate_color(raw_img, 'b'));
g = double(separate_color(raw_img, 'g'));

r_channel = r;
b_channel = b;
g_channel = g;

% R
r_channel(1:2,1:2) = r(2,2); %filling first corner of a picture
for i=2:1:row-1
    for j=2:1:col-1
        if r_channel(i,j) == 0
            if mod(j,2) == 0 && mod(i,2) == 1
                r_channel(i,j) = r(i-1,j)/2 + r(i+1,j)/2;
            elseif  mod(j,2) == 1 && mod(i,2) == 0
                r_channel(i,j) = r(i,j+1)/2 + r(i,j-1)/2;
            elseif mod(j,2) == 1 && mod(i,2) == 1
                r_channel(i,j) =  r(i-1,j-1)/4 + r(i+1,j-1)/4 + r(i+1,j+1)/4 + r(i+1,j-1)/4;
            end 
        end            
    end 
end 
% R filling edges
for i=2:1:row
    if mod(i,2) == 0
        r_channel(i,1) = r(i,2);
        
    else 
        r_channel(i,1) = r(i-1,2)/2 + r(i+1,2)/2;
        r_channel(i,col) = r(i-1,col)/2 + r(i+1,col)/2;
    end 
end
for j=2:1:col
    if mod(j,2) == 0
        r_channel(1,j) = r(2,j);
    else 
        r_channel(1,j) = r(2,j-1)/2 + r(2,j+1)/2;
        r_channel(row,j) = r(row,j-1)/2 + r(row,j+1)/2;
    end 
end


% B
for i=1:1:row-1
    for j=1:1:col-1
        if b_channel(i,j) == 0
            if mod(j,2) == 0 && mod(i,2) == 1
                b_channel(i,j) = b(i,j-1)/2 + b(i,j+1)/2;
            elseif  mod(j,2) == 1 && mod(i,2) == 0
                b_channel(i,j) = b(i+1,j)/2 + b(i-1,j)/2;
            elseif mod(j,2) == 0 && mod(i,2) == 0
                b_channel(i,j) =  b(i-1,j-1)/4 + b(i+1,j-1)/4 + b(i+1,j+1)/4 + b(i+1,j-1)/4;
            end 
        end            
    end 
end 
% B filling edges
b_channel(row,col) = b(row-1,col-1);
b_channel(1,col) = b(1,col-1);
for i=2:1:row-1
    if mod(i,2) == 0
        b_channel(i,col) = b(i-1,col-1)/2 + b(i+1,col-1)/2;       
    else 
        b_channel(i,col) = b(i,col-1);
    end 
end
for j=1:1:col-1
    if mod(j,2) == 1
       b_channel(row,j) = b(row-1,j);
    else 
       b_channel(row,j) = b(row-1,j-1)/2 + b(row-1,j+1)/2; 
    end 
end



% G
g_channel(1,1) = g(1,2)/2 + g(2,1)/2;
for i=2:1:row-1
    for j=2:1:col-1
        if( (mod(i,2)==0 && mod(j,2)==0) || ( mod(i,2)==1 && mod(j,2)==1))
            g_channel(i,j)= g(i-1,j)/4+ g(i,j-1)/4+ g(i+1,j)/4+ g(i,j+1)/4;
        end
    end
end
% G filling edges
for i=2:1:row-1
    if mod(i,2) == 1
       g_channel(i,1) = g(i-1,1)/3 + g(i+1,1)/3 + g(i,2)/3;
    elseif mod (i,2) == 0
       g_channel(i,col) = g(i-1,col)/3 + g(i+1,col)/3 + g(i,col-1)/3;
    end
end
for j=2:1:col-1
    if mod(j,2) == 1
       g_channel(1,j) = g(1,j-1)/3 + g(1,j+1)/3 + g(1+1,j)/3;
    elseif mod(j,2) == 0
        g_channel(row,j) = g(row,j-1)/3 + g(row,j+1)/3 + g(row-1,j)/3;
    end
end



final_result(:,:,1) = r_channel;
final_result(:,:,2) = g_channel;
final_result(:,:,3) = b_channel;
final_result=cast(final_result,'uint8');
figure;
    subplot (1,2,1);
    imshow(final_result);
    xlabel('result')
    subplot (1,2,2);
    imshow(color_img);
    xlabel('template')
[PSNR] = psnr(final_result, color_img)

imwrite(final_result,'bilinieal.png');
%% Functions 

function separated_img  = separate_color(img, color) %BGGR system
    [row,col] = size(img);
    img = cast(img,'double');
    separated_img = double(zeros(row,col));
    for i = 1:2:row
        for j = 1:2:col
            if color == 'b'
                separated_img(i,j) = img(i,j);
            elseif color == 'g'
                separated_img(i,j+1) = img(i,j+1);
                separated_img(i+1,j) = img(i+1,j);
            elseif color == 'r'
                separated_img(i+1,j+1) = img(i+1,j+1);
            else 
                fprintf('error occured, wrong color imput!!!');
                break
            end
        end 
    end
end 
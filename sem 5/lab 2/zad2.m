clear; clc;

raw_img_path = 'cfa.png';
color_img_path = 'srgb.png';


raw_img = imread(raw_img_path);  %upload raw img
color_img = imread(color_img_path);  %upload color img
[column,rows] = size(raw_img);  
final_result = uint8(zeros(column,rows,3));
test1 = separate_color(raw_img, 'r');
test2 = separate_color(raw_img, 'g');
test3 = separate_color(raw_img, 'b');

final_result(:,:,1) = nearest_neighbour(separate_color(raw_img, 'r'),'r');
final_result(:,:,2) = nearest_neighbour(separate_color(raw_img, 'g'),'g');
final_result(:,:,3) = nearest_neighbour(separate_color(raw_img, 'b'),'b');
final_result=cast(final_result,'uint8');



figure;
%     subplot (1,3,1);
%     imshow(raw_img);
%     xlabel('raw img')
    subplot (1,2,1);
    imshow(color_img);
    xlabel('template img')
    subplot (1,2,2);
    imshow(final_result);
    xlabel('nearest neighbour method')


[PSNR] = psnr(final_result, color_img)

imwrite(final_result,'neighbour.png');
%% Functions    

function separated_img  = separate_color(img, color) %BGGR system
    [row,col] = size(img);
    separated_img = uint8(zeros(row,col));
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



function result_img = nearest_neighbour(img,color)
    [row,col] = size(img);
    result_img = double(zeros(row,col));
    for i=1:2:(row-1)
            for j=1:2:(col-1)
                val_check = double(img(i:i+1,j:j+1));
                if color == 'r'
                    result_img(i:i+1,j:j+1) = val_check(2,2);
                elseif color == 'g'
                    result_img(i,j) = val_check(1,2); %/2 + val_check(2,1)/2;
                    result_img(i,j+1) =val_check(1,2);
                    result_img(i+1,j) = val_check(2,1);
                    result_img(i+1,j+1) = val_check(2,1);
                elseif color == 'b' 
                    result_img(i:i+1,j:j+1) = val_check(1,1);
                else
                    fprintf("error");
                end   
            end
    end
end 
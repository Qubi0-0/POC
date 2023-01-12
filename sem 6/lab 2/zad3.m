clc;
clear;

%%
[file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
img = imread([path, file]);

% error = img_prepare(img,10,"motyl","blur");
% error = img_prepare(img,5,"motyl","sharpen");

% error = img_prepare(img,10,"boat","blur");
error = img_prepare(img,5,"boat","sharpen");

% error = plotting('motyl','motyl','blur');
% error = plotting('motyl','motyl','sharpen');
% error = plotting('boat','boat','blur');
error = plotting('boat','boat','sharpen');






%% Functions

function error = img_prepare (img,iterations,folder_name,mode)
    k = 1;
    high_pass_kernel = [0 -1 0;-1 5 -1 ; 0 -1 0];
    img = rgb2gray(img);
    imwrite(img,append(folder_name,"/",folder_name,".png"));
    if mode == "blur"
    windowSize = 5;
    avg3 = ones(windowSize) / windowSize^2;
    elseif mode == "sharpen"
        avg3 = high_pass_kernel;
    else
            disp('ERROR! WRONG MODE INPUT!!!');
            return;
    end
    for i=1:1:iterations
        if mode == "blur"
            img = imfilter(img,avg3,'conv');
            imshow(img,[]);
        else
            img = imfilter(img,avg3);
%             img = imsharpen(img);
            imshow(img,[]);
        end
        if (i==1||i==2||i==5||i==10) && mode == "blur"
            k = k+1;
            imwrite(img,append(folder_name,"/",folder_name,'_',mode,sprintf("_%d.png",k)));
        elseif mode == "sharpen"
            imwrite(img,append(folder_name,"/",folder_name,'_',mode,sprintf("_%d.png",i)));
        end
        error = 1;
    end 
end



function error = plotting(folder_name,figure_name,mode)
   figure;
   k =1;
   blur_iteration = [1,2,5,10];
   label_info = "";
   for i=1:1:2
        for j=1:1:5
            if k == 1
                file_name = append(folder_name,'/',figure_name,'.png');
            else
                file_name = append(folder_name,'/',figure_name,'_',mode,sprintf('_%d.png',j));
            end 
             if isfile(file_name)
                % If the file exists, display it.
                image_data = imread(file_name);
                subplot(2,5,k);
                k = 1 + k;
                switch i
                    case 1 
                        imshow(image_data);
                        if mode == "blur" && j ~= 1
                            label_info = append("iteracja ", sprintf("%d",blur_iteration(j-1)));
                        elseif j == 1 
                            label_info = "oryginał";
                        else
                            label_info = append("iteracja ", sprintf("%d",j));
                        end
                    case 2
                        image_data = fft2_and_shift(image_data,'widmo');
                        label_info = "widmo mocy";
                        imshow(image_data,[]);
                end
                xlabel(label_info);
                error = 0;
            else
          % Print alert for those files that don't exist.
          fprintf('File not found: "%s".\n', file_name)
          error = 1;
             end
        end
   end
end
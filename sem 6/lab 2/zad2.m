clc;
clear;

%%
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);

% result = fft2_and_shift(img,'widmo');
% imshow(result,[]);

error = plotting('lines','lines_rotated');
error = plotting('circle','circle');
error = plotting('triangle','triangle_rotated');
error = plotting('triangle','traingle_translated');
error = plotting('triangle_grey','traingle_rotated');
error = plotting('triangle_grey','traingle_translated');
error = plotting('sinus','sinus');





%% Functions

function error = plotting(folder_name,figure_name)
   figure;
   k = 1;
   label_info = "";
   for i=1:1:3
        for j=1:1:4
             file_name = append(folder_name,'/',figure_name,sprintf('_%d.png',j));
             if isfile(file_name)
                % If the file exists, display it.
                image_data = imread(file_name);
                subplot(3,4,k);
                k = 1 + k;
                switch i
                    case 1 
                        imshow(image_data);
                    case 2
                        image_data = fft2_and_shift(image_data,'widmo');
                        label_info = "widmo mocy";
                        imshow(image_data,[]);
                    case 3
                        image_data = fft2_and_shift(image_data,'faza');
                        label_info = "faza";
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
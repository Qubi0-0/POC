
clc
clear
%%
[file,path]=uigetfile({'*.*'}, 'Select an image');
img = imread([path, file]);


plotting(rgb2gray(img));





%% Functions


function plotting(img)
   figure(1);
   k = 1;
   label_info = "";
   zones = 1; % DOPISAĆ!!!! o co chodzi z tą liczbą obszarów
   windowSize = 5;
    avg3 = ones(windowSize) / windowSize^2;
   for i=1:1:3
       switch i
           case 2 
               img = imnoise(img,"salt & pepper",0.02);
               label_info = "Obraz zakłócony";
           case 3 
               img = imfilter(img,avg3,'conv');
               label_info = "Obraz po wstępnym przetworzeniu";
       end    
        for j=1:1:4
                subplot(3,4,k);
                k = 1 + k;
                switch j
                    case 1 
                        imshow(img);
                    case 2
                        imhist(img);
                        label_info = "";
                    case 3
                        druk = 85;
%                         druk = 100;
                        image_data = binarize(img,druk); % 100 ładworka 85-druki
                        label_info = append("Wartość progu: ",sprintf('%d',druk));
                        imshow(image_data);
                    case 4
                        image_data = bwlabel(binarize(img,-1));
                        label_info =append("Liczba obszarów: ",sprintf('%d',max(bwlabel(binarize(img,druk)),[],'all')));
                        imshow(label2rgb(image_data));                 
                end
                xlabel(label_info);
                exportgraphics(figure(1),"zad2_2.eps");
        end
   end
end

clc
clear
%%
[file,path]=uigetfile('*.*', 'Select an image');
img = imread([path, file]);
I = rgb2gray(img);

se = strel('cube',4);
prog = graythresh(I);
% figure;
% imhist(I);
% prog = 250/255;

result = imbinarize(I, prog);
result = ~result;
result = imdilate(result,se);
result = imclose(result,se);
stats = regionprops(result, 'BoundingBox',"Extrema",'FilledImage','Area','Centroid');
k = 0;
file = cell(3,1);
figure(1); 
imshow(result);
for i = 1:length(stats)

    if stats(i).Area > 1000


%         bounding_box_list = stats(i).BoundingBox;
%         rectangle("Position", [bounding_box_list(1), bounding_box_list(2), ...
%                                 bounding_box_list(3), bounding_box_list(4)], "EdgeColor", 'r');
        cropped_img{i} = stats(i).FilledImage;
        centers{i} = stats(i).Centroid;
        saw_stats = regionprops(cropped_img{i},'Centroid',"Area");
        figure(i);
        imshow(cropped_img{i});
        radius = 0.99* sqrt(saw_stats.Area / pi);
        circled = circle(saw_stats.Centroid(1),saw_stats.Centroid(2),radius,'black');
        exportgraphics(figure(i),sprintf("tarcza(%d).png",i));
        file{i} = imread(sprintf("tarcza(%d).png",i));
        file{i} = rgb2gray(file{i});
        prog = graythresh(file{i});
        file{i} = imbinarize(file{i}, prog);
        stats_1 = regionprops(file{i}(3:end-3,3:end-3),'Area');
        teeth_amount(i) = length(stats_1);
    end
end
figure(5);
imshow(img);
for i=1:1:length(centers)   
    text(centers{i}(1),centers{i}(2),sprintf("%d",teeth_amount(i)),"FontSize",75);
end
exportgraphics(figure(5),"wynik.eps");
%%

function circles = circle(x,y,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle = r * cos(th) + x;
y_circle = r * sin(th) + y;
circles = plot(x_circle, y_circle);
fill(x_circle, y_circle, c)
hold off
axis equal
end



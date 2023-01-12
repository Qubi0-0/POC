rows = 512;
columns = 512;
x=512-160;
image = zeros(rows, columns, 'uint8');
xCoords = [(rows/2)-50 rows/2 (rows/2)+50];
yCoords = [x-160 x x-160];
mask = poly2mask(xCoords, yCoords, rows, columns);
image(mask) = 255; % or whatever value you want.
imshow(image);
imwrite(image,'triangle.png');
function [circle,rectangle,triangle] = knn_test_factors()

    circle_1 = change_dim(imread("knn/hex_1.png"));
    circle_2 = change_dim(imread("knn/hex_2.png"));
    rectangle_1 = change_dim(imread("knn/key_1.png"));
    rectangle_2 = change_dim(imread("knn/key_2.png"));
    triangle_1 = change_dim(imread("knn/nakretka_1.png"));
    triangle_2 = change_dim(imread("knn/nakretka_2.png"));
    img_data = {circle_1 circle_2 rectangle_1 rectangle_2 triangle_1 triangle_2};

%     K1 - compact k2 - Malinowska k3 - mz
    circle{1}{1} = count_factors(img_data{1},"compact");
    circle{1}{2} = count_factors(img_data{1},"malinowska");
    circle{1}{3} = count_factors(img_data{1},"mz");

    circle{2}{1} = count_factors(img_data{2},"compact");
    circle{2}{2} = count_factors(img_data{2},"malinowska");
    circle{2}{3} = count_factors(img_data{2},"mz");

    rectangle{1}{1} = count_factors(img_data{3},"compact");
    rectangle{1}{2} = count_factors(img_data{3},"malinowska");
    rectangle{1}{3} = count_factors(img_data{3},"mz");

    rectangle{2}{1} = count_factors(img_data{4},"compact");
    rectangle{2}{2} = count_factors(img_data{4},"malinowska");
    rectangle{2}{3} = count_factors(img_data{4},"mz"); 

    triangle{1}{1} = count_factors(img_data{5},"compact");
    triangle{1}{2} = count_factors(img_data{5},"malinowska");
    triangle{1}{3} = count_factors(img_data{5},"mz");

    triangle{2}{1} = count_factors(img_data{6},"compact");
    triangle{2}{2} = count_factors(img_data{6},"malinowska");
    triangle{2}{3} = count_factors(img_data{6},"mz"); 
end

function final_result =  knn(k) 
   folder_name = ["hex","key","nakretka"];
   factor_1_c = [];
   factor_1_r = [];
   factor_1_t = [];   
   factor_2_c = [];
   factor_2_r = [];
   factor_2_t = [];
   factor_3_c = [];
   factor_3_r = [];
   factor_3_t = [];
   for i=1:1:3
        for j=1:1:5
            file_name = append(folder_name(i),'/','1_',sprintf("%d",j-1),'.png');
            image_data = imread(file_name);
            [~,~,DIM] = size(image_data);
            if DIM > 1
                image_data = rgb2gray(image_data);
            end
            switch i
                case 1 %circle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_c = [factor_1_c k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_c = [factor_2_c k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_c = [factor_3_c k3];
                case 2 %rectangle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_r = [factor_1_r k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_r = [factor_2_r k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_r = [factor_3_r k3];

                case 3 %triangle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_t = [factor_1_t k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_t = [factor_2_t k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_t = [factor_3_t k3];
            end
        end
   end
        [circle,rectangle,triangle] = knn_test_factors();
        test_points = [circle{1}{1} circle{1}{2}; circle{2}{1} circle{2}{2}; ...
            rectangle{2}{1} rectangle{2}{2};rectangle{1}{1} rectangle{1}{2};triangle{1}{1} triangle{1}{2} ; ...
            triangle{2}{1} triangle{2}{2}];
        factor_points = zeros(15,2);
        factor_points(:, 1) = [factor_1_c factor_1_r factor_1_t];
        factor_points(:,2) = [factor_2_c factor_2_r factor_2_t];
        factor_points(:,3) = [ones(5,1); ones(5,1)+1; ones(5,1)+2];
        final_result = [];
        for i=1:1:6
            factor_points (:,4) = pdist2(factor_points(:,1:2),[test_points(i,1) test_points(i,2)]);
            [class, sort_indx]= sort(factor_points,1);
            results = factor_points(:,3);
            class_result = results(sort_indx(:,4));
            result = mode(class_result(1:k));
            final_result = [final_result result];
        end

end
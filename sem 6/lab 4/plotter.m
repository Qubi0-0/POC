
function [factor_1,factor_2,factor_3,mode_iterator] = plotter(img_1,img_2,img_3,mode,factor)
    factor_1 = [];
    factor_2 = [];
    factor_3 = [];
    switch mode
        case "rotate"
            mode_iterator = 1:180;
            X = 180;
        case "translate" 
            mode_iterator = 1:16;
            X = 16;
        case "scale"
            mode_iterator = 1:16;
            X = 16;
    end
    for i=1:1:X
        disp(i);
        switch mode
            case "rotate"
                changed_img_1 = imrotate(img_1,i);
                changed_img_2 = imrotate(img_2,i);
                changed_img_3 = imrotate(img_3,i);
            case "translate" 
                changed_img_1 = imtranslate(img_1,[i, i],'FillValues',0);
                changed_img_2 = imtranslate(img_2,[i, i],'FillValues',0);
                changed_img_3 = imtranslate(img_3,[i, i],'FillValues',0);
            case "scale"
                changed_img_1 = imresize(img_1,0.1*i);
                changed_img_2 = imresize(img_2,0.1*i);
                changed_img_3 = imresize(img_3,0.1*i);
        end
        k1 = count_factors(changed_img_1,factor);
        k2 = count_factors(changed_img_2,factor);
        k3 = count_factors(changed_img_3,factor);
        factor_1 = [factor_1 k1];
        factor_2 = [factor_2 k2];
        factor_3 = [factor_3 k3];
    end
    disp("done");
end 
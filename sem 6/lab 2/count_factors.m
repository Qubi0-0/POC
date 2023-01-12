function [k1 , k2] = count_factors(img, type)   
    stats = regionprops('table', img, "Area", "Perimeter");
    area = stats.Area(255);
    perimeter = stats.Perimeter(255);
    switch type
        case "compact"
            k1 = (area*4*pi)/(perimeter*perimeter);
            k2 = 0; % not used
        case "circular"
            k1 = 2 * sqrt(area/pi);
            k2 = perimeter/pi;

        case "malinowska"
            k1 = perimeter/(2*sqrt(pi * area)) - 1;
            k2 = 0;  % not Used 
        case "mz"
            k1 = (2*sqrt(pi*area))/perimeter;
        otherwise
            disp("ERROR!!! WRONG TYPE INPUT");
    end
end
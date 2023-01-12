function [k1 , k2] = count_factors(img, type)   
    stats = regionprops('table', img, "Area", "Perimeter");
    area = double(stats.Area(255));
    perimeter = double(stats.Perimeter(255));
    switch type
        case "compact"
            k1 = (area*4*pi)/(perimeter*perimeter);
        case "circular"
            k1 = 2 * sqrt(area/pi);
            k2 = perimeter/pi;

        case "malinowska"
            k1 = perimeter/(2*sqrt(pi * area)) - 1;
        case "mz"
            k1 = (2*sqrt(pi*area))/perimeter;
        otherwise
            disp("ERROR!!! WRONG TYPE INPUT");
    end
end
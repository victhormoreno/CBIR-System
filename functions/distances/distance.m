function d = distance(h,H,dist_type)
    switch dist_type
        case 'mse'
            d = mae_dist(h,H);
        case 'chi'
            d = chi_squared_distance(h, H);
        case 'bachata'
            d = bhattacharyya_dist(h, H);
        otherwise
            error('No valid distance type');
    end
end
function d = distance(h,H,dist_type)
    % Compute the distance between a target feature vector 'h' and a matrix of feature vectors 'H'
    % Inputs:
    %   - h: the target feature vector
    %   - H: the matrix of feature vectors
    %   - dist_type: the distance type to be computed ('mse', 'chi', or 'bachata')
    % Output:
    %   - d: the computed distance
    
    switch dist_type
        case 'mse'
            d = mse_dist(h,H);
        case 'chi'
            d = chi_squared_dist(h, H);
        case 'bachata'
            d = bhattacharyya_dist(h, H);
        otherwise
            error('No valid distance type');
    end
end
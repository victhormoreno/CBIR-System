function [distance] = chi_squared_distance(h, H)
% Calculates the chi-squared distance between two histograms
    for i=1:size(H,2)
        h2 = H(:,i);
        bin_diff = (h - h2).^2 ./ (h + h2 + eps);
        distance(i) = sum(bin_diff, 'all');
    end
end

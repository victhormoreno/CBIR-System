function [d] = chi_squared_dist(h, H)
    d = zeros(size(H,2),1);
    for i=1:size(H,2)
        h2 = H(:,i);
        bin_diff = (h - h2).^2 ./ (h + h2 + eps);
        d(i) = sum(bin_diff, 'all');
    end
end

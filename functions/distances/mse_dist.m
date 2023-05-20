function [d] = mse_dist(h,H)
    num = size(H);
    d = zeros(size(H,2),1);
    for i = 1:num(2)
        d(i) = immse(h,H(:,i));
    end
end


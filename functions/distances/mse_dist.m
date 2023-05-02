function [mse] = mse_dist(h,H)
num = size(H);
    for i = 1:num(2)
        mse(i) = immse(h,H(:,i));
    end
end


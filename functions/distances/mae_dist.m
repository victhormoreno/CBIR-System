function d = mae_dist(h,H)
num = size(H);
    for i = 1:num(2)
        for j = 1:num(1)
         d(i) =+ abs(h(j)-H(j,i));
        end
    end
end


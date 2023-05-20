function d = bhattacharyya_dist(p,Q)
    d = zeros(size(Q,2),1);
    for i=1:size(Q,2)
        p = p / sum(p);
        q = Q(:,i) / sum(Q(:,i));
        bc = sum(sqrt(p.*q));

        d(i) = -log(bc);
    end
end

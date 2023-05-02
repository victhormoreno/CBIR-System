function distance = hellinger_distance(h, H)
% Calculates the Hellinger distance between two vectors

    % Normalize the input vectors
    h = h / norm(h, 2);
    for i=1:size(H,2)
        h2 = H(:,i)/ (sum(H(:,i)));
        distance(i) = sqrt(0.5 * sum((sqrt(h) - sqrt(h2)).^2));
    end    
    % Calculate the Hellinger distance
end

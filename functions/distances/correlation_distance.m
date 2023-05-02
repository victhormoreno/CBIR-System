function distances = correlation_distance(h, H)
% H es la matriz de histogramas de tamaño num_bins x 2000
% h es el histograma que se desea comparar de tamaño 1 x num_bins

num_images = size(H, 2);
num_bins = size(H, 1);

mean_h = mean(h);
std_h = std(h);

for i=1:num_images
    mean_H = mean(H(:,i));
    std_H = std(H(:,i));
    diff = (H(:,i) - mean_H) .* (h - mean_h);
    distances(i) = sum(diff)/(std_h*std_H);
end
end

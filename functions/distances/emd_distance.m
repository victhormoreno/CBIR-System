function distance = emd_distance(h, H, bin_edges)
% H1 y H2 son los histogramas a comparar
% bin_edges son los bordes de los bines del histograma

% Obtener el número de bines
num_bins = length(bin_edges) - 1;

% Calcular la matriz de costo
cost = zeros(num_bins);
for i = 1:num_bins
    for j = 1:num_bins
        cost(i,j) = abs(bin_edges(i) - bin_edges(j));
    end
end

% Normalizar los histogramas para que la suma de sus elementos sea 1
H1 = H1 ./ sum(H1);
H2 = H2 ./ sum(H2);

% Calcular la matriz de flujo
F = zeros(num_bins, num_bins);
for i = 1:num_bins
    for j = 1:num_bins
        if H1(i) <= H2(j)
            F(i,j) = H1(i);
            H2(j) = H2(j) - H1(i);
            H1(i) = 0;
        else
            F(i,j) = H2(j);
            H1(i) = H1(i) - H2(j);
            H2(j) = 0;
        end
    end
end

% Calcular la distancia EMD usando programación dinámica
distance = 0;
while any(F(:))
    [i, j] = find(F, 1);
    T = zeros(num_bins, num_bins);
    T(i,j) = F(i,j);
    while i > 1 || j > 1
        if i > 1 && j > 1
            if F(i-1,j) < F(i,j-1)
                T(i-1,j) = F(i-1,j);
                F(i,j-1) = F(i,j-1) - F(i-1,j);
                i = i - 1;
            else
                T(i,j-1) = F(i,j-1);
                F(i-1,j) = F(i-1,j) - F(i,j-1);
                j = j - 1;
            end
        elseif i == 1
            T(i,j-1) = F(i,j-1);
            j = j - 1;
        else
            T(i-1,j) = F(i-1,j);
            i = i - 1;
        end
    end
    F = F - T;
    distance = distance + sum(sum(T .* cost));
end
end


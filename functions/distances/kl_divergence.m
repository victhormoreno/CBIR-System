function kl_distance = kl_divergence(h, H)
% h1 y h2 son los dos histogramas que se quieren comparar
% Ambos histogramas deben tener el mismo número de elementos
for i=1:size(H,2)
% Normalizar los histogramas para que sumen 1
h1_norm = h / sum(h);
h2_norm = H(:,i) / sum(H(:,i));

% Calcular la distancia KL
kl_distance(i) = sum(h1_norm .* log(h1_norm ./ h2_norm), 'omitnan');
end
end
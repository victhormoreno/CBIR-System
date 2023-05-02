function d = bhattacharyya_dist(p,Q)
% Calcula la distancia de Bhattacharyya entre dos distribuciones de probabilidad
% p y q.

% Normalizar las distribuciones de probabilidad
for i=1:size(Q,2)
    p = p / sum(p);
    q = Q(:,i) / sum(Q(:,i));

    % Calcular el coeficiente de Bhattacharyya
    bc = sum(sqrt(p.*q));

    % Calcular la distancia de Bhattacharyya
    d(i) = -log(bc);
end
end

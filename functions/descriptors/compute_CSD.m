function h = compute_CSD(hmmd_img,bins)
  % Declaracion variables
  % Definir el factor de downsampling
    factor = 2; % Factor de downsampling
  % Obtener las nuevas dimensiones de la imagen
    [M, N, ~] = size(hmmd_img);
    M_new = floor(M/factor);
    N_new = floor(N/factor);

    % Crear una matriz de índices para seleccionar cada 2 muestras
    indices = false(M, N);
    indices(1:factor:M, 1:factor:N) = true;

    % Seleccionar solo las muestras indicadas por los índices
    hmmd_img_ds = hmmd_img(indices);

    % Redimensionar la matriz de muestras seleccionadas
    hmmd_img_ds = reshape(hmmd_img_ds, M_new, N_new);

  s = size(hmmd_img_ds);
  se_dim = 16;
  h = zeros(bins,1);
  colors = zeros(bins,1);

  for i = 1:s(1)-se_dim + 1
    for j = 1:s(2)-se_dim + 1
        
        for k = i:(i+se_dim-1)
            for l = j:(j+se_dim-1)
                colors(hmmd_img_ds(k,l)+1)=1;
            end
        end
        
        h = h + colors;
        colors = zeros(bins,1);        
    end
  end
end


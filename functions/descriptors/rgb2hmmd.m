function hmmd_image = rgb2hmmd(rgb_image)
    % Convierte una imagen RGB a una imagen en el espacio de color HMMD
    % Entrada:
    %   rgb_image: Imagen RGB de entrada
    % Salida:
    %   hmmd_image: Imagen en el espacio de color HMMD
    
    % Extrae los componentes R, G y B de la imagen
    r = double(rgb_image(:,:,1));
    g = double(rgb_image(:,:,2));
    b = double(rgb_image(:,:,3));
    
    % Calcula los componentes Maximum, Minimum y Difference
    max_val = max(max(r, g), b);
    min_val = min(min(r, g), b);
    diff_val = max_val - min_val;
    
    % Calcula el valor de hue
    r_norm = r ./ max_val;
    g_norm = g ./ max_val;
    b_norm = b ./ max_val;
    
    hue = zeros(size(rgb_image, 1), size(rgb_image, 2));
    
    idx = (max_val == r & diff_val ~= 0);
    hue(idx) = mod((g_norm(idx) - b_norm(idx)) ./ diff_val(idx), 6);
    idx = (max_val == g & diff_val ~= 0);
    hue(idx) = ((b_norm(idx) - r_norm(idx)) ./ diff_val(idx)) + 2;
    idx = (max_val == b & diff_val ~= 0);
    hue(idx) = ((r_norm(idx) - g_norm(idx)) ./ diff_val(idx)) + 4;
    hue = hue / 6;
    
    % Crea la imagen HMMD
    hmmd_image = cat(3, hue, max_val, min_val, diff_val);
end

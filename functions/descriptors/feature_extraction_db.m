function H = feature_extraction_db(dinfo,bins)
    %Crea la base de dades d'histogrames de cada foto en escala de grisos
    % Funcionament:
    % 1- Obra fitxer n
    % 2- Càlcula l'histograma
    % 3- El guarda en una matriu
    % 4- Repeteix els anterior passos fins que no queda cap fitxer
    % Parametres:
    %   - dinfo: struct amb tota la info dels fitxers de la base de
    %   dades
    %   - bins: nombre de bins per a construir l'histograma
    % Retorna:
    %   - H: matriu n_filesxbins amb l'histograma de cada foto
    n_files = length(dinfo);
    time_remaining = 0;
    
    fprintf('Creant base de dades\n');
    H = zeros(bins,n_files);

    for i=1:n_files
        clc;
        fprintf('Generating Image Descriptor for image number %d of 2000...\r', i);
        fprintf('Time remaining: %.d seconds', time_remaining);
        tic
        img = imread([dinfo(i).folder,'\',dinfo(i).name]);
        hmmd_img = hmmd_quantification(img,bins);
        %h = imhist(hmmd_img/bins,bins);
        h = compute_CSD(hmmd_img,bins);
        H(:,i) = h';
        time_remaining = round(toc*(n_files-i));
    end
    fprintf('\nBase de dades creada\n');
end
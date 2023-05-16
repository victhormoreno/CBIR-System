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
    %H = zeros(n_files,128);
    H = zeros(128,n_files);

    for i=1:n_files
        clc;
        fprintf('Generating Image Descriptor for image number %d of 2000...\r', i);
        fprintf('Time remaining: %.2f minutes', time_remaining);
        tic
        img = imread([dinfo(i).folder,'/',dinfo(i).name]);
        hmmd_img = hmmd_quantification(img,128);
        %[h,~]=histcounts(hmmd_img(:),0:128);
        h = compute_CSD(hmmd_img,128);
        %H(i,:) = h';
        H(:,i) = h';
        time_remaining = (toc*(n_files-i))/60;
    end
    fprintf('Base de dades creada\n');
end
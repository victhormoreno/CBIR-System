
f_score = zeros(16,1);
time = zeros(16,1);
for a=1:16
    path = 'C:\Users\victo\Desktop\prog2'; % Path to own project folder
    quantification = 256; % Number of levels img hmmd: 128 or 256
    dist_type = 'bachata'; % Options: 'mse' / 'chi' / 'bachata'
    N = 10; % Number of candidates per image

    dinfo = dir([path,'\data\database\*.jpg']);
    addpath([path,'\functions\descriptors']);
    addpath([path,'\functions\distances']);

    fid = fopen([path,'\data\input.txt'],'r');
    cont = textscan(fid, '%s', 'Delimiter','\n');
    n_input = numel(cont{1}); 
    fclose(fid);    
    % Database creation
    bins = 16*a;
    H = feature_extraction_db(dinfo, bins, quantification);
    mesh(H);
    tic
    % Output results
    input = fopen([path,'\data\input.txt'],'r');
    output = fopen([path,'\data\output.txt'],'w');
    for i = 1:n_input
        name = strtrim(fgets(input));

        % 2.1- Calculate the image descriptor (h)
        h = feature_extraction(dinfo,name,bins,quantification);
    
        %   2.2- Calculate distance between h and H / d(h,H)
        d = distance(h,H,dist_type);

        %   2.3- We order and we stay the first N
        fprintf(output,'Retrieved list for query image %s\n',name);
        for i = 1:N
            [M,I] = min(d,[],'linear');
            d(I) =  max(d);
            name_image = dinfo(I).name;
            fprintf(output,'%s\n',name_image);
        end
        fprintf(output,'\n');
    end

    fclose(output);
    fclose(input);
    toc
    time(a)=toc;    
    %% Recall and Precision Compute
    Num_images = 2000;
    fid = fopen([path,'\data\input.txt'],'r');
    fid2 = fopen([path,'\data\output.txt'],'r');

    Precision = zeros(N);
    Recall = zeros(N);
    aciertos = 0;

    for i = 1:n_input
        name_ground_truth = strtrim(fgets(fid));
        tokens = regexp(name_ground_truth,'ukbench(\d+)\.jpg','tokens');
        ground_truth = str2double(tokens{1}{1});
        ground_truth = ceil((ground_truth+1)/4);
        name_prediction = strtrim(fgets(fid2));
        for j = 1:N   
            name_prediction = strtrim(fgets(fid2));
            tokens2 = regexp(name_prediction,'ukbench(\d+)\.jpg','tokens');
            prediction = str2double(tokens2{1}{1});
            prediction = ceil((prediction+1)/4);
        
            if(ground_truth == prediction) 
                aciertos = aciertos + 1;
            end
            Precision(i,j) = aciertos/j;
            Recall(i,j) = aciertos/4;
        end    
        name_prediction = strtrim(fgets(fid2));
        aciertos = 0;
    end
    fclose(fid2);
    fclose(fid);

    recall = sum(Recall)/n_input;
    precision =  sum(Precision)/n_input;
    f = 2*(precision.*recall)./(precision+recall);
    f = sort(f,'descend');
    f_score(a) = f(1);
    f(1)
    clearvars -except f_score 
end
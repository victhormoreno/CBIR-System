function H = feature_extraction_db(dinfo,bins,quantification)
    % Extract features from a set of images and store them in a matrix
    % Inputs:
    %   - dinfo: a structure array containing information about the images
    %   - bins: the number of bins for feature quantization
    % Output:
    %   - H: a matrix of extracted features
    
    n_files = length(dinfo); % Get the number of files (images) in the dataset
    time_remaining = 0;
    
    fprintf('Creant base de dades\n');
    H = zeros(bins,n_files); % Initialize the feature matrix with zeros

    for i=1:n_files
        clc;
        fprintf('Generating Image Descriptor for image number %d of 2000...\r', i);
        fprintf('Time remaining: %.d seconds', time_remaining);
        tic
        img = imread([dinfo(i).folder,'\',dinfo(i).name]); % Read the image file
        hmmd_img = hmmd_quantification(img,quantification);  % Perform HMMD quantification on the image
        h = compute_CSD(hmmd_img,bins,quantification); % Compute the Color Structure Descriptor (CSD) for the quantified image
        H(:,i) = h'; % Store the computed feature vector in the feature matrix
        time_remaining = round(toc*(n_files-i));
    end
    fprintf('\nBase de dades creada\n');
end
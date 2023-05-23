function h = feature_extraction(dinfo,name,bins,quantification)
    % Extract features from a single image
    % Inputs:
    %   - dinfo: a structure array containing information about the image
    %   - name: the name of the image file
    %   - bins: the number of bins for feature quantization
    % Output:
    %   - h: the extracted feature vector
    
    img = imread([dinfo(1).folder,'\',name]); % Read the image file
    hmmd_img = hmmd_quantification(img,quantification); % Perform HMMD quantification on the image
    h = compute_CSD(hmmd_img,bins,quantification);  % Compute the Color Structure Descriptor (CSD) for the quantified image
end


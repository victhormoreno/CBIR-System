function h = feature_extraction(dinfo,name,bins)
    % Extract features from a single image
    % Inputs:
    %   - dinfo: a structure array containing information about the image
    %   - name: the name of the image file
    %   - bins: the number of bins for feature quantization
    % Output:
    %   - h: the extracted feature vector
    
    img = imread([dinfo(1).folder,'\',name]); % Read the image file
    img_gray = rgb2gray(img);
    h = imhist(img_gray,bins);
end


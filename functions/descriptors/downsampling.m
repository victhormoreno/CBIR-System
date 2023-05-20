function hmmd_img_ds = downsampling(hmmd_img,factor,mode)
    % Perform downsampling on the input image
    % Inputs:
    %   - hmmd_img: the input image
    %   - factor: the downsampling factor
    %   - mode: the downsampling mode (0 or 1)
    % Output:
    %   - hmmd_img_ds: the downsampled image
    
    switch mode
        case 0
            hmmd_img_ds = imresize(hmmd_img, 1/factor); % Downsampling using imresize
            hmmd_img_ds = round(hmmd_img_ds); % Rounding the values
            hmmd_img_ds = max(0, min(255, hmmd_img_ds)); % Clipping the values to the range of 0 to 255
            
        case 1
            [M, N, ~] = size(hmmd_img);
            M_new = floor(M/factor);
            N_new = floor(N/factor);

            indices = false(M, N); % Create a logical array to store the downsampling indices
            indices(1:factor:M, 1:factor:N) = true; % Set the downsampling indices to true

            hmmd_img_ds = hmmd_img(indices); % Extract the downsampled pixels based on the indices
            hmmd_img_ds = reshape(hmmd_img_ds, M_new, N_new); % Reshape the downsampled pixels to the new size
    end
    
end


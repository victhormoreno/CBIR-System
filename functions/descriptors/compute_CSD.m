function h = compute_CSD(hmmd_img,bins,quantification)
    % Compute the Color Structure Descriptor (CSD) for an input image
    % Inputs:
    %   - hmmd_img: the input image after HMMD quantization
    %   - bins: the number of bins for the CSD
    % Output:
    %   - h: the computed CSD feature vector
    
    factor = 2;
    se_dim = 16;
    hmmd_img_ds = downsampling(hmmd_img,factor,1); % Downsampling the HMMD image by a factor of 2

    s = size(hmmd_img_ds);
    h = zeros(quantification,1);
    colors = zeros(quantification,1);

    for i = 1:s(1)-se_dim + 1
    for j = 1:s(2)-se_dim + 1

        for k = i:(i+se_dim-1)
            for l = j:(j+se_dim-1)
                colors(hmmd_img_ds(k,l)+1)=1; % Update the color vector based on the HMMD image values
            end
        end

        h = h + colors; % Accumulate the colors into the CSD feature vector
        colors = zeros(quantification,1);        
    end
    end
    
    N = numel(h);
    step = ceil(N/bins);
    h2 = accumarray((1:N)', h, [], @(x) sum(x));
    h = h2(1:step:end);
end


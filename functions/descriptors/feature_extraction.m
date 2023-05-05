function h = feature_extraction(dinfo,name,bins)
    img = imread([dinfo(1).folder,'/',name]);
    hmmd_img = rgb2quanthmmd(img,128);
    %h = imhist(hmmd_img,bins);
    h = compute_CSD(hmmd_img,128);
end


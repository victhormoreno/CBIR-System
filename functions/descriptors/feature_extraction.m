function h = feature_extraction(dinfo,name,bins)
    img = imread([dinfo(1).folder,'/',name]);
    hmmd_img = rgb2hmmd(img);
    h = imhist(hmmd_img,bins);
end


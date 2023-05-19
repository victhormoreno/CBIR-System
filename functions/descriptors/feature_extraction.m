function h = feature_extraction(dinfo,name,bins)
    img = imread([dinfo(1).folder,'\',name]);
    %hmmd_img = hmmd_quantification(img,bins);
    hmmd_img = hmmd_quantification(img,bins);
    %h = imhist(hmmd_img/bins,bins);
    h = compute_CSD(hmmd_img,bins);
end


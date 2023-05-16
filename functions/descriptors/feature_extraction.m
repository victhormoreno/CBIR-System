function h = feature_extraction(dinfo,name,bins)
    img = imread([dinfo(1).folder,'/',name]);
    %hmmd_img = hmmd_quantification(img,128);
    hmmd_img = hmmd_quantification(img,128);
    %[h,~]=histcounts(hmmd_img(:),0:128);
    %h = imhist(hmmd_img,bins);
    h = compute_CSD(hmmd_img,128);
end


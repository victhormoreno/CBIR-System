function [carac] = rgb2hmmd(image)
    HSV = rgb2hsv(image);
    [Hue,~,~] = imsplit(HSV);
    Hue = round(Hue*360);
    M1 = max(image(:,:,1),image(:,:,2));
    Max = max(M1, image(:,:,3));
    M1 = min(image(:,:,1),image(:,:,2));
    Min = min(M1, image(:,:,3));
    Diff = Max - Min;
    Sum = (Max+Min)/2;

    carac(:,:,1)=Hue;
    carac(:,:,2)= double(Diff);
    carac(:,:,3)= double(Sum);
end


function [ image ] = rgb2quanthmmd( rgbimage, numbins,table )
    if numbins == 32
        image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
    elseif numbins == 128
        tic
        image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
        toc
    else
        error('numbins must be either 32 or 128');
    end
end
function h = compute_CSD(hmmd_img,bins)
  % Declaracion variables
  se_ini = [1 1];
  s = size(hmmd_img);
  se_dim = 8;
  h = zeros(bins,1);
  colors = zeros(bins,1);

  for i = 1:s(1)-se_dim
    for j = 1:s(2)-se_dim
        
        for k = se_ini(1):se_dim
            for l = se_ini(2):se_dim
                colors(hmmd_img(k,l)+1)=1;
            end
        end
        h = h + colors;
        colors = zeros(bins,1);
        
        se_ini (2)= se_ini (2)+1;     
   end
   se_ini (2)= 1;     
   se_ini (1)= se_ini (1)+1; 
  end
  
end


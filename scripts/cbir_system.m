% CBIR System based on Color Structure Descriptor
% Descripció del procés:
% 1- Data Base Extraction (H)
% 2- Trobem els matches
%   2.1- Calcular histograma de la foto usuari
%   2.2- Calcular distància foto usuari amb la base de dades
%   2.3- Ordenem i ens quedem els 8 primers

%% Declaració de variables 
clear;

update_H = false;
path = 'C:\Users\victo\Desktop\prog2';
bins = 256;
dist_type = 'mse';
dinfo = dir([path,'\data\database\*.jpg']);
N = 10;

addpath([path,'\functions\descriptors']);
addpath([path,'\functions\distances']);
%% 1- Data Base Extraction (H)  
if (~exist([path,'\data\H.mat'], 'file'))||(update_H)
    H = feature_extraction_db(dinfo, bins);
    mesh(H);
    save([path,'\data\H.mat'], 'H');
else
    load([path,'\data\H.mat']');
    mesh(H);
end

%% Read num inputs input.txt

% Number of lines
fid = fopen([path,'\data\input.txt'],'r');
cont = textscan(fid, '%s', 'Delimiter','\n');
n_input = numel(cont{1}); 
fclose(fid);

% Main program 
input = fopen([path,'\data\input.txt'],'r');
output = fopen([path,'\data\output.txt'],'w');

for i = 1:length(dinfo)
    name = strtrim(fgets(input));
    h = feature_extraction(dinfo,name,bins);
    d = distance(h,H,dist_type);
    
    fprintf(output,'Retrieved list for query image %s\n',name);
    for i = 1:N
        [M,I] = min(d,[],'linear');
        d(I) =  max(d);
        name_image = dinfo(I).name;
        fprintf(output,'%s\n',name_image);
    end
    fprintf(output,'\n');
    fprintf('ite\n');

end

fclose(output);
fclose(input);



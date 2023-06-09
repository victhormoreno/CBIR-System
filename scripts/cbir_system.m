% CBIR System based on Color Structure Descriptor
% Prog 2 - Processament d'Imatge i Video - Telecos UPC
%
% System Stages:
% 1- Data Base Extraction (H)
% 2- Main Program
%   2.1- Calculate the image descriptor (h)
%   2.2- Calculate distance between h and H / d(h,H)
%   2.3- We order and we stay the first N
%
% @authors: Joana Justo and Víctor Moreno
% @date: May 2023
% @version 2.0

%% Declaration of variables (they should be changed)

clear;
update_H = false; % True: update H matrix from data
path = 'C:\Users\victo\Desktop\prog2'; % Path to own project folder
quantification = 256; % Number of levels img hmmd: 128 or 256
bins = 208; 
dist_type = 'bachata'; % Options: 'mse' / 'chi' / 'bachata'
N = 10; % Number of candidates per image

dinfo = dir([path,'\data\database\*.jpg']);
addpath([path,'\functions\descriptors']);
addpath([path,'\functions\distances']);

%% 1- Data Base Extraction (H)  

if (~exist([path,'\data\H.mat'], 'file'))||(update_H)
    H = feature_extraction_db(dinfo, bins, quantification);
    mesh(H);
    save([path,'\data\H.mat'], 'H');
else
    load([path,'\data\H.mat']');
    mesh(H);
end

%% 2- Main program 

% Get number of inputs
fid = fopen([path,'\data\input.txt'],'r');
cont = textscan(fid, '%s', 'Delimiter','\n');
n_input = numel(cont{1}); 
fclose(fid);

input = fopen([path,'\data\input.txt'],'r');
output = fopen([path,'\data\output.txt'],'w');

for i = 1:n_input
    name = strtrim(fgets(input));
    
    % 2.1- Calculate the image descriptor (h)
    h = feature_extraction(dinfo,name,bins,quantification);
    
    %   2.2- Calculate distance between h and H / d(h,H)
    d = distance(h,H,dist_type);
    
    %   2.3- We order and we stay the first N
    fprintf(output,'Retrieved list for query image %s\n',name);
    for i = 1:N
        [M,I] = min(d,[],'linear');
        d(I) =  max(d);
        name_image = dinfo(I).name;
        fprintf(output,'%s\n',name_image);
    end
    fprintf(output,'\n');
end

fclose(output);
fclose(input);

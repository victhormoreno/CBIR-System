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
path = '/Users/joanajusto/Desktop/PIV/PIV-Prog-2'; % Path to own project folder
bins = 256; % Number of bins of histogram
dist_type = 'mse'; % Options: 'mse' / 'chi' / 'bachata'
N = 10; % Number of candidates per image

dinfo = dir([path,'/data/database/*.jpg']);
addpath([path,'/functions/descriptors']);
addpath([path,'/functions/distances']);

%% 1- Data Base Extraction (H)  

if (~exist([path,'/data/H.mat'], 'file'))||(update_H)
    H = feature_extraction_db(dinfo, bins);
    mesh(H);
    save([path,'/data/H.mat'], 'H');
else
    load([path,'/data/H.mat']');
    mesh(H);
end

%% 2- Main program 

% Get number of inputs
fid = fopen([path,'/data/input.txt'],'r');
cont = textscan(fid, '%s', 'Delimiter','\n');
n_input = numel(cont{1}); 
fclose(fid);

input = fopen([path,'/data/input.txt'],'r');
output = fopen([path,'/data/output.txt'],'w');

for i = 1:n_input
    name = strtrim(fgets(input));
    
    % 2.1- Calculate the image descriptor (h)
    h = feature_extraction(dinfo,name,bins);
    
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

%%
img = imread([dinfo(1).folder,'/',name]);
    hmmd_img = rgb2quanthmmd(img,128);

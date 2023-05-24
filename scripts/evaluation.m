%% Open Input txt
clear;
path = 'C:\Users\victo\Desktop\prog2';

%% Recall and Precision Compute
fid = fopen([path,'\data\input.txt'],'r');
cont = textscan(fid, '%s', 'Delimiter','\n');
num_lineas = numel(cont{1});
fclose(fid);


Num_images = 2000;
N=10;
fid = fopen([path,'\data\input.txt'],'r');
fid2 = fopen([path,'\data\output.txt'],'r');

Precision = zeros(N);
Recall = zeros(N);
aciertos = 0;

for i = 1:num_lineas
    name_ground_truth = strtrim(fgets(fid));
    tokens = regexp(name_ground_truth,'ukbench(\d+)\.jpg','tokens');
    ground_truth = str2double(tokens{1}{1});
    ground_truth = ceil((ground_truth+1)/4);
    name_prediction = strtrim(fgets(fid2));
    for j = 1:N   
        name_prediction = strtrim(fgets(fid2));
        tokens2 = regexp(name_prediction,'ukbench(\d+)\.jpg','tokens');
    	prediction = str2double(tokens2{1}{1});
        prediction = ceil((prediction+1)/4);
        
        if(ground_truth == prediction) 
            aciertos = aciertos + 1;
        end
        Precision(i,j) = aciertos/j;
        Recall(i,j) = aciertos/4;

    end    
    name_prediction = strtrim(fgets(fid2));
    aciertos = 0;
end
fclose(fid2);
fclose(fid);

%% MSE

recall = sum(Recall)/num_lineas;
precision =  sum(Precision)/num_lineas;
f_score = 2*(precision.*recall)./(precision+recall);
f = sort(f_score,'descend');
f(1)

%% Chi-squared
recall2 = sum(Recall)/num_lineas;
precision2 =  sum(Precision)/num_lineas;
f_score2 = 2*(precision2.*recall2)./(precision2+recall2);
f2 = sort(f_score2,'descend');
f2(1)

%% Bachata
recall3 = sum(Recall)/num_lineas;
precision3 =  sum(Precision)/num_lineas;
f_score3 = 2*(precision3.*recall3)./(precision3+recall3);
f3 = sort(f_score3,'descend');
f3(1)

%%
figure;
plot(recall, precision,'-*','LineWidth',2,'MarkerSize',8);
hold on
plot(recall2, precision2,'-*','LineWidth',2,'MarkerSize',8);
hold on
plot(recall3, precision3,'-*','LineWidth',2,'MarkerSize',8);


xlabel('Recall');
ylabel('Precision');
xlim([0,1]);
ylim([0,1]);
legend(['MSE',' /F-score = ' num2str(f(1))], ['Chi-squared','/F-score = ' num2str(f2(1))],['Bhattacharyya',' /F-score = ' num2str(f3(1))]);
title('Content-Based Image Retrieval Performance');
grid on;

%% readDiseaseData
% Reads in excel file for disease data
% Latent period (1), infectious period (2), mortality rate (3), 
% contact rate (4), land threshold (5), sea threshold (6), air threshold
% (7)

%% use xlsread

function diseaseData = readDiseaseData(filename)

diseaseData = xlsread(filename);
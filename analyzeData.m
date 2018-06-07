%% analyzeData
% Reads in the topDeath arrays for each disease and returns the following
% Deadliest country - per disease
% Overall deadliest country - based on all diseases
% Overall safest country - based on all diseases

clear all;
close all;
clc;

%% read in csv files

ebola = load('topDeathEbola.csv');
blackPlague = load('topDeathBlackPlague.csv');
SARS = load('topDeathSARS.csv');
influenza = load('topDeathInfluenza.csv');

%% combine all values

totalDisease = [ebola; blackPlague; SARS; influenza];
totalDisease = sort(totalDisease);
ebola = sort(ebola);
blackPlague = sort(blackPlague);
SARS = sort(SARS);
influenza = sort(influenza);

%% find mode(s) of data

[deadliestEbola, frequencyEbola] = mode(ebola);
[deadliestBlackPlague, frequencyBlackPlague] = mode(blackPlague);
[deadliestSARS, frequencySARS] = mode(SARS);
[deadliestInfluenza, frequencyInfluenza] = mode(influenza);

[deadliestOverall, frequencyOverall] = mode(totalDisease);

ebolaTable = tabulate(ebola);
maxTable = max(ebolaTable(:,2));
ebolaIndexes = find(ebolaTable(:,2) == maxTable);

bpTable = tabulate(blackPlague);
maxTable = max(bpTable(:,2));
bpIndexes = find(bpTable(:,2) == maxTable);

SARSTable = tabulate(SARS);
maxTable = max(SARSTable(:,2));
SARSIndexes = find(SARSTable(:,2) == maxTable);

fluTable = tabulate(influenza);
maxTable = max(fluTable(:,2));
fluIndexes = find(fluTable(:,2) == maxTable);

% find the maximum and minimum for overall
myTable = tabulate(totalDisease);
maxTable = max(myTable(:,2));
minTable = min(myTable(:,2));
maxIndexes = find(myTable(:,2) == maxTable);
minIndexes = find(myTable(:,2) == minTable);

%% display results

disp('Ebola: ');
disp(ebolaIndexes);

disp('Black Plague: ');
disp(bpIndexes);

disp('SARS: ');
disp(SARSIndexes);

disp('Influenza: ');
disp(fluIndexes);

disp('Overall Deadliest: ');
disp(maxIndexes);

disp('Overall Safest: ');
disp(minIndexes);

%% create histogram

figure
histogram(ebola,58);
title('Most Dangerous Starting Countries - Ebola');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on


figure
histogram(blackPlague,58);
title('Most Dangerous Starting Countries - Black Plague');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on

figure
histogram(SARS,58);
title('Most Dangerous Starting Countries - SARS');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on

figure
histogram(influenza,58);
title('Most Dangerous Starting Countries - Influenza');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on

figure
histogram(totalDisease,58);
title('Most Dangerous Starting Countries - Overall');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on
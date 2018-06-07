%% reportCountry
% Reports the country that has the highest death toll for all of the
% countries
% Author: Colin Brankin
% Date: April 13, 2017

%% run simulation for each country

topDeath = zeros(1,100);

for irun = 1:100
    
    deathArray = zeros(1,58);
    
    for icountry = 1:58
        totalDeath = runSimulation(icountry);
        deathArray(icountry) = totalDeath;
    end
    
    %% find max
    
    indexmax = find(max(deathArray) == deathArray);
    countryMax = deathArray(indexmax);
    
    topDeath(irun) = indexmax;
end

myData = topDeath';
xlswrite('topDeathEbola.csv',myData);
disp(topDeath);

%% display results

histogram(myData,58);
title('Most Dangerous Starting Countries - Ebola');
xlabel('Country Index');
ylabel('Number of Times Being Most Deadly');
grid on

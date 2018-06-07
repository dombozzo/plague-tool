%% makeCountryList
% function countryList = makeCountryList
% Creates a list of countries and their corresponding information
% Author: Colin Brankin
% Date: March 3, 2017

function countryList = makeCountryList

% spreadsheet cotains all of the information on each country necessary for
% functionality of the program
spreadsheet = 'CountryData2';

% read in the spreadsheet
[myNumbers,myStrings] = xlsread(spreadsheet);

% set the columns of the excel spreadsheet to the appropriate variables
index = myNumbers(:,1);
name = myStrings(:,1);
population = myNumbers(:,3);
birth = myNumbers(:,4);
death = myNumbers(:,5);
land = myStrings(:,5);
sea = myStrings(:,6);
air = myStrings(:,7);


% used for the purposes of creating the structure countryList
numCountries = length(index);

for iloop = 1:numCountries
    
    countryLand = land{iloop};
    newLand = strsplit(countryLand, ', ');
    
    countrySea = sea{iloop};
    newSea = strsplit(countrySea, ', ');
    
    countryAir = air{iloop};
    newAir = strsplit(countryAir, ', ');
    
    countryList(iloop) = newCountryData(index(iloop),...
        lower(name(iloop)),...
        population(iloop),...
        birth(iloop),...
        death(iloop),...
        lower(newLand),...
        lower(newSea),...
        lower(newAir));
end
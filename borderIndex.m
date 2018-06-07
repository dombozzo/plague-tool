%% borderIndex
% Function [myLand, mySea, myAir] = borderIndex(countryIndex) takes in
% index of one country
% and returns 3 arrays of numbers corresponding to the bordering country
% indices as defined by the structure. Also sorts the country indices
% Author: Colin Brankin
% Date: March 8, 2017

%% Define function

function [myLand, mySea, myAir] = borderIndex(countryIndex)

% call the pre-defined function makeCountryList in order to get information
% on the bordering countries
myList = makeCountryList;

land = myList(countryIndex).land;
sea = myList(countryIndex).sea;
air = myList(countryIndex).air;

myLand = 0;
mySea = 0;
myAir = 0;
%% convert land names to index numbers
for iloop = 1:length(land)
    borderName = land{iloop};
    for iName = 1:length(myList)
        countryName = lower(myList(iName).name);
        if strcmpi(borderName, countryName)
            myLand(iloop) = iName;
        end
    end
end

%% convert sea names to index numbers
for iloop2 = 1:length(sea)
    borderName2 = sea{iloop2};
    for iName2 = 1:length(myList)
        countryName2 = lower(myList(iName2).name);
        if strcmpi(borderName2, countryName2)
            mySea(iloop2) = iName2;
        end
    end
end

%% convert air names to index numbers
for iloop3 = 1:length(air)
    borderName3 = air{iloop3};
    for iName3 = 1:length(myList)
        countryName3 = lower(myList(iName3).name);
        if strcmpi(borderName3, countryName3)
            myAir(iloop3) = iName3;
        end
    end
end

if sum(myLand) ~= 0
    myLand = sort(myLand);
end
if sum(mySea) ~= 0
    mySea = sort(mySea);
end
if sum(myAir) ~= 0
    myAir = sort(myAir);
end
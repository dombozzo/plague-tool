%% allBorderIndex
% Function allBorderIndex uses the pre-defined function borderIndex to
% create a cell array of numerical arrays that contain the country indices
% for the bordering countries
% Author: Colin Brankin
% Date: March 9, 2017

%% define function

function cellArray = allBorderIndex(countryList)

% find the length of countryList, which corresponds to the number of
% indices
NTotal = length(countryList);

% loop through each country in countryList and store the border indicies in
% cellArray
myWait = waitbar(0, 'Running...','Name','allBorderIndex');

for ik = 1:NTotal
    
    [myLand, mySea, myAir] = borderIndex(ik);
    cellArray{ik,1} = myLand;
    cellArray{ik,2} = mySea;
    cellArray{ik,3} = myAir;
    
    waitbar(ik/NTotal, myWait);
end

close(myWait);
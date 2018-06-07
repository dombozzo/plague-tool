%% crossInfect
% Function crossInfect takes in array of border indices, randomly selects
% one, and then returns both the index of the randomly chosen country along
% with an array of remaining border indices

%% define function

function [countryIndex, remainingBorders] = crossInfect(borders)

nBorders = length(borders);

if nBorders == 0
    countryIndex = 0;
    remainingBorders = 0;
else
    myRandi = randi(nBorders);
    countryIndex = borders(myRandi);
end

if nBorders == 1
    remainingBorders = 0;
elseif myRandi == 1
    remainingBorders = borders(2:nBorders);
elseif myRandi == nBorders
    remainingBorders = borders(1:nBorders-1);
else
    part1 = borders(1:myRandi-1);
    part2 = borders(myRandi+1:nBorders);
    remainingBorders = [part1,part2];
end
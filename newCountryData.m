%% newCountryData
% function newCountry = newCountryData(index, name, population, birth, 
% death, land, sea, air)
% Creates a new country with a specified name and specified characteristics
% Author: Colin Brankin
% Date: March 3, 2017

function newCountry = newCountryData(index, name, population, birth,...
    death, land, sea, air)

newCountry.index = index;
newCountry.name = name;
newCountry.population = population;
newCountry.birth = birth;
newCountry.death = death;
newCountry.land = land;
newCountry.sea = sea;
newCountry.air = air;
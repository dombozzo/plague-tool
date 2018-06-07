%% runSimulation
% Runs the simulation based on the input parameters. Spreads the disease
% across every country, stores the game data inside a cell array. Then,
% using the country of origin, the simulation calculates the time delay for
% each country and returns the appropriate arrays for a given amount of
% time.
% Author: Colin Brankin
% Date: April 3, 2017

%% create country structure

function totalDeath = runSimulation(startCountry)

countryList = makeCountryList;

borders = allBorderIndex(countryList);

Ntotal = length(countryList);

%% disease data

diseaseData = readDiseaseData('DiseaseData');

% 1 = ebola         Colin
% 2 = black plague  Matt
% 3 = SARS          Dominic
% 4 = influenza     Grace

diseaseNum = 1;
endTime = diseaseData(diseaseNum,8);
contactRate = diseaseData(diseaseNum,4);
diseaseMortalityRate = diseaseData(diseaseNum,3);    % insert handles
latentPeriod = diseaseData(diseaseNum,1);
infectiousPeriod = diseaseData(diseaseNum,2);
tf = 500;

%% run simulation for each country

% store the information into cell array
spreadData = cell(Ntotal,5);

myWaitbar = waitbar(0, 'Spreading disease...','Name','spread');

for iloop = 1:Ntotal
    
    % access country data
    countryN = countryList(iloop);
    population = countryN.population;
    birthRate = countryN.birth;
    naturalMortalityRate = countryN.death;
    
    % run simulation for closed systems
    [time,S,E,I,D] = spread(population, birthRate,...
        contactRate, naturalMortalityRate, diseaseMortalityRate,...
        latentPeriod, infectiousPeriod, tf);
    
    % store results in cell array
    spreadData{iloop,1} = time;
    spreadData{iloop,2} = S;
    spreadData{iloop,3} = E;
    spreadData{iloop,4} = I;
    spreadData{iloop,5} = D;
    
    waitbar(iloop/Ntotal, myWaitbar);
    
end

close(myWaitbar);

%% select country of origin

% index of start country
% startCountry = 1;

% isInfected keeps track of the status of each country
isInfected = zeros(1,Ntotal);
isInfected(startCountry) = 1;

% parentCountry is array of country indices that have been infected
parentCountry = startCountry;
icount = 1;

%% choose from amongst possible border countries and infect

timeDelay = zeros(1,Ntotal);

thresholdLand = diseaseData(diseaseNum,5); % 30 percent of country is infected
thresholdSea = diseaseData(diseaseNum,6);
thresholdAir = diseaseData(diseaseNum,7);
factor = 0.001;

myWaitbar2 = waitbar(0, 'Making adjustments...','Name','crossInfect');

iloop2 = 0;
myCount = 0;
while icount ~= Ntotal
    iloop2 = iloop2 + 1;
    if iloop2 > length(parentCountry)
        iloop2 = iloop2 - 1;
    end
    index = parentCountry(iloop2);
    
    if myCount > Ntotal
        break
    end
    for it = 1:length(spreadData{index,1}) % accesses time data
        
        numInfectedArray = spreadData{index,4};
        numInfected = numInfectedArray(it);
        percentInfected = numInfected/countryList(index).population;
        
        % find the day that the number of infected people reaches the threshold
        % and allow for the possibility of cross-country infection
        if percentInfected >= thresholdLand
            
            % once the randomization factor hits below the spreading
            % probability, return the country that will be infected via
            % land
            if rand <= factor*percentInfected
                
                % accesses the land border information
                myBord = borders{index,1};
                found = true;
                
                % check to make sure that every country in myBord is not
                % already infected
                if myBord ~= 0
                    for ik = 1:length(myBord)
                        if isInfected(myBord(ik)) == 0
                            found = false;
                        end
                    end
                end
                
                while ~found
                    [countryIndex, remBorders] = crossInfect(myBord);
                    
                    if countryIndex == 0
                        found = true;
                    elseif isInfected(countryIndex) == 0
                        timeDelay(countryIndex) = timeDelay(index) + it;
                        borders{index,1} = remBorders;
                        isInfected(countryIndex) = 1;
                        parentCountry(icount+1) = countryIndex;
                        icount = icount + 1;
                        found = true;
                        waitbar(icount/Ntotal, myWaitbar2);
                    end
                    
                end
                
            end
        end
        
        if percentInfected >= thresholdSea
            
            % once the randomization factor hits below the spreading
            % probability, return the country that will be infected via
            % land
            if rand <= factor*percentInfected
                
                % accesses the land border information
                myBord = borders{index,2};
                found = true;
                
                % check to make sure that every country in myBord is not
                % already infected
                if myBord ~= 0
                    for ik = 1:length(myBord)
                        if isInfected(myBord(ik)) == 0
                            found = false;
                        end
                    end
                end
                
                while ~found
                    [countryIndex, remBorders] = crossInfect(myBord);
                    
                    if countryIndex == 0
                        found = true;
                    elseif isInfected(countryIndex) == 0
                        timeDelay(countryIndex) = timeDelay(index) + it;
                        borders{index,2} = remBorders;
                        isInfected(countryIndex) = 1;
                        parentCountry(icount+1) = countryIndex;
                        icount = icount + 1;
                        found = true;
                        waitbar(icount/Ntotal, myWaitbar2);
                    end
                    
                end
                
            end
        end
        
        if percentInfected >= thresholdAir
            
            % once the randomization factor hits below the spreading
            % probability, return the country that will be infected via
            % land
            if rand <= factor*percentInfected
                
                % accesses the land border information
                myBord = borders{index,3};
                found = true;
                
                % check to make sure that every country in myBord is not
                % already infected
                if myBord ~= 0
                    for ik = 1:length(myBord)
                        if isInfected(myBord(ik)) == 0
                            found = false;
                        end
                    end
                end
                
                while ~found
                    [countryIndex, remBorders] = crossInfect(myBord);
                    
                    if countryIndex == 0
                        found = true;
                    elseif isInfected(countryIndex) == 0
                        timeDelay(countryIndex) = timeDelay(index) + it;
                        borders{index,3} = remBorders;
                        isInfected(countryIndex) = 1;
                        parentCountry(icount+1) = countryIndex;
                        icount = icount + 1;
                        found = true;
                        waitbar(icount/Ntotal, myWaitbar2);
                    end
                    
                end
                
            end
        end
        
    end
    myCount = myCount + 1;
end

close(myWaitbar2);

for ia = 1:Ntotal
    if (timeDelay(ia) == 0 || timeDelay(ia) >= length(spreadData{index,1})) && ia ~= startCountry
        timeDelay(ia) = length(spreadData{index,1});
    end
end

%% use time delays to change SEID arrays

myWaitbar3 = waitbar(0, 'Finishing touches...','Name','timeDelay');

for ientry = 1:length(timeDelay)
    
    timeD = timeDelay(ientry);
    
    currentS = spreadData{ientry,2};
    currentE = spreadData{ientry,3};
    currentI = spreadData{ientry,4};
    currentD = spreadData{ientry,5};
    
    % before the time delay, set S = population and everything else to 0
    addS = countryList(ientry).population*ones(1,timeD);
    S = [addS,currentS(1:length(currentS) - timeD)];
    E = [zeros(1,timeD),currentE(1:length(currentE) - timeD)];
    I = [zeros(1,timeD),currentI(1:length(currentI) - timeD)];
    D = [zeros(1,timeD),currentD(1:length(currentD) - timeD)];
    
    % save the data in spreadData
    spreadData{ientry,2} = S;
    spreadData{ientry,3} = E;
    spreadData{ientry,4} = I;
    spreadData{ientry,5} = D;
    
    waitbar(ientry/Ntotal, myWaitbar3);
end

close(myWaitbar3);

%% plot data

% for iplot = 1:Ntotal
%     figure(iplot);
%     thisTime = spreadData{iplot,1};
%     thisS = spreadData{iplot,2};
%     thisE = spreadData{iplot,3};
%     thisI = spreadData{iplot,4};
%     thisD = spreadData{iplot,5};
%
%     plot(thisTime,thisS,thisTime,thisE,thisTime,thisI,thisTime,thisD);
%     title(['Plague - ', countryList(iplot).name]);
%     xlabel('Time (days)');
%     ylabel('People');
%     legend('Susceptible', 'Exposed', 'Infected', 'Dead');
%     axis([0,200,0,countryList(iplot).population*1.1]);
% end

%% calculate totals

totalS = zeros(1,length(spreadData{1,2}));
totalE = zeros(1,length(spreadData{1,3}));
totalI = zeros(1,length(spreadData{1,4}));
totalD = zeros(1,length(spreadData{1,5}));

for ib = 1:Ntotal
    totalS = totalS + spreadData{ib,2};
    totalE = totalE + spreadData{ib,3};
    totalI = totalI + spreadData{ib,4};
    totalD = totalD + spreadData{ib,5};
end

%% find total death at end time

totalDeath = totalD(endTime*100000/tf);

%% plot totals

figure
time = spreadData{1,1};
for iz = 1:500:length(time)
    plot(popAxes,time(1:iz),totalS(1:iz),...
        popAxes,time(1:iz),totalE(1:iz),...
        popAxes,time(1:iz),totalI(1:iz),...
        popAxes,time(1:iz),totalD(1:iz));
    title(popAxes,['Plague Simulation - ',countryList(startCountry).name]);
    xlabel(popAxes,'Time (days)');
    ylabel(popAxes,'People');
    legend(popAxes,'Susceptible', 'Exposed', 'Infected', 'Dead');
    axis(popAxes,[0,endTime,0,7.5e9]);
    drawnow
end

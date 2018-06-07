%% spread
% Uses the improved euler method to calculate the number of susceptible,
% exposed, infected, and dead in a given system
% Author: Colin Brankin
% Date: April 2, 2017

%% set parameters

function [time,S,E,I,D] = spread(population, birthRate,...
    contactRate, naturalMortalityRate, diseaseMortalityRate,...
    latentPeriod, infectiousPeriod, tf)



B = birthRate/1000;                     % birth rate
beta = contactRate;                  % contact rate
mu = naturalMortalityRate/1000;         % natural mortality rate
omega = diseaseMortalityRate;           % disease mortality rate
gamma = 1/latentPeriod;                 % latent period
epsilon = 1/infectiousPeriod;           % infectious period

t0 = 0;
Nt = 100000;

S0 = population;            % initial number of susceptibles
E0 = 0.0005*S0;             % initial number of exposed
I0 = E0;                    % initial number of infected
D0 = 0;                     % initial number of dead
S0 = S0 - E0 - I0 - D0;
T0 = S0 + E0 + I0 + D0;

%% create arrays

time = linspace(t0,tf,Nt);
deltat = time(2) - time(1);

S = zeros(1,Nt);
E = zeros(1,Nt);
I = zeros(1,Nt);
D = zeros(1,Nt);
natMort = zeros(1,Nt);

S(1) = S0;
E(1) = E0;
I(1) = I0;
D(1) = D0;
natMort(1) = 0;

%% time march

for it = 1:Nt-1
    
    % improved euler method to find next people to be infected
%     E(it+1) = (beta*deltat*S(it)*I(it) + (1 - (epsilon+mu)*deltat/2)*E(it))/(1+(epsilon+mu)*deltat/2);
%     I(it+1) = (epsilon*deltat*(E(it+1)+E(it))/2 + (1 - (gamma+mu)*deltat/2)*I(it))/(1+(gamma+mu)*deltat/2);
%     Ihalf = (I(it+1)+I(it))/2;
%     S(it+1) = (B*deltat + (1 - beta*deltat*Ihalf/2 - mu*deltat/2)*S(it) + (1-omega)*gamma*Ihalf*deltat)/(1 + B*deltat*Ihalf/2 + mu*deltat/2);
%     D(it+1) = D(it) + deltat*omega*gamma*Ihalf;

E(it+1) = (2*(I(it)*beta*deltat*S(it))-(deltat*(epsilon+mu)-2)*E(it))/(deltat*(epsilon+mu)+2);
I(it+1) = (deltat*(E(it)*epsilon+E(it+1)*epsilon-(gamma+mu)*I(it))+2*I(it))/(deltat*(gamma+mu)+2);
S(it+1) = (4*B*deltat-beta*deltat*(I(it+1)+I(it))*S(it)-2*(deltat*(gamma*(I(it)+I(it+1))*(omega-1)+mu*S(it))-2*S(it)))/(beta*deltat*(I(it)+I(it+1))+2*(deltat*mu+2));
D(it+1) = D(it)-(deltat*gamma*(I(it)+I(it+1))*(omega-1))/2;

% E(it+1) = (2*(I(it)*beta*deltat*S(it))-(deltat*(epsilon+mu)-2)*E(it))/(deltat*(epsilon+mu)+2); %E is the same
% 
% I(it+1) = ((I(it)*(2-(deltat*(gamma+mu+omega))))+(deltat*epsilon*(E(it)+E(it+1))))/(2+(deltat*(gamma+mu+omega))); %New I
% 
% S(it+1) = ((2*B*deltat)-((S(it))*(deltat*(0.5*beta*(I(it)+I(it+1))+mu))-2)+(deltat*gamma*(I(it)+I(it+1))))/(2+(deltat*(0.5*beta*(I(it)+I(it+1))+mu))); %New S
% 
% D(it+1) = D(it)+(0.5*omega*deltat*(I(it)+I(it+1))); %New D
    
    % ensures that the number of people never goes negative
    if S(it+1) <= 0
        S(it+1) = 0;
    end
    if E(it+1) <= 0
        E(it+1) = 0;
    end
    if I(it+1) <= 0
        I(it+1) = 0;
    end
    if D(it+1) <= 0
        D(it+1) = 0;
    end
    
    % ensures that the number of people never goes above the population
    if S(it+1) >= T0
        S(it+1) = T0;
    end
    if E(it+1) >= T0
        E(it+1) = T0;
    end
    if I(it+1) >= T0
        I(it+1) = T0;
    end
    if D(it+1) >= T0
        D(it+1) = T0;
    end
    
    natMort(it+1) = T0 - S(it+1) - E(it+1) - I(it+1) - D(it+1);
end

%% find maximum of infected

indexmax = find(max(I) == I);
timeMax = time(indexmax);
infectedMax = I(indexmax);

%% plot results

% figure
% plot(time,S,time,E,time,I,time,D,time,natMort);
% hold on
% plot(timeMax,infectedMax,'ro');
% title('Disease - Improved Euler Method');
% xlabel('Time (days)');
% ylabel('People');
% legend('Susceptible', 'Exposed', 'Infected', 'Dead','Natural Mortality');

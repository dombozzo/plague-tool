INSTALLATION GUIDE
------------------
To install plague-tool, one must have an active liscense of MATLAB and simply pull all files to a single directory 
on a machine.

USER GUIDE
------------------
1. Double click on PlagueTool.m (this is the final program that one must run in MATLAB to generate the interactive GUI).
2. Once GUI has loaded, click radio buttons and list boxes to select specifications of Disease and Start Location.
3. Click "Run Simulation."
4. Watch your disease spread on the World Map and monitor population of the world that is either Dead, Infected, Exposed, or 
Susceptible (no contact with disease yet).
5. Once simulation is 100% complete, choose to change the view to globe.
6. Interact with the newly generated globe image.

BACKGROUND
------------------
The model used for the spreading of diseases is based on direct land borders, international airports and frequency of 
flights, and sea ports within each country/region. For simplification, not all countries were considered individually, 
some were grouped into regions.
The differential equations used to spread the disease based on lethality rates, rate of spread, population density, etc
was based on a SEID model where one is either susceptible, exposed, infected, or dead. Our model was adapted from a 
commonly accepted SEIS model, adapted from the simplest model (SIR). Exploration of different models can be conducted at
https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology#The_SEIS_model

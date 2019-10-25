function plotApplianceValues(simulationDescription)

    applianceValues = {
        'Energy.mat' 'Ener' 'Energy  (kWh)' 'Energy consumption';
        'Cost_Ener.mat' 'Cost' 'Cost (¢)' 'Cost of energy'
    };    
 
    appliancesNames = {'Water Heater','Air Conditioner','Furnace','Range',...
        'Lights','Fridge','Dryer','Dishwasher','Washer','PoolPump','Total'};
    
    plotValues(appliancesNames, applianceValues, simulationDescription);    
end
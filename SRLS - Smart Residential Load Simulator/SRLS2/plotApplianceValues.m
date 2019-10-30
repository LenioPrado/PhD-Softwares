function plotApplianceValues(simulationDescription)

    applianceValues = {
        'Energy.mat' 'Ener' 'Energy  (kWh)' 'Energy consumption';
        'Cost_Ener.mat' 'Cost' 'Cost (¢)' 'Consumption Cost of energy'
    };    
 
    appliancesNames = {'Water Heater','Air Conditioner','Furnace','Range',...
        'Lights','Fridge','Dryer','Dishwasher','Washer','PoolPump','Total'};
    
    plotValues(appliancesNames, applianceValues, simulationDescription);    
end
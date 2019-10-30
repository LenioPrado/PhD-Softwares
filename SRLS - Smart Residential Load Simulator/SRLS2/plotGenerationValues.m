function plotGenerationValues(simulationDescription)

    generationValues = {
        'Gen1.mat' 'Gen1' 'Energy  (kWh)' 'Energy Generation';
        'Gen2.mat' 'Gen2' 'Saving (¢)' 'Generation Cost'
    };

    generationsNames = {'Battery','Wind','PV','Total'};

    plotValues(generationsNames, generationValues, simulationDescription);
end
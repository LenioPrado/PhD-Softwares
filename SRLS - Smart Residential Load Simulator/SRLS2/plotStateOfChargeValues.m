function plotStateOfChargeValues(simulationDescription)

    socValues = {
        'Gen3.mat', 'Gen3', 'SOC (%)', 'Initial State-Of-Charge'
    };

    stateOfChargeNames = {'SOC'};

    plotValues(stateOfChargeNames, socValues, simulationDescription);
end
function plotValues(names, values, simulationDescription)
    hold on;
    valuesSize = size(values);
    
    for value=1:valuesSize(1)            
        fileToLoad = values{value,1};
        fieldName = values{value,2};
        
        loadedValues = load(fileToLoad);
        time = loadedValues.time; 

        
        for index=1:length(names)
            plotTitle = [ names{index} ' - ' values{value,4} ];
            plotLegend = values{value,3};
            dataValues = loadedValues.(fieldName)(index,:);            
            
            plotValue(dataValues,time,'Time (hrs)',plotTitle,plotLegend,simulationDescription);            
        end        
    end    
    hold off;
    close;
end
function plotLoadValues(simulationDescription, index)
    hold on;
    
    if(exist('index','var') == 0)        
        fileName = 'powerValues.mat';
    else
        fileName = ['powerValues' num2str(index,'%d') '.mat'];
    end
    
    loadedValues = load(fileName);
    time = loadedValues.time; 
    dataContent = loadedValues.powerValues;
    dataSize = length(dataContent);   
    
    for index=1:dataSize
        plotTitle = [ 'Load - ' dataContent{index,1} ];
        values = dataContent{index,2};        
        plotLabelX = dataContent{index,3};
        plotLegend = dataContent{index,4};
        plotValue(values,time,plotLabelX,plotTitle,plotLegend,simulationDescription);                   
    end    
    hold off;
    close;
end
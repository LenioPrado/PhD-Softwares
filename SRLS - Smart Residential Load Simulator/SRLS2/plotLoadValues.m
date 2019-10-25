function plotLoadValues(simulationDescription)
    hold on;
    loadedValues = load('powerValues.mat');
    time = loadedValues.time; 
    dataContent = loadedValues.powerValues;
    dataSize = length(dataContent);   
    
    positions = { 'north' 'south' 'east' 'west' 'northeast' 'northwest' 
        'southeast' 'southwest' 'northoutside' 'southoutside' 'eastoutside' 'westoutside' };

    
    for index=1:dataSize
        plotTitle = dataContent(index,1);
        values = dataContent{index,2};        
        plotLabelX = dataContent{index,3};
        plotLegend = dataContent{index,4};
        position = positions(index);
        plotValue(values,time,plotLabelX,plotTitle,plotLegend,simulationDescription,position);                   
    end    
    hold off;
    close;
end

function plotValue(values,time,plotLabelX,plotTitle,plotLegend,simulationDescription,position)
    s = size(values(values > 0));
    if(s(1,2) == 0)
        return
    end
    
    plot(time,values,'Visible','on');grid on;
    xlabel(plotLabelX);
    title(plotTitle);
    h=legend(plotLegend);
    set(h,'Location','best');
    print(['_' simulationDescription '_' plotTitle{1} ],'-djpeg');
    close;
end
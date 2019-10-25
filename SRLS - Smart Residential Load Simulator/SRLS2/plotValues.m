% function plotValues(index)
%     load Energy.mat;
%     Ener1=Ener(index,:);
%     EnePlot = plot(time,Ener1,'Visible','on'); 
%     xlabel('Time (hrs)');ylabel('Energy  (kWh)');
%     title('Energy consumption');
% end

function plotValues(names, values, simulationDescription)
    hold on;
    valuesSize = size(values);
    
    for value=1:valuesSize(1)            
        fileToLoad = values{value,1};
        fieldName = values{value,2};
        plotLabelY = values{value,3};
        plotTitle = values{value,4};
        for index=1:length(names)
            plotLegend = names{index};
            plotValue(fileToLoad,fieldName,plotLabelY,plotTitle,index,plotLegend,simulationDescription);            
        end        
    end    
    hold off;
    close;
end

function plotValue(fileToLoad,fieldName,plotLabelY,plotTitle,index,plotLegend,simulationDescription)
    loadedValues = load(fileToLoad);
    time = loadedValues.time;
    values = loadedValues.(fieldName)(index,:);
    
    s = size(values(values > 0));
    if(s(1,2) == 0)
        return
    end
    
    plot(time,values,'Visible','on');grid on;
    xlabel('Time (hrs)');
    ylabel(plotLabelY);            
    title(plotTitle);
    h=legend(plotLegend);
    set(h,'Location','NorthWest');
    print(['_' simulationDescription '_' plotLegend '_' fieldName],'-djpeg');
    close;
end
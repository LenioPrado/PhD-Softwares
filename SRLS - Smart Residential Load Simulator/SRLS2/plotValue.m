function plotValue(values,time,plotLabelX,plotTitle,plotLegend,simulationDescription)
    s = size(values(values > 0));
    if(s(1,2) == 0)
        return
    end    
    
    plot(time,values,'Visible','on');grid on;
    xlabel(plotLabelX);
    title(plotTitle);
    h=legend(plotLegend);
    set(h,'Location','best');
    print(['_' simulationDescription '_' plotTitle],'-djpeg');
    close;
end
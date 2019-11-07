function totalPowerSum = sumPower(plotTitle)
    for index = 0:30
        fileFolder = '.\Results\Group03\';
        fileName = ['powerValues' num2str(index,'%d') '.mat'];        
        filePath = [fileFolder fileName];
        
        fileExist = exist(filePath,'file');
        if(fileExist > 0)
            loadedValues = load(filePath);
           
            if(exist('totalPowerSum','var') == 0)
                totalPowerSum = loadedValues.powerValues{13,2};
                time = loadedValues.time; 
            else
               currentPowerSum = loadedValues.powerValues{13,2};
               
                s1 = size(totalPowerSum);
                s2 = size(currentPowerSum);
                common = min(s1,s2);
                startSize = common(1);
                endSize = common(2);
               
               totalPowerSum(1:startSize, 1:endSize) = totalPowerSum(1:startSize, 1:endSize) + currentPowerSum(1:startSize, 1:endSize);
           end
        end
    end
    
    if(exist('plotTitle','var') == 0)
        plotTitle = 'House Consumption Power Sum';
    end
    
    plotValue(totalPowerSum,time,'Time in (hrs)',plotTitle,'Power (Watts)','Simulation Power Sum');
end
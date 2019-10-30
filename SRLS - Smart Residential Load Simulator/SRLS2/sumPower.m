function totalPowerSum = sumPower()
    for index = 0:10
        
        fileName = ['powerValues' num2str(index,'%d') '.mat'];
        fileExist = exist(fileName,'file');
        if(fileExist > 0)        
            loadedValues = load(fileName);
           
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
    plotValue(totalPowerSum,time,'Time in (hrs)','House Comsumption Power Sum','Power (Watts)','Simulation Power Sum');
end
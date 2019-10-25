function [Cost_DY Energy_DY Power_DY] = Dryer_calculations(DY_OnOff_DY,time,MinOfLoad_DY,Rate_Elec,LoadsDay_DY,WhenUsed1_DY,WhenUsed2_DY,WhenUsed3_DY);

    
When = [WhenUsed1_DY WhenUsed2_DY WhenUsed3_DY];
Energy_DY =0;
Cost_DY=0;


Power_DY = zeros(1,length(time));
Energy_DY = 0;
Cost_DY = 0;

for a1=1:length(time)
    for a2 = 1:LoadsDay_DY
        WhenUsed = When(a2);
        if time(a1)>=WhenUsed && time(a1)<=(WhenUsed+1)
            Power_DY(a1) = 2500;
        elseif time(a1)>=(WhenUsed+1) && time(a1)<=(WhenUsed+MinOfLoad_DY/60)
            Power_DY(a1) = 500;
        end
        if a1>1
            Energy_DY(a1)= Energy_DY(a1-1)+Power_DY(a1)*(time(a1)-time(a1-1))/1000;
            Cost_DY(a1)=Cost_DY(a1-1)+(Power_DY(a1)*Rate_Elec(a1)/1000)*(time(a1)-time(a1-1));
        end
    end
end

Power_DY=Power_DY.*DY_OnOff_DY;
Energy_DY = Energy_DY.*DY_OnOff_DY;
Cost_DY = Cost_DY.*DY_OnOff_DY;


save Power_DY.mat
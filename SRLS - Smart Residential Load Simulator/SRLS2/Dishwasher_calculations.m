function [Cost_DW Energy_DW Power_DW] = Dishwasher_calculations(DW_OnOff,AnnualPower,time,MinOfLoad,WH_conected,TypeDW,Rate_Elec,LoadsDay,WhenUsed1,WhenUsed2,WhenUsed3);


% if DW_OnOff>=1
    if TypeDW == 1 && WH_conected == 1% low efficiency and WH conected
        P1 = 12/60;    P2 = P1+15/60;    P3 = P2+33/60;    P4 = P3+15/60;
    elseif  TypeDW == 2 && WH_conected == 1% Energy star and WH conected
        P1 = 12/60;    P2 = P1+10/60;    P3 = P2+15/60;    P4 = P3+10/60;
    elseif TypeDW == 1 && WH_conected == 0% low efficiency without WH conected
        P1 = 12/60;    P2 = P1+25/60;    P3 = P2+33/60;    P4 = P3+25/60;
    elseif  TypeDW == 2 && WH_conected == 0% Energy star without WH conected
        P1 = 12/60;    P2 = P1+20/60;    P3 = P2+15/60;    P4 = P3+20/60;    
    end
% end
    
When = [WhenUsed1 WhenUsed2 WhenUsed3];
Energy_DW =0;
Cost_CD=0;

Watt_load = AnnualPower/192;
Power_DW = zeros(1,length(time));
Energy_DW = 0;
Cost_DW = 0;

for a1=1:length(time)
    for a2 = 1:LoadsDay
        WhenUsed = When(a2);
        if time(a1)>=WhenUsed && time(a1)<=(WhenUsed+P1)
            Power_DW(a1) = 200;
        elseif time(a1)>=(WhenUsed+P1) && time(a1)<=(WhenUsed+P2)
                Power_DW(a1) = (Watt_load*0.55*0.5/(MinOfLoad*0.15/60))*1000;
        elseif time(a1)>=(WhenUsed+P2) && time(a1)<=(WhenUsed+P3)
                Power_DW(a1) = 200;
        elseif time(a1)>=(WhenUsed+P3) && time(a1)<=(WhenUsed+P4)
            Power_DW(a1) = (Watt_load*0.55*0.5/(MinOfLoad*0.15/60))*1000;
        elseif time(a1)>=(WhenUsed+P4) && time(a1)<=(WhenUsed+ MinOfLoad/60)
            Power_DW(a1) = 200;
        end
        if a1>1
            Energy_DW(a1)= Energy_DW(a1-1)+Power_DW(a1)*(time(a1)-time(a1-1))/1000;
            Cost_DW(a1)=Cost_DW(a1-1)+(Power_DW(a1)*Rate_Elec(a1)/1000)*(time(a1)-time(a1-1));
        end
    end
end

Power_DW  = Power_DW.*DW_OnOff;
Energy_DW = Energy_DW.*DW_OnOff;
Cost_DW   = Cost_DW.*DW_OnOff;


save Power_DW.mat;
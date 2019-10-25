function [Cost_DW Energy_DW Power_DW] = Clothwasher_calculations(DW_OnOff,AnnualPower,time,MinOfLoad,WH_conected,TypeDW,Rate_Elec,LoadsDay,WhenUsed1,WhenUsed2,WhenUsed3,WaterTemp);


% if DW_OnOff>=1
    if TypeDW == 1 && WH_conected == 1% low efficiency and WH conected
        P1 = 7/60;    P2 = P1+11/60;    P3 = P2+7/60;    P4 = P3+5/60;
    elseif  TypeDW == 2 && WH_conected == 1% Energy star and WH conected
        P1 = 7/60;    P2 = P1+7/60;    P3 = P2+7/60;    P4 = P3+5/60;
    elseif TypeDW == 1 && WH_conected == 0% low efficiency without WH conected
        P1 = 7/60;    P2 = P1+14/60;    P3 = P2+7/60;    P4 = P3+8/60;
    elseif  TypeDW == 2 && WH_conected == 0% Energy star without WH conected
        P1 = 7/60;    P2 = P1+14/60;    P3 = P2+7/60;    P4 = P3+8/60;    
    end
% end
   
When = [WhenUsed1 WhenUsed2 WhenUsed3];
Energy_DW =0;
Cost_CD=0;

Watt_load = AnnualPower/384;
Power_DW = zeros(1,length(time));
Energy_DW = 0;
Cost_DW = 0;

if WaterTemp==1
    CoWarHot = 1;
elseif WaterTemp==2
    CoWarHot = 12;
elseif WaterTemp==3
    CoWarHot = 15;
end

for a1=1:length(time)
    for a2 = 1:LoadsDay
        WhenUsed = When(a2);
        if time(a1)>=WhenUsed && time(a1)<=(WhenUsed+P1)
            Power_DW(a1) = 200;
        elseif time(a1)>=(WhenUsed+P1) && time(a1)<=(WhenUsed+P2)
                Power_DW(a1) = 200*CoWarHot;
        elseif time(a1)>=(WhenUsed+P2) && time(a1)<=(WhenUsed+P3)
            if WaterTemp==1
                Power_DW(a1) = 200*CoWarHot;
            else
                Power_DW(a1) = 35*CoWarHot;
            end
        elseif time(a1)>=(WhenUsed+P3) && time(a1)<=(WhenUsed+P4)
            Power_DW(a1) = 200;
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

Power_CW = Power_DW;
save Power_CW.mat

% subplot(3,1,1);plot(time,Power_DW,time,Energy_DW,time,Cost_DW)
% pause
%    
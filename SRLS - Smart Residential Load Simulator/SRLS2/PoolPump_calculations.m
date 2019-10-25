function [Cost_PP Energy_PP Power_PP] = PoolPump_calculations(PP_OnOff_PP,time,MinOfLoad_PP,Rate_Elec,LoadsDay_PP,WhenUsed1_PP,WhenUsed2_PP,WhenUsed3_PP);

    
When = [WhenUsed1_PP WhenUsed2_PP WhenUsed3_PP];
Energy_PP =0;
Cost_PP=0;


Power_PP = zeros(1,length(time));
Energy_PP = 0;
Cost_PP = 0;

for a1=1:length(time)
    for a2 = 1:LoadsDay_PP
        WhenUsed = When(a2);
        if time(a1)>=WhenUsed && time(a1)<=(WhenUsed+1)
            Power_PP(a1) = 2000;
        elseif time(a1)>=(WhenUsed+1) && time(a1)<=(WhenUsed+MinOfLoad_PP/60)
            Power_PP(a1) = 1000;
        end
        if a1>1
            Energy_PP(a1)= Energy_PP(a1-1)+Power_PP(a1)*(time(a1)-time(a1-1))/1000;
            Cost_PP(a1)=Cost_PP(a1-1)+(Power_PP(a1)*Rate_Elec(a1)/1000)*(time(a1)-time(a1-1));
        end
    end
end

Power_PP=Power_PP.*PP_OnOff_PP;
Energy_PP = Energy_PP.*PP_OnOff_PP;
Cost_PP = Cost_PP.*PP_OnOff_PP;


save Power_PP.mat
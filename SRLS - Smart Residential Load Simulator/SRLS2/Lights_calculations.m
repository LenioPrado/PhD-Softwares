function [Cost_LG Energy_LG Power_LG] = Lights_calculations(H_many,Power,ON_Morning,hrs_Morning,ON_Night,hrs_Night,time,Rate_Elec);


% H_many,Power,ON_Morning,hrs_Morning,ON_Night,hrs_Night
    
% When = [WhenUsed1_DY WhenUsed2_DY WhenUsed3_DY];
% Energy_DY =0;
% Cost_DY=0;


Power_LG = 0;
Energy_LG = 0;
Cost_LG = 0;

for a1=1:length(time)
%     for a2 = 1:2
        if ON_Morning >= time(a1)  ||  (ON_Morning+hrs_Morning) <= time(a1) &&...
            ON_Night >= time(a1)  ||  (ON_Night+hrs_Night) <= time(a1)
            Power_LG(a1) = 0;
        else
            Power_LG(a1) = Power*H_many;
        end
        if a1>1
            Energy_LG(a1)= Energy_LG(a1-1)+Power_LG(a1)*(time(a1)-time(a1-1))/1000;
            Cost_LG(a1)=Cost_LG(a1-1)+(Power_LG(a1)*Rate_Elec(a1)/1000)*(time(a1)-time(a1-1));
        end
%     end
end

save Power_LG.mat
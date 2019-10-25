function [Cost_SV Energy_SV Power_SV] = Stove_calculations(TOU_Mor1,TOU_Noon1,TOU_Nig1,switchedOn_Mor1,switchedOn_Noon1,switchedOn_Nig1,B1,B2,B3,B4,SB1,SB2,SB3,SB4,time,Rate_Elec,OnOff_Range);


% H_many,Power,ON_Morning,hrs_Morning,ON_Night,hrs_Night
    
% When = [WhenUsed1_DY WhenUsed2_DY WhenUsed3_DY];
% Energy_DY =0;
% Cost_DY=0;


Power_SV = 0;
Energy_SV = 0;
Cost_SV = 0;

for a1=1:length(time)
   if switchedOn_Mor1 >= time(a1)  ||  (switchedOn_Mor1+TOU_Mor1) <= time(a1) &&...
       switchedOn_Noon1 >= time(a1)  ||  (switchedOn_Noon1+TOU_Noon1) <= time(a1) &&...
       switchedOn_Nig1 >= time(a1)  ||  (switchedOn_Nig1+TOU_Nig1) <= time(a1)
        Power_SV(a1) = 0;
    else
        Power_SV(a1) = B1*SB1+B2*SB2+B3*SB3+B4*SB4;
    end
        if a1>1
            Energy_SV(a1)= Energy_SV(a1-1)+Power_SV(a1)*(time(a1)-time(a1-1))/1000;
            Cost_SV(a1)=Cost_SV(a1-1)+(Power_SV(a1)*Rate_Elec(a1)/1000)*(time(a1)-time(a1-1));
        end
end


Power_SV  = Power_SV.*OnOff_Range;
Energy_SV = Energy_SV.*OnOff_Range;
Cost_SV   = Cost_SV.*OnOff_Range;

save Power_SV.mat
    

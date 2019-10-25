% clear all
% clear variables
% close all
% clc

% h = waitbar(10,'Please wait...');
% steps = 5000;
% for step = 1:steps
%     % computations take place here
%     waitbar(step / steps)
% end
% close(h)
% time = 0:0.005:24;
    
%% Price of electricity   
Rate_season = str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
Ele_off  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_off','Value'));
Ele_mid  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_mid','Value'));
Ele_peak = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_peak','Value'));
Rate_Elec = Price_electricity(Rate_season,Ele_off,Ele_mid,Ele_peak,time);%calculating the price of electricity during the day

%% Dishwasher
DW_OnOff    = str2double(get_param('Energy_Cost/Dishwasher/DW_OnOff','Value'));
AnnualPower = str2double(get_param('Energy_Cost/Dishwasher/AnnualPower','Value'));
LoadsDay  = str2double(get_param('Energy_Cost/Dishwasher/LoadsDay','Value'));
MinOfLoad = str2double(get_param('Energy_Cost/Dishwasher/MinOfLoad','Value'));
WhenUsed1 = str2double(get_param('Energy_Cost/Dishwasher/WhenUsed1','Value'));
WhenUsed2 = str2double(get_param('Energy_Cost/Dishwasher/WhenUsed2','Value'));
WhenUsed3 = str2double(get_param('Energy_Cost/Dishwasher/WhenUsed3','Value'));
TypeDW = str2double(get_param('Energy_Cost/Dishwasher/TypeDW','Value'));
WH_conected = str2double(get_param('Energy_Cost/Dishwasher/WH conected','Value'));

[Cost_DW Energy_DW Power_DW] = Dishwasher_calculations(DW_OnOff,AnnualPower,time,MinOfLoad,WH_conected,TypeDW,Rate_Elec,LoadsDay,WhenUsed1,WhenUsed2,WhenUsed3);

%% Dryer

DY_OnOff_DY    = str2double(get_param('Energy_Cost/Dryer/DY_OnOff','Value'));
LoadsDay_DY  = str2double(get_param('Energy_Cost/Dryer/LoadsDay','Value'));
MinOfLoad_DY = str2double(get_param('Energy_Cost/Dryer/MinOfLoad','Value'));
WhenUsed1_DY = str2double(get_param('Energy_Cost/Dryer/WhenUsed1','Value'));
WhenUsed2_DY = str2double(get_param('Energy_Cost/Dryer/WhenUsed2','Value'));
WhenUsed3_DY = str2double(get_param('Energy_Cost/Dryer/WhenUsed3','Value'));

[Cost_DY Energy_DY Power_DY]  = Dryer_calculations(DY_OnOff_DY,time,MinOfLoad_DY,Rate_Elec,LoadsDay_DY,WhenUsed1_DY,WhenUsed2_DY,WhenUsed3_DY);

%% Lights

%Bulbs
H_many = str2double(get_param('Energy_Cost/Lighting/H_Many','Value'));
Power  = str2double(get_param('Energy_Cost/Lighting/Power','Value'));
ON_Morning  =  str2double(get_param('Energy_Cost/Lighting/ON_Morning','Value'));
hrs_Morning =  str2double(get_param('Energy_Cost/Lighting/hrs_Morning','Value'));
ON_Night    =  str2double(get_param('Energy_Cost/Lighting/ON_Night','Value'));
hrs_Night   =  str2double(get_param('Energy_Cost/Lighting/hrs_Night','Value'));


%CFLs
H_many_CFL = str2double(get_param('Energy_Cost/Lighting/H_Many_CFL','Value'));
Power_CFL  = str2double(get_param('Energy_Cost/Lighting/Power_CFL','Value'));
ON_Morning_CFL  =  str2double(get_param('Energy_Cost/Lighting/ON_Morning_CFL','Value'));
hrs_Morning_CFL =  str2double(get_param('Energy_Cost/Lighting/hrs_Morning_CFL','Value'));
ON_Night_CFL    =  str2double(get_param('Energy_Cost/Lighting/ON_Night_CFL','Value'));
hrs_Night_CFL   =  str2double(get_param('Energy_Cost/Lighting/hrs_Night_CFL','Value'));


%CFLs
H_many_FLU = str2double(get_param('Energy_Cost/Lighting/H_Many_FLU','Value'));
Power_FLU  = str2double(get_param('Energy_Cost/Lighting/Power_FLU','Value'));
ON_Morning_FLU  =  str2double(get_param('Energy_Cost/Lighting/ON_Morning_FLU','Value'));
hrs_Morning_FLU =  str2double(get_param('Energy_Cost/Lighting/hrs_Morning_FLU','Value'));
ON_Night_FLU    =  str2double(get_param('Energy_Cost/Lighting/ON_Night_FLU','Value'));
hrs_Night_FLU   =  str2double(get_param('Energy_Cost/Lighting/hrs_Night_FLU','Value'));


% H_many_FLU = 0;
[Cost_LGB    Energy_LGB    Power_LGB]    = Lights_calculations(H_many,Power,ON_Morning,hrs_Morning,ON_Night,hrs_Night,time,Rate_Elec);
[Cost_LGCFL Energy_LGCFL Power_LGCFL] = Lights_calculations(H_many_CFL,Power_CFL,ON_Morning_CFL,hrs_Morning_CFL,ON_Night_CFL,hrs_Night_CFL,time,Rate_Elec);
[Cost_LGFLU Energy_LGFLU Power_LGFLU] = Lights_calculations(H_many_FLU,Power_FLU,ON_Morning_FLU,hrs_Morning_FLU,ON_Night_FLU,hrs_Night_FLU,time,Rate_Elec);


Cost_LG   = Cost_LGB + Cost_LGCFL + Cost_LGFLU;
Energy_LG = Energy_LGB + Energy_LGCFL + Energy_LGFLU;
Pow_LG  = Power_LGB + Power_LGCFL + Power_LGFLU;
save Pow_LG.mat

%% Stove

TOU_Mor1  =  str2double(get_param('Energy_Cost/Range/TOU_Mor1','Value'));
TOU_Noon1 =  str2double(get_param('Energy_Cost/Range/TOU_Noon1','Value'));
TOU_Nig1  =  str2double(get_param('Energy_Cost/Range/TOU_Nig1','Value'));
switchedOn_Mor1  =  str2double(get_param('Energy_Cost/Range/switchedOn_Mor1','Value'));
switchedOn_Noon1 =  str2double(get_param('Energy_Cost/Range/switchedOn_Noon1','Value'));
switchedOn_Nig1  =  str2double(get_param('Energy_Cost/Range/switchedOn_Nig1','Value'));

B1 = str2double(get_param('Energy_Cost/Range/B1','Value'));
B2 = str2double(get_param('Energy_Cost/Range/B2','Value'));
B3 = str2double(get_param('Energy_Cost/Range/B3','Value'));
B4 = str2double(get_param('Energy_Cost/Range/B4','Value'));
SB1 = str2double(get_param('Energy_Cost/Range/SB1','Value'));
SB2 = str2double(get_param('Energy_Cost/Range/SB2','Value'));
SB3 = str2double(get_param('Energy_Cost/Range/SB3','Value'));
SB4 = str2double(get_param('Energy_Cost/Range/SB4','Value'));
OnOff_Range = str2double(get_param('Energy_Cost/Range/OnOff_Range','Value'));

[Cost_SV Energy_SV Power_SV]=Stove_calculations(TOU_Mor1,TOU_Noon1,TOU_Nig1,switchedOn_Mor1,switchedOn_Noon1,switchedOn_Nig1,B1,B2,B3,B4,SB1,SB2,SB3,SB4,time,Rate_Elec,OnOff_Range);

%% Clothwasher
DW_OnOff    = str2double(get_param('Energy_Cost/Clothwasher/DW_OnOff','Value'));
AnnualPower = str2double(get_param('Energy_Cost/Clothwasher/AnnualPower','Value'));
LoadsDay  = str2double(get_param('Energy_Cost/Clothwasher/LoadsDay','Value'));
MinOfLoad = str2double(get_param('Energy_Cost/Clothwasher/MinOfLoad','Value'));
WhenUsed1 = str2double(get_param('Energy_Cost/Clothwasher/WhenUsed1','Value'));
WhenUsed2 = str2double(get_param('Energy_Cost/Clothwasher/WhenUsed2','Value'));
WhenUsed3 = str2double(get_param('Energy_Cost/Clothwasher/WhenUsed3','Value'));
TypeDW = str2double(get_param('Energy_Cost/Clothwasher/TypeDW','Value'));
WH_conected = str2double(get_param('Energy_Cost/Clothwasher/WH conected','Value'));
WaterTemp = str2double(get_param('Energy_Cost/Clothwasher/WaterTemp','Value'));

[Cost_CW Energy_CW Power_CW] = Clothwasher_calculations(DW_OnOff,AnnualPower,time,MinOfLoad,WH_conected,TypeDW,Rate_Elec,LoadsDay,WhenUsed1,WhenUsed2,WhenUsed3,WaterTemp);

%% PoolPump

PP_OnOff_PP  = str2double(get_param('Energy_Cost/PoolPump/PP_OnOff','Value'));
LoadsDay_PP  = str2double(get_param('Energy_Cost/PoolPump/LoadsDay','Value'));
MinOfLoad_PP = str2double(get_param('Energy_Cost/PoolPump/MinOfLoad','Value'));
WhenUsed1_PP = str2double(get_param('Energy_Cost/PoolPump/WhenUsed1','Value'));
WhenUsed2_PP = str2double(get_param('Energy_Cost/PoolPump/WhenUsed2','Value'));
WhenUsed3_PP = str2double(get_param('Energy_Cost/PoolPump/WhenUsed3','Value'));

[Cost_PP Energy_PP Power_PP]  = PoolPump_calculations(PP_OnOff_PP,time,MinOfLoad_PP,Rate_Elec,LoadsDay_PP,WhenUsed1_PP,WhenUsed2_PP,WhenUsed3_PP);
%%

% 
%     Cost = [zeros(1,length(time))
%             zeros(1,length(time))
%             zeros(1,length(time))
%             Cost_SV
%             Cost_LG
%             zeros(1,length(time))
%             Cost_DY
%             Cost_DW
%             Cost_CW];
%         
%         
%     Ener = [zeros(1,length(time))
%             zeros(1,length(time))
%             zeros(1,length(time))
%             Energy_SV
%             Energy_LG
%             zeros(1,length(time))
%             Energy_DY
%             Energy_DW
%             Energy_CW];
% 
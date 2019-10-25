function result = processResults()

load SOC.mat;
load Cost_KW_BT2.mat;

filas =1;
columnas =1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'SOC'};
Gen3 = [Cost_KW_BT2(3,:)];
Total_Gen3 = sum(Gen3);
Gen3(2,:)=Total_Gen3;

%%

filas =3;
columnas =1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'Battery'};
num_elem(2,1)={'Wind'};
num_elem(3,1)={'PV'};
num_elem(4,1)={'Total'};

load Cost_KW_BT.mat;
load Cost_KW_WD.mat;
load Cost_KW_PV.mat;
     
% 
Gen1= [ Cost_KW_BT(3,:)
        Cost_KW_WD(3,:)
        Cost_KW_PV(3,:)
];
%         
Total_Gen1 = sum(Gen1);
Gen1(4,:)=Total_Gen1;

Gen2 = [Cost_KW_BT(2,:)
        Cost_KW_WD(2,:)
        Cost_KW_PV(2,:)
];
   
 Total_Gen2 = sum(Gen2);
Gen2(4,:)=Total_Gen2;
filas =10;
columnas = 1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'Water Heater'};
num_elem(2,1)={'Air Conditioner'};
num_elem(3,1)={'Furnace'};
num_elem(4,1)={'Range'};
num_elem(5,1)={'Lights'};
num_elem(6,1)={'Fridge'};
num_elem(7,1)={'Dryer'};
num_elem(8,1)={'Dishwasher'};
num_elem(9,1)={'Washer'};
num_elem(10,1)={'PoolPump'};
num_elem(11,1)={'Total'};
load Cost_KW_WH.mat;
time = Cost_KW_WH(1,:);

save('Gen1.mat','Gen1','time');
save('Gen2.mat','Gen2','time');
save('Gen3.mat','Gen3','time');
  
%% Price of electricity   
Rate_season = str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
Ele_off  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_off','Value'));
Ele_mid  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_mid','Value'));
Ele_peak = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_peak','Value'));

Rate_Elec = Price_electricity(Rate_season,Ele_off,Ele_mid,Ele_peak,time);%calculating the price of electricity during the day

waitforbar;

%% load variables from simulink
    load Pow_Cost_AC;        % This is for the AC or Heater at the same time
    load Cost_KW_Ran;
    load Lighting_Total_LG.mat;
    load Cost_KW_Fridge.mat;

    Ener = [Cost_KW_WH(3,:)
            Pow_Cost_AC(3,:)
            Pow_Cost_AC(3,:).*(-1)
            Energy_SV
            Energy_LG
            Cost_KW_Fridge(3,:)
            Energy_DY
            Energy_DW
            Energy_CW
            Energy_PP];
        
   WH_GASELEC = str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_Ele_WH','Value'));
   if WH_GASELEC==0
      Ener(1,:) = Ener(1,:)*9.932;
   end
   
   AC_HT=  str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
    if AC_HT==1
        Ener(2,:) = 0;
    else 
        Ener(3,:) = 0;
    end
   
    Total_Ener = sum(Ener);
Ener(11,:)=Total_Ener;
save('Energy.mat','Ener','time');

%%
    Cost = [Cost_KW_WH(4,:)
            Pow_Cost_AC(4,:)
            Pow_Cost_AC(4,:).*(-1)/9.932
            Cost_SV
            Cost_LG
            Cost_KW_Fridge(4,:)
            Cost_DY
            Cost_DW
            Cost_CW
            Cost_PP];
    AC_HT=  str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
    if AC_HT==1
        Cost(2,:) = 0;
    else 
        Cost(3,:) = 0;
    end
    Total_Co = sum(Cost);
    Cost(11,:)=Total_Co;
    
 save('Cost_Ener.mat','Cost','time');   

% save(filename, variables)    
    T1 = length(find(time(1,:)<=7));
    T2 = length(find(time(1,:)<=11));
    T3 = length(find(time(1,:)<=17));
    T4 = length(find(time(1,:)<=19));
  Total_Energy = Total_Ener(1,length(Total_Ener));
  Total_Cost = Total_Co(1,length(Total_Co));

  Total_Gen = Total_Gen1(1,length(Total_Gen1));
  Total_Genco = Total_Gen2(1,length(Total_Gen2));

%% 
% Rate_season=get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value');
Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
if Rate_season==1
    OffPeak_En = Total_Energy-Total_Ener(1,T4)+Total_Ener(1,T1);
    MidPeak_En = Total_Ener(1,T2) - Total_Ener(1,T1)+Total_Ener(1,T4)-Total_Ener(1,T3);
    OnPeak_En = Total_Ener(1,T3)-Total_Ener(1,T2);
    
    OffPeak_Co = (Total_Cost-Total_Co(1,T4)+Total_Co(1,T1))/100;
    MidPeak_Co = (Total_Co(1,T2) - Total_Co(1,T1)+Total_Co(1,T4)-Total_Co(1,T3))/100;
    OnPeak_Co  = (Total_Co(1,T3)-Total_Co(1,T2))/100;
   
else
    OffPeak_En = Total_Energy-Total_Ener(1,T4)+Total_Ener(1,T1);
    MidPeak_En = Total_Ener(1,T3)-Total_Ener(1,T2);
    OnPeak_En = Total_Ener(1,T2)-Total_Ener(1,T1)+Total_Ener(1,T4)-Total_Ener(1,T3);
    
    OffPeak_Co = (Total_Cost-Total_Co(1,T4)+Total_Co(1,T1))/100;
    MidPeak_Co = (Total_Co(1,T3)-Total_Co(1,T2))/100;
    OnPeak_Co = (Total_Co(1,T2)-Total_Co(1,T1)+Total_Co(1,T4)-Total_Co(1,T3))/100;    
end

   if WH_GASELEC==0 %if gas water heater
      Cost_Gas = Cost_KW_WH(4,:);
      Total_EnerGas = Cost_KW_WH(3,:);
      
      Total_CostGas = Cost_Gas(1,length(Cost_Gas));   
      Total_CoGas = Cost_Gas;

      Total_EnergyGas = Total_EnerGas(1,length(Total_EnerGas))*9.932;
      Total_EnerGas = Total_EnerGas*9.932;
%       Total_CoGas = sum(Cost_Gas)

        Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
        if Rate_season==1
            OffPeak_EnGas = Total_EnergyGas-Total_EnerGas(1,T4)+Total_EnerGas(1,T1);
            MidPeak_EnGas = Total_EnerGas(1,T2) - Total_EnerGas(1,T1)+Total_EnerGas(1,T4)-Total_EnerGas(1,T3);
            OnPeak_EnGas = Total_EnerGas(1,T3)-Total_EnerGas(1,T2);
    
            OffPeak_Gas = (Total_CostGas-Total_CoGas(1,T4)+Total_CoGas(1,T1))/100;
            MidPeak_Gas = (Total_CoGas(1,T2) - Total_CoGas(1,T1)+Total_CoGas(1,T4)-Total_CoGas(1,T3))/100;
            OnPeak_Gas  = (Total_CoGas(1,T3)-Total_CoGas(1,T2))/100;
        else
            OffPeak_EnGas = Total_EnergyGas-Total_EnerGas(1,T4)+Total_EnerGas(1,T1);
            MidPeak_EnGas = Total_EnerGas(1,T3)-Total_EnerGas(1,T2);
            OnPeak_EnGas = Total_EnerGas(1,T2)-Total_EnerGas(1,T1)+Total_EnerGas(1,T4)-Total_EnerGas(1,T3);

            OffPeak_Gas = (Total_CostGas-Total_CoGas(1,T4)+Total_CoGas(1,T1))/100;
            MidPeak_Gas = (Total_CoGas(1,T3)-Total_CoGas(1,T2))/100;
            OnPeak_Gas = (Total_CoGas(1,T2)-Total_CoGas(1,T1)+Total_CoGas(1,T4)-Total_CoGas(1,T3))/100;
        end

        OffPeak_Co = OffPeak_Co - OffPeak_Gas;
        MidPeak_Co = MidPeak_Co - MidPeak_Gas;
        OnPeak_Co  = OnPeak_Co - OnPeak_Gas;

        OffPeak_En = OffPeak_En - OffPeak_EnGas;
        MidPeak_En = MidPeak_En - MidPeak_EnGas;
        OnPeak_En  = OnPeak_En - OnPeak_EnGas;
        
        m3GasWH = Total_EnerGas(1,length(Total_EnerGas))/9.932;
        Total_costOfGasWH = Cost_KW_WH(4,length(Cost_KW_WH(4,:)))/100;
   else
       m3GasWH =0;
       Total_costOfGasWH=0;
       
   end
        %%
   if  AC_HT==1  %if furnace       
      Cost_GasF = Pow_Cost_AC(4,:).*(-1)/9.932;
      Total_EnerGasF = Pow_Cost_AC(3,:).*(-1);
      
      Total_CostGasF = Cost_GasF(1,length(Cost_GasF));   
      Total_CoGasF = Cost_GasF;

      Total_EnergyGasF = Total_EnerGasF(1,length(Total_EnerGasF));
      Total_EnerGasF = Total_EnerGasF;
%       Total_CoGas = sum(Cost_Gas)

        Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
        if Rate_season==1
            OffPeak_EnGasF = Total_EnergyGasF-Total_EnerGasF(1,T4)+Total_EnerGasF(1,T1);
            MidPeak_EnGasF = Total_EnerGasF(1,T2) - Total_EnerGasF(1,T1)+Total_EnerGasF(1,T4)-Total_EnerGasF(1,T3);
            OnPeak_EnGasF = Total_EnerGasF(1,T3)-Total_EnerGasF(1,T2);
    
            OffPeak_GasF = (Total_CostGasF-Total_CoGasF(1,T4)+Total_CoGasF(1,T1))/100;
            MidPeak_GasF = (Total_CoGasF(1,T2) - Total_CoGasF(1,T1)+Total_CoGasF(1,T4)-Total_CoGasF(1,T3))/100;
            OnPeak_GasF  = (Total_CoGasF(1,T3)-Total_CoGasF(1,T2))/100;
        else
            OffPeak_EnGasF = Total_EnergyGasF-Total_EnerGasF(1,T4)+Total_EnerGasF(1,T1);
            MidPeak_EnGasF = Total_EnerGasF(1,T3)-Total_EnerGasF(1,T2);
            OnPeak_EnGasF = Total_EnerGasF(1,T2)-Total_EnerGasF(1,T1)+Total_EnerGasF(1,T4)-Total_EnerGasF(1,T3);

            OffPeak_GasF = (Total_CostGasF-Total_CoGasF(1,T4)+Total_CoGasF(1,T1))/100;
            MidPeak_GasF = (Total_CoGasF(1,T3)-Total_CoGasF(1,T2))/100;
            OnPeak_GasF = (Total_CoGasF(1,T2)-Total_CoGasF(1,T1)+Total_CoGasF(1,T4)-Total_CoGasF(1,T3))/100;
        end

        OffPeak_Co = OffPeak_Co - OffPeak_GasF;
        MidPeak_Co = MidPeak_Co - MidPeak_GasF;
        OnPeak_Co  = OnPeak_Co - OnPeak_GasF;

        OffPeak_En = OffPeak_En - OffPeak_EnGasF;
        MidPeak_En = MidPeak_En - MidPeak_EnGasF;
        OnPeak_En  = OnPeak_En - OnPeak_EnGasF;
        
        m3GasF = Total_EnerGasF(1,length(Total_EnerGasF))/9.932;
        Total_costOfGasF = Pow_Cost_AC(4,length(Pow_Cost_AC(4,:)))/100  .*(-1)/9.932;
   else
       m3GasF = 0;
       Total_costOfGasF =0;
  
     end

  if AC_HT ~=1 &&  WH_GASELEC~=0
    m3GasWH = 0;
    m3GasF = 0;
    Total_costOfGasWH = 0;
    Total_costOfGasF = 0;
  end

   m3Gas = m3GasWH + m3GasF;
   Total_costOfGas = Total_costOfGasWH + Total_costOfGasF;

OffPeak_Color = [0 0 1];
MidPeak_Color = [1 0.694 0.392];
OnPeak_Color = [1 0 0];

                 Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));    
if Rate_season==1
    OffPeak_Gen = Total_Gen-Total_Gen1(1,T4)+Total_Gen1(1,T1);
    MidPeak_Gen = Total_Gen1(1,T2) - Total_Gen1(1,T1)+Total_Gen1(1,T4)-Total_Gen1(1,T3);
    OnPeak_Gen = Total_Gen1(1,T3)-Total_Gen1(1,T2);
    
    OffPeak_Genco = (Total_Genco-Total_Gen2(1,T4)+Total_Gen2(1,T1))/100;
    MidPeak_Genco = (Total_Gen2(1,T2) - Total_Gen2(1,T1)+Total_Gen2(1,T4)-Total_Gen2(1,T3))/100;
    OnPeak_Genco  = (Total_Gen2(1,T3)-Total_Gen2(1,T2))/100;
   
else
    OffPeak_Gen = Total_Gen-Total_Gen1(1,T4)+Total_Gen1(1,T1);
    MidPeak_Gen = Total_Gen1(1,T3)-Total_Gen1(1,T2);
    OnPeak_Gen = Total_Gen1(1,T2)-Total_Gen1(1,T1)+Total_Gen1(1,T4)-Total_Gen1(1,T3);
    
    OffPeak_Genco = (Total_Genco-Total_Gen2(1,T4)+Total_Gen2(1,T1))/100;
    MidPeak_Genco = (Total_Gen2(1,T3)-Total_Gen2(1,T2))/100;
    OnPeak_Genco = (Total_Gen2(1,T2)-Total_Gen2(1,T1)+Total_Gen2(1,T4)-Total_Gen2(1,T3))/100;    
end      
%
    result.season = Rate_season;
    result.off = Ele_off;
    result.mid = Ele_mid;
    result.peak = Ele_peak;

powerUsage();

end
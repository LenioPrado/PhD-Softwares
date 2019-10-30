function powerValues = powerUsage(index)

    load Cost_KW_WH.mat;
    load Pow_Tem_WCon_WH;
    time = Pow_Tem_WCon_WH(1,:);
    WH = [Pow_Tem_WCon_WH(2:3,:); Cost_KW_WH(2,:)];
           
    %% AC and HT
    load Pow_Cost_AC;        % This is for the AC or Heater at the same time
    load RoomsTemp;
    
    ACHT= str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
    ACHT = 2;
   
    if ACHT==1  %% Heater
        AC_HT = [Pow_Cost_AC(2,:).*(-1)/3.412; RoomsTemp(2:5,:)]; 
    else        %% AC
        AC_HT = [Pow_Cost_AC(2,:)./3.412; RoomsTemp(2:5,:)];
    end
        
    load Cost_KW_Ran;           %% Range    
    load Lighting_Total_LG.mat; %% Light       
    load Cost_KW_Fridge.mat;    %% Fridge 
    load Tin.mat;
    load TinBT.mat;             %% Battery
    load TinWD.mat;             %% Wind
    load TinPV.mat;             %% Wind
    FG = [Cost_KW_Fridge(2,:)./100; Tin(2,:)];   

    load Power_SV.mat;          %Range
    load Power_LG.mat;          %Lights
    load Power_CW.mat;          %Dish
    load Power_DY.mat;          %Dryer
    load Power_DW.mat;          %Dishwasher
    load Power_PP.mat;          %PoolPump
    load Pow_LG.mat; 

    if AC_HT==1
        Ener(2,:) = 0;
    else 
        Ener(3,:) = 0;
    end

    % Water Heater          -- WH           -- 'Temperature of water (^o C)' 'Water Consumption (Ltrs)' 'Power (kW)'
    % ACHT==2 -- AC         -- AC_HT        -- 'Power (kW)' 'Outsidet Temp. (^oC)' 'Rooms Temp. (^o C)'
    % ACHT==1 -- Furnace    -- AC_HT        -- 'Power (kW)' 'Outsidet Temp. (^oC)' 'Rooms Temp. (^o C)'
    % Range                 -- Power_SV     -- 'Power (kW)'
    % Lights                -- Pow_LG       -- 'Power (kW)'
    % Fridge                -- FG           -- 'Power (kW)','Indoor Temp. (^oC)'
    % Dryer                 -- Power_DY     -- 'Power (kW)'
    % Dishwasher            -- Power_DW     -- 'Power (kW)'
    % Clothwasher           -- Power_CW     -- 'Power (kW)'
    % Poolpump              -- Power_PP     -- 'Power (kW)'
    % Battery               -- TinBT(2,:)   -- 'Power (kW)'
    % Wind                  -- TinWD(2,:)   -- 'Power (kW)'
    % PV                    -- TinPV(2,:)   -- 'Power (kW)'
     
    %AC_HT(1,:)
    powerSum = WH(3,:) + AC_HT(1,:) + Power_SV(1,:) + Pow_LG(1,:) + FG(1,:) + Power_DY(1,:) + Power_DW(1,:) + Power_CW(1,:) + Power_PP(1,:);
    
    defaultYLegend = 'Power (Watts)';
    defaultXLegend = 'Time in (hrs)';
    
    powerValues = {
        'Water Heater' WH defaultXLegend { 'Temperature of water (^o C)' 'Water Consumption (Ltrs)' 'Power (kW)' };
        'Air Conditioner - Furnace' AC_HT defaultXLegend { 'Power (kW)' 'Outsidet Temp. (^oC)' 'Rooms Temp. (^o C)' };
        'Range' Power_SV defaultXLegend defaultYLegend;
        'Lights' Pow_LG defaultXLegend defaultYLegend;
        'Fridge' FG defaultXLegend { 'Power (kW)' 'Indoor Temp. (^oC)' };
        'Dryer' Power_DY defaultXLegend defaultYLegend;
        'Dishwasher' Power_DW defaultXLegend defaultYLegend;
        'Clothwasher' Power_CW defaultXLegend defaultYLegend;
        'PoolPump' Power_PP defaultXLegend defaultYLegend;
        'Battery' TinBT(2,:) defaultXLegend defaultYLegend;
        'Wind' TinWD(2,:) defaultXLegend defaultYLegend;
        'PV' TinPV(2,:) defaultXLegend defaultYLegend;
        'House Power Sum' powerSum defaultXLegend defaultYLegend;
    };
  
    if(index >= 0)
        name = ['powerValues' num2str(index,'%d') '.mat'];
    else
        name = 'powerValues.mat';
    end
    save(name, 'powerValues', 'time');
end
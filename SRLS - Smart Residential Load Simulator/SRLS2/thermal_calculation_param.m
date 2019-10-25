function [Rw, Cw, Rc, Ci] = thermal_calculation_param(house,Area_window)

widHouse = house(:,1);
lenHouse = house(:,2);
htHouse = house(:,3);


%%
%**************            THERMAL CHARACTERISTIC       ***************
%% type of insulation used Glass wool in the walls, 0.2 m thick
kWall = 0.038*3600;   % hour is the time unit                    (J/hr/m/C)
LWall = 0.2;          %wall thickness                            (meters)
kWindow = 0.81*3600;  % hour is the time unit                    (J/hr/m/C)
LWindow = 0.01;       %Windows thickness                         (meters)
     
%% Air & glass characteristics
c = 1005.4;          % c = cp of air (273 K) = 1005.4             (J/kg-K)
densAir = 1.2250;    % Density of air at sea level = 1.2250       (kg/m^3)
c_g = 833;           % c = cp of glass                            (J/kg-K)
den_g = 2700;        % Density of glass                           (kg/m^3)
c_f = 795;           % c = cp of fiberglass                       (J/kg-K)
den_f = 220;         % Density of fiberglass                      (kg/m^3)
c_w   = 1298;        % c = cp of pine wood                        (J/kg-K)
den_w = 650;         % Density of pine wood                       (kg/m^3)



wallArea = lenHouse.*htHouse + widHouse.*htHouse + 2*lenHouse.*widHouse  - Area_window;
%% Thermal resistance calculation
RWall = LWall./(kWall*wallArea)/2;
RWindow = LWindow./(kWindow*Area_window);

%% Thermal capacity
Vol_house = lenHouse.*widHouse.*htHouse;   
Perc_furniture = 0.015;
Cair = c*densAir.*Vol_house*(1-Perc_furniture);
Cwood = c_w*den_w.*Vol_house*Perc_furniture;
Ci = Cair+Cwood;

Vol_wa = wallArea.*LWall;
Cwa = c_f*den_f*Vol_wa;
% Vol_wi = Area_window*LWindow;
% Cwi = c_g*den_g*Vol_wi;

Cw = Cwa;
Rw = RWall;
Rc = RWindow;




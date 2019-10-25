
%% Define the house geometry

%       Width Length Height windArea
house = [...
           6     6     4      2;     %Room one
           6     6     4      2;     %Room two
           4     4     4      1;     %Room three
           15    9     4     11];    %Room four
      
       
widHouse = house(:,1);
lenHouse = house(:,2);
htHouse = house(:,3);
windowArea = house(:,4); %11m2


%% Define the type of insulation used
% Glass wool in the walls, 0.2 m thick
% k is in units of J/sec/m/C - convert to J/hr/m/C multiplying by 3600
kWall = 0.038*3600;   % hour is the time unit
LWall = 0.2;           %wall thickness

% Glass windows, 0.01 m thick
kWindow = 0.81*3600;  % hour is the time unit
LWindow = 0.01;        %Windows thickness


wallArea = 2*lenHouse.*htHouse + 2*widHouse.*htHouse + ...
           2*lenHouse.*widHouse  - windowArea;
%% Thermal resistance calculation
RWall = LWall./(kWall*wallArea);
RWindow = LWindow./(kWindow*windowArea);
      
%% Air & glass characteristics
c = 1005.4;          % c = cp of air (273 K) = 1005.4 J/kg-K
densAir = 1.2250;    % Density of air at sea level = 1.2250 kg/m^3

c_g = 833;           % c = cp of glass J/kg-K
den_g = 2700;        % Density of glass kg/m^3

c_f = 795;           % c = cp of fiberglass J/kg-K
den_f = 220;         % Density of fiberglass kg/m^3

c_w   = 1298;         % c = cp of pine wood J/kg-K
den_w = 650;         % Density of pine wood kg/m^3

%% Thermal capacity calculation
Vol_house = lenHouse.*widHouse.*htHouse;

Porcentaje_Muebles = 0.015;
Cair = c*densAir.*Vol_house*(1-Porcentaje_Muebles);
Cwood = c_w*den_w.*Vol_house*Porcentaje_Muebles;
Ci = Cair+Cwood;

Vol_wa = wallArea.*LWall;
Cwa = c_f*den_f*Vol_wa;
Vol_wi = windowArea*LWindow;
Cwi = c_g*den_g*Vol_wi;
Cw = Cwa;
Rw = RWall;
Rc = RWindow;


%%
Cw1 =  Cw(1,1);
Cw2 =  Cw(2,1);
Cw3 =  Cw(3,1);
Cw4 =  Cw(4,1);

Ci1 =  Ci(1,1);
Ci2 =  Ci(2,1);
Ci3 =  Ci(3,1);
Ci4 =  Ci(4,1);


Rw1 =  Rw(1,1);
Rw2 =  Rw(2,1);
Rw3 =  Rw(3,1);
Rw4 =  Rw(4,1);

Rc1 =  Rc(1,1);
Rc2 =  Rc(2,1);
Rc3 =  Rc(3,1);
Rc4 =  Rc(4,1);


c = 1005.4;


% -------------------------------
% Enter the temperature of the heated air
% -------------------------------
% The air exiting the heater has a constant temperature which is a heater
% property. THeater = 80 deg C
THeater = 75;
% Air flow rate Mdot = 1 kg/sec = 3600 kg/hr
Mdot = 3600;  % hour is the time unit
cost = 0.09/3.6e6;

I_AA = 147000000;
%      146500000
I_HT = 205000000


















% Fridge;
% [1] FRIDGE DIMENTIOS  - - - - - - - - - - - -
Ancho = fridge(1,1);
Largo = fridge(1,2);
Altura = fridge(1,3);

p_pext = 0.25;

Area_Total = (2*(Ancho*Altura)+2*(Largo*Altura)+2*(Ancho*Largo));
Volumen_Total = Ancho*Altura*Largo;

L_acero = 0.00318;
L_poli = 0.06;
h_e = 17;
h_i = 9;

k_acero = 50;
p_acero = 750;
cp_acero = 460;

k_poli = 0.0015;
p_poli = 50;
cp_poli = 10;

k_air = 0.026;
p_air = 1.2;
cp_air = 1000;

k_plastico = 0.24;
cp_plastico = 1000;
p_plastico = 910;

k_fibra = 0.008;
cp_fibra = 795;
p_fibra = 220;

Rext = ((h_e*Area_Total)^(-1))/3600;

K_ext=1/(1/h_e+1/h_i+ L_acero/k_acero + L_poli/k_poli + L_acero/k_plastico);

% K_ext=(k_poli );
Rair = ((h_e*Area_Total)^(-1))/3600
Rw_Re = 1/(3600*K_ext*Area_Total)

% [4] ESTANCIA ACONDICIONADA (Aire + Muebles) - - - - - - - - - - - - - -
Ci_Re1 = 1.2*1000*Volumen_Total;
% Ci_Re2 = 418*1000*Volumen_Total*0.01;
Ci_Re = Ci_Re1

Cw1 = p_acero*cp_acero*(Area_Total*L_acero);
Cw2 = p_poli*cp_poli*(Area_Total*L_poli);
Cw3 = p_plastico*cp_plastico*(Area_Total*L_acero);
% Cw_Re = Cw2+2*Cw3
Cw_Re = Cw2
Rc_Re=inf

% IacSt_Re =  9000;



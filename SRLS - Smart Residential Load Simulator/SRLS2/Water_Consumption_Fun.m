function Water_Consumption_Fun(block)
%  
%% The setup method is used to setup the basic attributes of the
%% S-function such as ports, parameters, etc. Do not add any other
%% calls to the main body of the function.
%%

%   Copyright 2008-2009 The MathWorks, Inc.

setup(block);

%% Function: setup ===================================================
%% Abstract:
%%   Set up the S-function block's basic characteristics such as:
%%   - Input ports
%%   - Output ports
%%   - Dialog parameters
%%   - Options
%% 
%%   Required         : Yes
%%   C-Mex counterpart: mdlInitializeSizes
%%
function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Behave consistently with C S-functions and suppress
% warnings about inconsistent sample times
block.SetAllowConstantSampleTime(false);

% block.InputPort(1).Complexity  = 'complex';
block.InputPort(1).SamplingMode = 'Sample';
% block.InputPort(2).SamplingMode = 'Inherited';  


% block.OutputPort(1).Complexity  = 'complex';
block.OutputPort(1).SamplingMode = 'Sample';

% Register parameters
block.NumDialogPrms     = 0;

%% Set the block simStateCompliance to default (i.e., same as a built-in block)
block.SimStateCompliance = 'DefaultSimState';


%% -----------------------------------------------------------------
%% Options
%% -----------------------------------------------------------------
% Specify if Accelerator should use TLC or call back into
% MATLAB file
block.SetAccelRunOnTLC(false);

%% -----------------------------------------------------------------
%% The MATLAB file S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file.
%% -----------------------------------------------------------------

%% -----------------------------------------------------------------
%% Register methods called during update diagram/compilation
%% -----------------------------------------------------------------

block.RegBlockMethod('CheckParameters', @CheckPrms);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);
block.RegBlockMethod('Terminate', @Terminate);

% Inherit datatype id for non-built-in datatypes
block.RegBlockMethod('SetInputPortDataType', @SetInpPortDataType);
block.RegBlockMethod('SetOutputPortDataType', @SetOutputPortDataType);

function SetOutputPortDataType(block, idx, dt)
  
  block.OutputPort(idx).DataTypeID = dt;
  
function SetInpPortDataType(block, idx, dt)

  block.InputPort(idx).DataTypeID = dt;
  % Obtain data types of input ports
  dt1 = block.InputPort(1).DataTypeID;

  % Calculate output data types when both input port data types are ready
  if dt1 ~= -1 && block.DataTypeIsFixedPoint(dt1)
            
    p1 = block.FixedPointNumericType(dt1);

    
    w1 = p1.WordLength;
    f1 = p1.FractionLength;
    s1 = p1.Signed;
    
    newId = block.RegisterDataTypeFxpSlopeBias(s1,w1+1, 1.0*2^(-f1), 0, false);
    
    block.OutputPort(1).DataTypeID = newId;
    
    
  end


function CheckPrms(block)
  

function Start(block)
  

function InitializeConditions(block)
  

function Outputs(block)
global per age_1 age_2 age_3 therm  tank  atmp  athome spring summer fall winter

WEEKDAY = [...
11 6   0.0000  0.6163  0.0000  0.0000  0.0000  0.0000 -0.0017  0.0000  0.0000  0.0000  0.0000  0.0000  0.0000  0.5523  0.0000  0.0000  0.379  1.3625     
6  8   2.0956  0.0000  0.0000  3.4830  7.9861  0.0000  0.0269 -0.5424  0.6603 -3.6609  0.0000 -13.601  0.0000  0.0000  0.0000  0.0000  0.379  1.3625
8  11  0.0000  0.0000  1.0853  1.5331  2.4972  0.0000  0.0000  0.0000  0.0000  9.0418  0.0000  0.0000 -1.6353  2.1403  0.0000  0.0000  0.379  1.3625
11  1 -0.3876  0.0000  0.9668  1.0849  2.0956 -0.0218  0.0000  0.0000  0.0000  6.1986  0.0000  0.0000 -1.6834  1.5187  0.0000  0.0000  0.379  1.3625
1  5  -0.2907  0.0000  1.9790  1.2000  2.3072 -0.0906  0.0083  0.0000  0.0743  4.0228  0.0000  0.0000  0.0000  2.5854  0.0000  0.0000  0.379  1.3625
5  7   0.7753  0.0000  1.5679  2.0415  3.6018  0.0000  0.0000 -0.3134  0.3570  5.3492  0.0000 -3.6855  0.0000  3.6560  5.1470  0.0000  0.379  1.3625
7  9   4.4577  0.0000  2.7456  4.4092  3.3455 -0.1015  0.0187  0.0000  0.3523  0.0000  0.0000 -8.0527 -3.2509  0.0000  5.1470  26.9184  0.379  1.3625
9  11  4.2881  0.0000  1.4434  3.4394  2.5135 -0.0436  0.0000  0.0000  0.2848 -2.4166  0.0000 -3.3773 -3.5511  0.0000  0.0000  0.0000  0.379  1.3625];

WEEKEND = [...
11  6  0.0000  0.3036  0.0000  0.0000  0.0000  0.0000 -0.0017  0.0000  0.0000  0.0000  0.3433  0.6341  0.0000  0.6420  0.0000  0.0000  0.379  1.3625      
6  8   3.8036  0.0000  0.0000  1.1515  1.3389  0.0000  0.0269  0.0000 -0.2140  0.0000  0.0000 -5.9393 -2.4806  0.0000  0.0000  0.0000  0.379  1.3625
8  11  0.0000  0.0000  1.3045  2.7796  5.6808  0.0000  0.0000  0.0000  0.0000  0.0000  4.7598  0.0000  0.0000  5.1164  0.0000  17.9456 0.379  1.3625
11  1  2.5923  0.0000  0.9009  2.0070  5.4181 -0.1833  0.0000  0.0000 -0.3291  0.0000  0.0000 -4.7840  0.0000  5.6039  0.0000  0.0000  0.379  1.3625
1  5   1.8170  0.0000  1.7303  1.7201  3.8043 -0.1445  0.0083  0.0000 -0.2467  0.0000  0.0000 -3.5602  0.0000  4.4501  0.0000  0.0000  0.379  1.3625
5  7   3.1616  0.0000  2.1596  2.9693  3.8607 -0.1806  0.0000  0.0000 -0.3584  0.0000  0.0000 -5.6168  0.0000  6.2020  5.1470  0.0000  0.379  1.3625
7  9   3.5007  0.0000  1.2038  4.9574  2.3144  0.0000  0.0187  0.0000 -0.1969  0.0000  3.1275 -3.6961  0.0000  0.0000  5.1470  0.0000  0.379  1.3625
9  11  0.0000  0.0000  1.8965  3.0862  2.5695  0.0000  0.0000  0.0000  0.0000  0.0000  0.0000  0.0000 -1.4339  0.0000  0.0000  0.0000  0.379  1.3625];

a0=WEEKDAY(:,3);       
a1=WEEKDAY(:,4);     
a2=WEEKDAY(:,5);
a3=WEEKDAY(:,6);      
a4=WEEKDAY(:,7);     
a5=WEEKDAY(:,8);      
a6=WEEKDAY(:,9);       
a7=WEEKDAY(:,10);      
a8=WEEKDAY(:,11);     
a9=WEEKDAY(:,12);      
a10=WEEKDAY(:,13);     
a11 =WEEKDAY(:,14);    
a12=WEEKDAY(:,15);     
a13=WEEKDAY(:,16);    
no_dw=WEEKDAY(:,17);   
no_cw=WEEKDAY(:,18);
senior=WEEKDAY(:,19);   
no_pay=WEEKDAY(:,20);


% a0=WEEKEND(:,3);       
% a1=WEEKEND(:,4);     
% a2=WEEKEND(:,5);
% a3=WEEKEND(:,6);      
% a4=WEEKEND(:,7);     
% a5=WEEKEND(:,8);      
% a6=WEEKEND(:,9);       
% a7=WEEKEND(:,10);      
% a8=WEEKEND(:,11);     
% a9=WEEKEND(:,12);      
% a10=WEEKEND(:,13);     
% a11 =WEEKEND(:,14);    
% a12=WEEKEND(:,15);     
% a13=WEEKEND(:,16);    
% no_dw=WEEKEND(:,17);   
% no_cw=WEEKEND(:,18);
% senior=WEEKEND(:,19);   
% no_pay=WEEKEND(:,20);



per = 4; 
age_1 =1;
age_2 =1;
age_3 =2;
therm = 60;
tank = 184;
wtmp = 8;
atmp = 10;
athome = 1;
spring = 0;
summer = 0;
fall=0;
winter = 1;

no_cw = zeros(8,1);
no_dw = zeros(8,1);
senior = 0;
no_pay = 0;

if no_dw(1,1)==0
    no_dw(6:7,1) = (0.655*per+1.2635*sqrt(per));
else
    no_dw = 0;
end

% if no_cw(1,1) == 0
%     no_cw = 2.2121*per + 9.0335*sqrt(per);
% else
%     no_cw = 1.4750*per + 6.023*sqrt(per);
% end


HWU = (a0 + a1*per + a2*age_1 + a3*age_2 + a4*age_3 + a5*therm + a6*tank + a7*wtmp ...
      +a8*atmp +a9*athome +a10*spring + a11*summer +a12*fall + a13*winter - no_cw - no_dw )*(1-0.621*senior)*(1+0.3625*no_pay);

inp1 = block.InputPort(1).Data;
 
    if inp1>=23 || inp1<=5
        HWU_hrs = HWU(1,1);
    elseif inp1>=5 && inp1<=7
        HWU_hrs = HWU(2,1);
    elseif inp1>=7 && inp1<=10
        HWU_hrs = HWU(3,1);
    elseif inp1>=7 && inp1<=10
        HWU_hrs = HWU(3,1);
    elseif inp1>=11 && inp1<=12
        HWU_hrs = HWU(4,1);
    elseif inp1>=12 && inp1<=16
        HWU_hrs = HWU(5,1);
    elseif inp1>=16 && inp1<=18
        HWU_hrs = HWU(6,1);
    elseif inp1>=18 && inp1<=20
        HWU_hrs = HWU(7,1);
    elseif inp1>=20 && inp1<=22
        HWU_hrs = HWU(8,1);
    end

    
    block.OutputPort(1).Data = HWU_hrs;
    
function Terminate(block)

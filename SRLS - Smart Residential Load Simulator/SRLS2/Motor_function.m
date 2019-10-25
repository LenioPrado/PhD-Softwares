function Motor_function(block)
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
block.NumInputPorts  = 2;
block.NumOutputPorts = 3;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Behave consistently with C S-functions and suppress
% warnings about inconsistent sample times
block.SetAllowConstantSampleTime(false);

% block.InputPort(1).Complexity  = 'complex';
block.InputPort(1).SamplingMode = 'Sample';
  
% block.InputPort(2).Complexity  = 'complex';
block.InputPort(2).SamplingMode = 'Sample';
% block.InputPort(3).SamplingMode = 'Sample';


% block.OutputPort(1).Complexity  = 'complex';
block.OutputPort(1).SamplingMode = 'Sample';

% block.OutputPort(2).Complexity  = 'complex';
block.OutputPort(2).SamplingMode = 'Sample';

block.OutputPort(3).SamplingMode = 'Sample';


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
  dt2 = block.InputPort(2).DataTypeID;
%   dt3 = block.InputPort(3).DataTypeID;

  % Calculate output data types when both input port data types are ready
  if dt1 ~= -1 && block.DataTypeIsFixedPoint(dt1)
            
    p1 = block.FixedPointNumericType(dt1);
%     p2 = block.FixedPointNumericType(dt2);
    
    w1 = p1.WordLength;
    f1 = p1.FractionLength;
    s1 = p1.Signed;
    
%     w2 = p2.WordLength;
%     f2 = p2.FractionLength;
%     s2 = p2.Signed;
%     
    newId = block.RegisterDataTypeFxpSlopeBias(s1 || s2,w1+w2+1, 1.0*2^(-f1-f2), 0, false);
    
    block.OutputPort(1).DataTypeID = newId;
    block.OutputPort(2).DataTypeID = newId;
    block.OutputPort(3).DataTypeID = newId;
    
    
  end


function CheckPrms(block)
  

function Start(block)
  

function InitializeConditions(block)
  

function Outputs(block)

    inp1 = block.InputPort(1).Data;
    inp2 = block.InputPort(2).Data;
    slip_1= inp2(1,1);
    S_ther = inp1(1,1);
    
    
   
global Prated Vrated P frated Nq2Nd rqs xlqs rds xlds xplr rpr xmq J Domega
% 
Vrat = S_ther*Vrated;
wb = 2*pi*frated;                   % base frequency
we = wb;
wbm = 2*wb/P;                       % mechanic frequency
Sb = Prated;
Tb = Sb/wbm;                        % base torque
Zb = Vrat*Vrat/Sb;              % impedance en ohms
Vm = Vrat*sqrt(2);                % phase voltage
Vb = Vm;                            % voltage rms
Tfactor = P/(2*wb);                 % coefficient torque
rpds=(Nq2Nd^2)*rds;             % aux resistance referred to main winding
xplds=(Nq2Nd^2)*xlds;           % aux leakage reactance referred to main winding
xMq = 1/(1/xmq + 1/xlqs + 1/xplr);
xMd = 1/(1/xmq + 1/xplds + 1/xplr);
H = J*wbm*wbm/(2*Sb);           % rotor inertia constant in secs.


%%                              Capacitor's parameters
Zstart =  3 - j*14.5;
Rc_start = real(Zstart);               % referred resistance of start capacitor 
Xc_start = imag(Zstart);               % referred reactance of run capacitor
C_start = -1/(wb*Xc_start);               % referred capacitance of start capacitor 
Zst_ref = Nq2Nd^2*Zstart;

Zrun =  9 - j*172;
Rc_run = real(Zrun);                   % referred resistance of run capacitor 
Xc_run = imag(Zrun);                   % referred reactance of run capacitor
C_run = -1/(wb*Xc_run);                   % referred capacitance of run capacitor 
Zrun_ref = 1/Nq2Nd^2*Zrun;

%% network parameters of positive and negative sequence circuit
Zqs = rqs + j*xlqs;                     % self impedance of main wdg  

Z1s     =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs); 
Z1s_st  =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs) + 0.5*Zst_ref; 
Z1s_run =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs) + 0.5*Zrun_ref; 

%% 
Vqs = Vrat;                     % rms phasor voltage of main wdg
Vpds = Nq2Nd*Vrat;              % rms aux wdg voltage referred to main wdg
T = (1/sqrt(2))*[ 1 -j; 1 j ];          % transformation matrix
V12 = T*[Vqs; Vpds];                    % transforming  qsds to sequence   
V1 = V12(1);
V2 = V12(2);


%%  Calcualtions
% slip_1 = 0.8756;
% for a=1:length(slip_1)
    s_1 = slip_1;
    s_2 = 2-s_1;
    wr =2*we*(1-s_1)/P;                        % rotor speed in mechanical rad/sec
    Z2s = rpr/s_1 + j*xplr;                      % Impedances
    Z4s = rpr/(2-s_1) + j*xplr;
    Z3s = 1/( (1/Z2s) + (1/(j*xmq)));
    Z5s = 1/( (1/Z4s) + (1/(j*xmq)));
% %% Split phase motor
%     Zeq = [(Zqs+Z3s+Z1s)  -Z1s; -Z1s (Zqs+Z5s+Z1s)]; %equivalent impedance
%     I12 = inv(Zeq)*V12;                              %Current calculation 
%     Iqd = inv(T)*I12;
%     Sin =[Vqs Vpds]*conj(Iqd); 
%     Ip1r = -j*xmq*I12(1)/(Z2s + j*xmq);
%     Ip2r = -j*xmq*I12(2)/(Z4s + j*xmq);
%     Tavg(a)=(P/(2*we))*(abs(Ip1r)^2*rpr/s_1 - abs(Ip2r)^2*rpr/s_2);
%     Pavg(a)=Tavg(a)*wr(a);
%     Pin(a) = real(Sin);
%     eff(a)=100*Pavg(a)/Pin(a);    
    
%% Start capacitor motor    
    Zeq_st = [(Zqs+Z3s+Z1s_st)  -Z1s_st; -Z1s_st (Zqs+Z5s+Z1s_st)];
    I12_st = inv(Zeq_st)*V12;
    Iqd_st = inv(T)*I12_st;
    Sin_st =[Vqs Vpds]*conj(Iqd_st); 
    Ip1r_st = -j*xmq*I12_st(1)/(Z2s + j*xmq);
    Ip2r_st = -j*xmq*I12_st(2)/(Z4s + j*xmq);
    Tavg_st=(P/(2*we))*(abs(Ip1r_st)^2*rpr/s_1 - abs(Ip2r_st)^2*rpr/s_2);
    Pavg_st=Tavg_st*wr;
    Pin_st = real(Sin_st);
    eff_st=100*Pavg_st/Pin_st;
    
% %% Start and Run Capacitor motor    
%     Zeq_run = [(Zqs+Z3s+Z1s_run)  -Z1s_run; -Z1s_run (Zqs+Z5s+Z1s_run)];
%     I12_run = inv(Zeq_run)*V12;
%     Iqd_run = inv(T)*I12_run;
%     Sin_run =[Vqs Vpds]*conj(Iqd_run); 
%     Ip1r_run = -j*xmq*I12_run(1)/(Z2s + j*xmq);
%     Ip2r_run = -j*xmq*I12_run(2)/(Z4s + j*xmq);
%     Tavg_run(a)=(P/(2*we))*(abs(Ip1r_run)^2*rpr/s_1 - abs(Ip2r_run)^2*rpr/s_2);
%     Pavg_run(a)=Tavg_run(a)*wr(a);
%     Pin_run(a) = real(Sin_run);
%     eff_run(a)=100*Pavg_run(a)/Pin_run(a);    
%     s_11(a)=s_1;
    
% end

   
    
    block.OutputPort(1).Data = Pavg_st*3600/3/5.5 -1.555;
    block.OutputPort(2).Data = Pavg_st;
    block.OutputPort(3).Data = eff_st;

    
function Terminate(block)

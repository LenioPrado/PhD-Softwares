function Thermostat_Schedule(block)
setup(block);
function setup(block)

% Register number of ports
block.NumInputPorts  = 9;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Behave consistently with C S-functions and suppress
% warnings about inconsistent sample times
block.SetAllowConstantSampleTime(false);

% block.InputPort(1).Complexity  = 'complex';
block.InputPort(1).SamplingMode = 'Sample';
block.InputPort(2).SamplingMode = 'Inherited';  


% block.OutputPort(1).Complexity  = 'complex';
block.OutputPort(1).SamplingMode = 'Sample';

% Register parameters
block.NumDialogPrms     = 0;

%% Set the block simStateCompliance to default (i.e., same as a built-in block)
block.SimStateCompliance = 'DefaultSimState';
block.SetAccelRunOnTLC(false);
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

P1on  =  block.InputPort(1).Data;
P1set =  block.InputPort(2).Data; 
P2on  =  block.InputPort(3).Data; 
P2set =  block.InputPort(4).Data; 
P3on  =  block.InputPort(5).Data; 
P3set =  block.InputPort(6).Data; 
P4on  =  block.InputPort(7).Data; 
P4set =  block.InputPort(8).Data; 
clock  =  block.InputPort(9).Data; 

if clock>=P1on &&  clock<=P2on  %schedule P1
     Set_point = P1set; 
elseif clock>=P2on &&  clock<=P3on  %schedule P2
     Set_point = P2set; 
elseif clock>=P3on &&  clock<=P4on  %schedule P3
     Set_point = P3set; 
else
    Set_point = P4set;
end
       
    
    block.OutputPort(1).Data = Set_point;
    
function Terminate(block)

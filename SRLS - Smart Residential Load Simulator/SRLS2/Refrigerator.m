function varargout = Refrigerator(varargin)
% REFRIGERATOR MATLAB code for Refrigerator.fig
%      REFRIGERATOR, by itself, creates a new REFRIGERATOR or raises the existing
%      singleton*.
%
%      H = REFRIGERATOR returns the handle to a new REFRIGERATOR or the handle to
%      the existing singleton*.
%
%      REFRIGERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REFRIGERATOR.M with the given input arguments.
%
%      REFRIGERATOR('Property','Value',...) creates a new REFRIGERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Refrigerator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Refrigerator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Refrigerator

% Last Modified by GUIDE v2.5 15-Sep-2013 06:45:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Refrigerator_OpeningFcn, ...
                   'gui_OutputFcn',  @Refrigerator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Refrigerator is made visible.
function Refrigerator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Refrigerator (see VARARGIN)

% Choose default command line output for Refrigerator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1)
[x,map]=imread('Refrigerator1.jpg','jpg');
image(x),colormap(map),axis off,hold on



% --- Outputs from this function are returned to the command line.
function varargout = Refrigerator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Voltage_Callback(hObject, eventdata, handles)
% hObject    handle to Voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Voltage as text
%        str2double(get(hObject,'String')) returns contents of Voltage as a double


% --- Executes during object creation, after setting all properties.
function Voltage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tamb_Callback(hObject, eventdata, handles)
% hObject    handle to Tamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tamb as text
%        str2double(get(hObject,'String')) returns contents of Tamb as a double


% --- Executes during object creation, after setting all properties.
function Tamb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q_WH_Callback(hObject, eventdata, handles)
% hObject    handle to Q_WH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q_WH as text
%        str2double(get(hObject,'String')) returns contents of Q_WH as a double


% --- Executes during object creation, after setting all properties.
function Q_WH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q_WH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Type_WH.
function Type_WH_Callback(hObject, eventdata, handles)
% hObject    handle to Type_WH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Type_WH contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Type_WH

Type_WH = get(handles.Type_WH,'Value');
% pause
if Type_WH==1
    set(handles.Q_WH,'String',4500)
    set(handles.EF,'String',0.92)
    Rate_Ele_WH=1;
    Gas_rate=0;
    set_param('Energy_Cost/Water Heater/Rates/Rate_Ele_WH','Value',num2str(Rate_Ele_WH));
    set_param('Energy_Cost/Water Heater/Rates/Rate_Gas_WH','Value',num2str(Gas_rate));
else
    set(handles.Q_WH,'String',40000)
    set(handles.EF,'String',0.62)
    Rate_Ele_WH=0;
    Rate_Gas_WH=1;
    set_param('Energy_Cost/Water Heater/Rates/Rate_Ele_WH','Value',num2str(Rate_Ele_WH));
    set_param('Energy_Cost/Water Heater/Rates/Rate_Gas_WH','Value',num2str(Rate_Gas_WH));
end



% --- Executes during object creation, after setting all properties.
function Type_WH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Type_WH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function Cap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EF_Callback(hObject, eventdata, handles)
% hObject    handle to EF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EF as text
%        str2double(get(hObject,'String')) returns contents of EF as a double


% --- Executes during object creation, after setting all properties.
function EF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Volu_Callback(hObject, eventdata, handles)
% hObject    handle to Volu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Volu as text
%        str2double(get(hObject,'String')) returns contents of Volu as a double


% --- Executes during object creation, after setting all properties.
function Volu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Volu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Rf_Callback(hObject, eventdata, handles)
% hObject    handle to slider1_Rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider1_Rf=4; %Inicializar el valor del slider.
handles.slider1_Rf=get(hObject,'Value');
handles.slider1_Rf= handles.slider1_Rf*10;
set(handles.SetPoint_Rf,'String',handles.slider1_Rf);
guidata(hObject,handles);
if handles.slider1_Rf==0
handles.slider1_Rf=handles.slider1_Rf+0.01;
set(handles.SetPoint_Rf,'String',handles.slider1_Rf);
end
% SetP_AA = get(handles.SetPoint_Rf,'String');
% set_param('Energy_Cost/Set Point WH','Value',num2str(SetP_AA));




% --- Executes during object creation, after setting all properties.
function slider1_Rf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1_Rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Continue_Rf.
function Continue_Rf_Callback(hObject, eventdata, handles)
% hObject    handle to Continue_Rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Voltage = str2num(get(handles.Voltage,'String'));
% Tamb = str2double(get(handles.Tamb,'String'));
% Q_WH = str2double(get(handles.Q_WH,'String'));
% Volu = str2double(get(handles.Volu,'String'));
% EF = str2double(get(handles.EF,'String'));


Wd = str2num(get(handles.Wd,'String'));
length = str2num(get(handles.Length,'String'));
Ht = str2num(get(handles.HT,'String'));



%%  FRIDGE DIMENTIONS  - - - - - - - - - - - -

%          Width length Height
fridge = [ Wd   length   Ht];

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
cp_plastico = 10;
p_plastico = 9;

k_fibra = 0.008;
cp_fibra = 795;
p_fibra = 220;

Rext = ((h_e*Area_Total)^(-1))/3600;

K_ext=1/(1/h_e+1/h_i+ L_acero/k_acero + L_poli/k_poli + L_acero/k_plastico);

% K_ext=(k_poli );
Rair = ((h_e*Area_Total)^(-1))/3600;
Rw_Re = 1/(3600*K_ext*Area_Total);

% [4] ESTANCIA ACONDICIONADA (Aire + Muebles) - - - - - - - - - - - - - -
Ci_Re1 = 1.2*1000*Volumen_Total;
% Ci_Re2 = 418*1000*Volumen_Total*0.01;
Ci_Re = Ci_Re1;

Cw1 = p_acero*cp_acero*(Area_Total*L_acero);
Cw2 = p_poli*cp_poli*(Area_Total*L_poli);
Cw3 = p_plastico*cp_plastico*(Area_Total*L_acero);
Cw_Re1 = Cw1+Cw2+Cw3;
Cw_Re = Cw2;
Rc_Re=inf;

% IacSt_Re =  9000;

Term1 = 1/(Rw_Re*Cw_Re);
Term3 = 2/(Rw_Re*Cw_Re);
Term4 = 1/Ci_Re;
Term6 = 1/(Rw_Re*Ci_Re);
Term7 = 1/(Rc_Re*Ci_Re);
Term8 = (1/Ci_Re)*( (1/Rw_Re) + (1/Rc_Re));

set_param('Energy_Cost/Refrigerator/Term1','Gain',num2str(Term1));
set_param('Energy_Cost/Refrigerator/Term2','Gain',num2str(Term1));
set_param('Energy_Cost/Refrigerator/Term3','Gain',num2str(Term3));
set_param('Energy_Cost/Refrigerator/Term4','Gain',num2str(Term4));
set_param('Energy_Cost/Refrigerator/Term5','Gain',num2str(Term4));
set_param('Energy_Cost/Refrigerator/Term6','Gain',num2str(Term6));
set_param('Energy_Cost/Refrigerator/Term7','Gain',num2str(Term7));
set_param('Energy_Cost/Refrigerator/Term8','Gain',num2str(Term8));










save('Refrigerator')
close('Refrigerator')


% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ON_OFF.
function ON_OFF_Callback(hObject, eventdata, handles)
% hObject    handle to ON_OFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in help_Rf.
function help_Rf_Callback(hObject, eventdata, handles)
% hObject    handle to help_Rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_Refrigerator.fig');
run('Help_Refrigerator');









%% Single phase Induction Motor
% Krause, P. C. , "Simulation of Unsymmetrical Induction
% Analysis of electric Machinery," 

%           1     2    3   4      5      6     7      8       9     10     11     12     13     14
%        Prated   V    P   f    Nq2Nd   rqs   xlqs   rds     xlds  xplr   rpr    xmq     J      Dw
Motor = [ 186.5  110   4   60  1/1.18  2.02   2.79   7.14   3.220  2.120  4.120  66.80  1.46e-2  0;
          373.0  110   4   60  1/1.18  2.02   2.79   7.14   3.220  2.120  4.120  66.80  1.46e-2  0;
         746*3   220   4   60  1/1.12  0.435  0.745  0.816  0.754  0.745  0.816  26.13  0.089    0];


global Prated Vrated P frated Nq2Nd rqs xlqs rds xlds xplr rpr xmq J Domega


%% Single phase Induction Motor
% Krause, P. C. , "Simulation of Unsymmetrical Induction
% Analysis of electric Machinery," 
Prated = Motor(1,1);                     % 1/4 hp to Watts
Vrated = Motor(1,2);                       % voltage rms Volt
P = Motor(1,3);                              % number of poles
frated = Motor(1,4);                        % frequency Hz
Nq2Nd = Motor(1,5);                 % Nqs/Nds turns ratio
rqs = Motor(1,6);                     % main resistance
xlqs = Motor(1,7);                    % main leakage reactance
rds = Motor(1,8);                     % Aux resistence
xlds = Motor(1,9);                    % Aux leakage reactance
xplr = Motor(1,10);                    % rotor leakage reactance referred to main wdg
rpr = Motor(1,11);                     % rotor wdg resistance referred to main wdg 
xmq = Motor(1,12);                     % magnetizing reactance referred to main wdg
J = Motor(1,13);                    % rotor inertia in kg m2
Domega = Motor(1,14);                     % rotor damping coefficent

wb=60;


















% 
% 
% 
% %%                              Capacitor's parameters
% Zstart =  3 - j*14.5;
% Rc_start = real(Zstart);               % referred resistance of start capacitor 
% Xc_start = imag(Zstart);               % referred reactance of run capacitor
% C_start = -1/(wb*Xc_start);               % referred capacitance of start capacitor 
% Zst_ref = Nq2Nd^2*Zstart;
% 
% Zrun =  9 - j*172;
% Rc_run = real(Zrun);                   % referred resistance of run capacitor 
% Xc_run = imag(Zrun);                   % referred reactance of run capacitor
% C_run = -1/(wb*Xc_run);                   % referred capacitance of run capacitor 
% Zrun_ref = 1/Nq2Nd^2*Zrun;
% 
% %% network parameters of positive and negative sequence circuit
% Zqs = rqs + j*xlqs;                     % self impedance of main wdg  
% 
% Z1s     =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs); 
% Z1s_st  =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs) + 0.5*Zst_ref; 
% Z1s_run =  0.5*(rpds - rqs) + j*0.5*(xplds - xlqs) + 0.5*Zrun_ref; 
% 
% %% Calculation of torque speed curve
% Vqs = Vrated;                     % rms phasor voltage of main wdg
% Vpds = Nq2Nd*Vrated;              % rms aux wdg voltage referred to main wdg
% T = (1/sqrt(2))*[ 1 -j; 1 j ];          % transformation matrix
% Tinv = inv(T);
% V12 = T*[Vqs; Vpds];                    % transforming  qsds to sequence   
% V1 = V12(1);
% V2 = V12(2);
% 
% 
% %%  Calcualtions
% slip_1 = 0.8756;
%     s_1 = slip_1;
%     s_2 = 2-s_1;
%     wr  = 2*we*(1-s_1)/P;                            % rotor speed in mechanical rad/sec
%     Z2s = rpr/s_1 + j*xplr;
%     Z4s = rpr/(2-s_1) + j*xplr;
%     Z3s = 1/( (1/Z2s) + (1/(j*xmq)));
%     Z5s = 1/( (1/Z4s) + (1/(j*xmq)));
%      
% %% Start capacitor motor    
%     Zeq_st = [(Zqs+Z3s+Z1s_st)  -Z1s_st; -Z1s_st (Zqs+Z5s+Z1s_st)];
%     Zeq_runInv = inv(Zeq_st);

    
    
    %% ACTIVITY LEVEL
%Energy week consumption (a specific day)    
    EECt = [...
         550
         450
         400
         500
         400
         400
         450
        1050
         600
         750
        1400
        3200
        4400
         550
         450
         500
         900
         750
        2300
         750
         800
        1000
         250
         250];
    tie = [...
         2
         3
         4
         5
         6
         7
         8
        9
         10
         11
        12
        13
        14
         15
         16
         17
         18
         19
        20
         21
         22
        23
         24
         25];     
save('EEC.mat','EECt','tie')
% set_param('Energy_Cost/Refrigerator/Activity Level','Mask',2);

%      bar(EECt)
%      xlabel('Time (hrs)');
%      ylabel('Power (Watts)');
     
     %Activity level, EECt normalized to the total consumption according to
     %(2.2)
     ALt = EECt/sum(EECt);
%      bar(ALt);
%      xlabel('Time (hrs)')
%      ylabel('Activity Level ( AL(t) )')

     
%   Refrigerator activity level equations 2.39 
    EECt1 = EECt - 0.5*sum(EECt)/24;
    EECt1(find(EECt1<0)) = 0;   
    
    ALfr = 0.5*(EECt1/sum(EECt1));
%      bar(ALfr);
%      xlabel('Time (hrs)')
%      ylabel('Fridge Activity Level ( AL  _F_R  (t) )')
%     
TEnerCons = sum(EECt);    
     





ALfr = [...
%Time open ALfr
0.00000  0   0.00
09.2999  0   0.00
09.3000  2   0.07
9.30399  2   0.07
9.30400  0   0.00
9.74900  0   0.00
09.7500  2   0.10
09.7550  2   0.10
09.7560  0   0.00
9.99900  0   0.00 
10.0000  3   0.13
10.0067  3   0.13
10.0068  0   0.00
10.1499  0   0.00
10.1500  0   0.03
10.1516  1   0.03
10.1517  1   0.00
10.3001  0   0.00
13.2999  0   0.00
13.3000  2   0.07
13.3033  2   0.07
13.3034  0   0.00
13.4499  0   0.00
13.4500  5   0.17
13.4584  5   0.17
13.4585  0   0.00
13.9999  0   0.00
14.0000   7  0.23
14.01169  7  0.23
14.0117   0  0.00
14.1499   0  0.00
14.1500   4   0.13
14.1567  4   0.13
14.1568  0   0.00
14.2999  0   0.00
14.3000  2   0.07
14.3033  2   0.07
14.3034  0   0
24.00   0  0];

%Exporting to Simulink
ALfr = [ALfr(:,1) ALfr(:,3)];



function length_Callback(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Length as text
%        str2double(get(hObject,'String')) returns contents of Length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Length_Callback(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Length as text
%        str2double(get(hObject,'String')) returns contents of Length as a double


% --- Executes during object creation, after setting all properties.
function Length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wd_Callback(hObject, eventdata, handles)
% hObject    handle to Wd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wd as text
%        str2double(get(hObject,'String')) returns contents of Wd as a double


% --- Executes during object creation, after setting all properties.
function Wd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HT_Callback(hObject, eventdata, handles)
% hObject    handle to HT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HT as text
%        str2double(get(hObject,'String')) returns contents of HT as a double


% --- Executes during object creation, after setting all properties.
function HT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

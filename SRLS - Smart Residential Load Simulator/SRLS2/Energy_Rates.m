function varargout = Energy_Rates(varargin)

clc;
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Energy_Rates_OpeningFcn, ...
                   'gui_OutputFcn',  @Energy_Rates_OutputFcn, ...
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

% --- Executes just before Energy_Rates is made visible.
function Energy_Rates_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
find_system('Name','Energy_Cost');
open_system('Energy_Cost');
axes(handles.axes3)
[x,map]=imread('UWaterloo.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes4)
[x,map]=imread('Thermostat.jpg','jpg');
image(x),colormap(map),axis off,hold on


axes(handles.axes15)
[x,map]=imread('fire.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes14)
[x,map]=imread('Typical-Canadian-House.jpg','jpg');
image(x),colormap(map),axis off,hold on


axes(handles.axes5)
[x,map]=imread('CFL_lighting.jpg','jpg');
image(x),colormap(map),axis off,hold on


axes(handles.axes6)
[x,map]=imread('AA.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes7)
[x,map]=imread('Refrigerator.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes8)
[x,map]=imread('Stove.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes9)
[x,map]=imread('Water_Heater.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes10)
[x,map]=imread('Washers_Dryers1.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes11)
[x,map]=imread('Dryer.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes12)
[x,map]=imread('Dishwasher.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes13)
[x,map]=imread('Gas_Furnace.jpg','jpg');
image(x),colormap(map),axis off,hold on


[a,map]=imread('Family.jpg');
[r,c,d]=size(a);
x=ceil(r/140);
y=ceil(c/115);
g=a(1:x:end,1:y:end,:);
g(g==255)=555*255;
set(handles.Family,'CData',g);
handles.output = hObject;

set(handles.back_sche,'Visible','Off');    
% set(handles.On_off_Furnance,'Value',1);



%% At the begining all apliances are off
set_param('Energy_Cost/Water Heater/OnOff WH','Value',num2str(0));%Water Heater off
set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(0));%AC and Heater off
set_param('Energy_Cost/Range/B1','Value',num2str(0));%Range (Burners) off
set_param('Energy_Cost/Range/B2','Value',num2str(0));
set_param('Energy_Cost/Range/B3','Value',num2str(0));
set_param('Energy_Cost/Range/B4','Value',num2str(0));
set_param('Energy_Cost/Range/B5','Value',num2str(0));
set_param('Energy_Cost/Lighting/H_Many','Value',num2str(0));%Lights
set_param('Energy_Cost/Lighting/H_Many_CFL','Value',num2str(0));
set_param('Energy_Cost/Lighting/H_Many_FLU','Value',num2str(0));
set_param('Energy_Cost/Refrigerator/AA_OnOff','Value',num2str(0));%Refrigerator off
set_param('Energy_Cost/Dishwasher/DW_OnOff','Value',num2str(0));%Dishwasher off


guidata(hObject, handles);



% 
% % -------------------------------------------------
% % Display welcome message
% uicontrol(gcf,...
%    'Style','frame',...
%     'Position',[15,83,306,71],...
%     'BackgroundColor','r');
% 
% uicontrol(gcf,...
%     'Style','text',...
%     'Position',[18,122,300,30],...
%     'BackgroundColor',[1.0 1.0 1.0],...
%     'String','RESIDENTIAL LOAD SIMULATOR',...
%     'FontSize',12);
%       
% uicontrol(gcf,...
%     'Style','text',...
%     'Position',[18,105,300,20],...
%     'BackgroundColor',[1.0 1.0 1.0],...
%     'String','Electric Power Engineering',...
%     'Fontsize',12);
% 
% uicontrol(gcf,... 
%     'Style','text',...
%     'Position',[18,85,300,22],...
%     'BackgroundColor',[1.0 1.0 1.0],...
%     'String','University of Waterloo',...
%     'FontSize',12);


% [X1,map1]=imread('fire.gif');
% % Convert indexed image and colormap to truecolor
% icon = ind2rgb(X1,map1);
% uicontrol(gcf,...
%    'Style','pushbutton',...
%    'Position',[555,73,100,100],...
%    'CData',icon,...
%    'BackgroundColor','g');
% 
% uicontrol(gcf,...
%    'Style','togglebutton',...
%    'Tag','fire',...
%    'Position',[655,73,100,100],...
%    'CData',icon,...
%    'BackgroundColor',[0.992 0.918 0.796]);


% --- Outputs from this function are returned to the command line.
function varargout = Energy_Rates_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Off_Peak_Callback(hObject, eventdata, handles)
%%
Ele_off = str2double(get(handles.Off_Peak,'String'));
%Check the input values.
if isempty(Ele_off) ||isnan(Ele_off)
    errordlg('Please enter an integer value');
    set(handles.Ele_off,'String',1);
    return
end
set(handles.Off_Peak,'String',num2str(Ele_off))
% set_param('Energy_Cost/Constant','Value',num2str(Ele_off));

set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant','Value',num2str(Ele_off));
%To Water Heater subsystem
set_param('Energy_Cost/Water Heater/Rates/Ele_off','Value',num2str(Ele_off));


% --- Executes during object creation, after setting all properties.
function Off_Peak_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mid_Peak_Callback(hObject, eventdata, handles)
%%
Ele_mid = str2double(get(handles.Mid_Peak,'String'));
if isempty(Ele_mid) ||isnan(Ele_mid)
    errordlg('Please enter an integer value');
    set(handles.Ele_mid,'String',1);
    return
end
set(handles.Mid_Peak,'String',num2str(Ele_mid))
set_param('Energy_Cost/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant1','Value',num2str(Ele_mid));

%To Water Heater subsystem
set_param('Energy_Cost/Water Heater/Rates/Ele_mid','Value',num2str(Ele_mid));



% --- Executes during object creation, after setting all properties.
function Mid_Peak_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function On_Peak_Callback(hObject, eventdata, handles)
%%
Ele_peak=str2double(get(handles.On_Peak,'String'));
if isempty(Ele_peak) ||isnan(Ele_peak)
    errordlg('Please enter an integer value');
    set(handles.Ele_peak,'String',1);
    return
end
set(handles.On_Peak,'String',num2str(Ele_peak))
set_param('Energy_Cost/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant2','Value',num2str(Ele_peak));
%To Water Heater subsystem
set_param('Energy_Cost/Water Heater/Rates/Ele_peak','Value',num2str(Ele_peak));



% --- Executes during object creation, after setting all properties.
function On_Peak_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in YearSeason.
function YearSeason_Callback(hObject, eventdata, handles)

Rate_season = get(handles.YearSeason,'Value');
load Typical_Temp.mat
if Rate_season==1  %Summer Rate  Outdoor Temp
    set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(1));
    set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(0));
    axes(handles.axes2)
    plot(Typical_Temp(:,1),Typical_Temp(:,3));grid on;
    axis([0 24 0 45]);
    xlabel('Time (hrs)');
    ylabel('Temperature ^o C');
    title('Outside temperature')
    
    
else  %Winter Rate
    set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(0));
    set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(1));
    axes(handles.axes2)
    plot(Typical_Temp(:,1),Typical_Temp(:,2));grid on;
    axis([0 24 -30 20]);
    xlabel('Time (hrs)');
    ylabel('Temperature ^o C');
    title('Outside temperature');
end

Ele_off = str2double(get(handles.Off_Peak,'String'));
Ele_mid = str2double(get(handles.Mid_Peak,'String'));
Ele_peak=str2double(get(handles.On_Peak,'String'));
Gas_Rate=str2double(get(handles.Gas_Rate,'String'));

%Check the input values.
if isempty(Ele_off) ||isnan(Ele_off)
    errordlg('Please enter an integer value');
    set(handles.Ele_off,'String',1);
    return
end

if isempty(Ele_mid) ||isnan(Ele_mid)
    errordlg('Please enter an integer value');
    set(handles.Ele_mid,'String',1);
    return
end

if isempty(Ele_peak) ||isnan(Ele_peak)
    errordlg('Please enter an integer value');
    set(handles.Ele_peak,'String',1);
    return
end

if isempty(Gas_Rate) ||isnan(Gas_Rate)
    errordlg('Please enter an integer value Gas_Rate');
    set(handles.Gas_Rate,'String',1);
    return
end


set(handles.Off_Peak,'String',num2str(Ele_off))
% set_param('Energy_Cost/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant','Value',num2str(Ele_off));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant','Value',num2str(Ele_off));



set(handles.Mid_Peak,'String',num2str(Ele_mid))
% set_param('Energy_Cost/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant1','Value',num2str(Ele_mid));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant1','Value',num2str(Ele_mid));


set(handles.On_Peak,'String',num2str(Ele_peak))
% set_param('Energy_Cost/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant2','Value',num2str(Ele_peak));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant2','Value',num2str(Ele_peak));

Rate_season = get(handles.YearSeason,'Value');
% set_param('Energy_Cost/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant3','Value',num2str(Rate_season));

for clock=1:1:24;
    if Rate_season==1  %Summer Rate
        if clock <= 7  || clock >= 19
            Rate_Elec(clock) = Ele_off ;
            time(clock)=clock;
        elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
            Rate_Elec(clock) = Ele_mid ;
            time(clock)=clock;
        else
            Rate_Elec(clock) = Ele_peak;
            time(clock)=clock;
        end
    else  %Winter Rate
        if clock <= 7  || clock >= 19
            Rate_Elec(clock) = Ele_off ;
            time(clock)=clock;
        elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
            Rate_Elec(clock) = Ele_peak;
            time(clock)=clock;
        else
            Rate_Elec(clock) = Ele_mid ;
            time(clock)=clock;
        end
    end
end


axes(handles.axes1)
plot(time,Rate_Elec);grid on;
% xlabel('Time (hrs)');
ylabel('Price  (c/kW-h)')
axis([0 24 3 12]);
title('Cost of electricity')


% --- Executes during object creation, after setting all properties.
function YearSeason_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Gas_Rate_Callback(hObject, eventdata, handles)
Gas_Rate=str2double(get(handles.Gas_Rate,'String'));
if isempty(Gas_Rate) ||isnan(Gas_Rate)
    errordlg('Please enter an integer value Gas_Rate');
    set(handles.Gas_Rate,'String',1);
    return
end

% --- Executes during object creation, after setting all properties.
function Gas_Rate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Lights_parameters.
function Lights_parameters_Callback(hObject, eventdata, handles)

% Imagenes en axes
find_system('Name','Lights_Parameters.fig');
run('Lights_Parameters');
% set_param(gcs,'SimulationCommand','Start');


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in plots.
function plots_Callback(hObject, eventdata, handles)
% hObject    handle to plots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Imagenes en axes
find_system('Name','Plots2.fig');
run('Plots2');


% --- Executes on button press in Air_A.
function Air_A_Callback(hObject, eventdata, handles)
% hObject    handle to Air_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Refrigerator.
function Refrigerator_Callback(hObject, eventdata, handles)
% hObject    handle to Refrigerator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
find_system('Name','Refrigerator.fig');
run('Refrigerator');

% --- Executes on button press in Stove.
function Stove_Callback(hObject, eventdata, handles)
% hObject    handle to Stove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Washers.
function Washers_Callback(hObject, eventdata, handles)
% hObject    handle to Washers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Dryer.
function Dryer_Callback(hObject, eventdata, handles)
% hObject    handle to Dryer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Dishwasher.
function Dishwasher_Callback(hObject, eventdata, handles)
% hObject    handle to Dishwasher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Furnace.
function Furnace_Callback(hObject, eventdata, handles)
% hObject    handle to Furnace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Family.
function Family_Callback(hObject, eventdata, handles)
% hObject    handle to Family (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Family.fig');
run('Family');


function SetPoint_House_Callback(hObject, eventdata, handles)
% hObject    handle to SetPoint_House (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SetPoint_House as text
%        str2double(get(hObject,'String')) returns contents of SetPoint_House as a double


% --- Executes during object creation, after setting all properties.
function SetPoint_House_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SetPoint_House (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.slider1=20; %Inicializar el valor del slider.
handles.slider1=get(hObject,'Value');
handles.slider1= handles.slider1*50;
if handles.slider1==0
handles.slider1=handles.slider1+0.01;
end
set(handles.SetPoint_House1,'String',handles.slider1);
guidata(hObject,handles);

SetP_AA = get(handles.SetPoint_House1,'String');
set_param('Energy_Cost/Thermostat/Set_Point_AA','Value',num2str(SetP_AA));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


      
        
Rate_season = get(handles.YearSeason,'Value');
% set_param('Energy_Cost/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_Inc/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_CFL/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost_FLU/Rates/Constant3','Value',num2str(Rate_season));
set_param('Energy_Cost/Lighting/Cost/Rates/Constant3','Value',num2str(Rate_season));
%To Water Heater subsystem
set_param('Energy_Cost/Water Heater/Rates/Rate_season','Value',num2str(Rate_season));


%%%%%%%%%%%%%%%  plot Outside Temperature  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rate_season = get(handles.YearSeason,'Value');
load Typical_Temp.mat
if Rate_season==1  %Summer Rate  Outdoor Temp
    set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(1));
    set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(0));
    axes(handles.axes2)
    plot(Typical_Temp(:,1),Typical_Temp(:,3));grid on;
    axis([0 24 0 45]);
    xlabel('Time (hrs)');
    ylabel('Temperature ^o C')
    
else  %Winter Rate
    set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(0));
    set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(1));
    axes(handles.axes2)
    plot(Typical_Temp(:,1),Typical_Temp(:,2));grid on;
    axis([0 24 -30 20]);
    xlabel('Time (hrs)');
    ylabel('Temperature ^o C')
end

Rate_season = get(handles.YearSeason,'Value');
Ele_off = str2double(get(handles.Off_Peak,'String'));
Ele_mid = str2double(get(handles.Mid_Peak,'String'));
Ele_peak = str2double(get(handles.On_Peak,'String'));
for clock=1:1:24;
    if Rate_season==1  %Summer Rate
        if clock <= 7  || clock >= 19
            Rate_Elec(clock) = Ele_off ;
            time(clock)=clock;
        elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
            Rate_Elec(clock) = Ele_mid ;
            time(clock)=clock;
        else
            Rate_Elec(clock) = Ele_peak;
            time(clock)=clock;
        end
    else  %Winter Rate
        if clock <= 7  || clock >= 19
            Rate_Elec(clock) = Ele_off ;
            time(clock)=clock;
        elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
            Rate_Elec(clock) = Ele_peak;
            time(clock)=clock;
        else
            Rate_Elec(clock) = Ele_mid ;
            time(clock)=clock;
        end
    end
end


axes(handles.axes1)
plot(time,Rate_Elec);grid on;
xlabel('Time (hrs)');
ylabel('Price  (c/kW-h)')
axis([0 24 3 12]);

set_param(gcs,'SimulationCommand','Start');

% waitforbar


% --- Executes on button press in Outside_Temperature.
function Outside_Temperature_Callback(hObject, eventdata, handles)
% hObject    handle to Outside_Temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in Household.
function Household_Callback(hObject, eventdata, handles)
% hObject    handle to Household (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Household


%%   Thermost 
% --- Executes on button press in OnOff_AAHEAT.
function OnOff_AAHEAT_Callback(hObject, eventdata, handles)
% hObject    handle to OnOff_AAHEAT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of OnOff_AAHEAT
a=get(hObject,'Value');
a_AC = get(handles.Onoff_AC,'Value');
a_HT = get(handles.On_off_Furnance,'Value');
a_HT1 = get(handles.AA_Heat,'Value');


if a==1 && a_HT1==0
    set(handles.AA_Heat,'String','HT');
    axes(handles.axes15)
    [x,map]=imread('fire.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    
    set(handles.OnOff_AAHEAT,'String','On');
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(a));
    
    
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    set(handles.On_off_Furnance,'String','On');
    set(handles.On_off_Furnance,'Value',1);
    
    find_system('Name','Furnace.fig');
    run('Furnace');    
elseif  a==0 && a_HT1==0  
    set(handles.AA_Heat,'String','HT');
    axes(handles.axes15)
    [x,map]=imread('fire.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    
    set(handles.OnOff_AAHEAT,'String','Off');
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(a));
    
    
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    set(handles.On_off_Furnance,'String','Off');
    set(handles.On_off_Furnance,'Value',0);
    
elseif  a==1 && a_HT1==1    
    set(handles.AA_Heat,'String','AC');
    axes(handles.axes15)
    [x,map]=imread('AA_ON.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    
    set(handles.OnOff_AAHEAT,'String','On');
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(a));
    
    
    set(handles.Onoff_AC,'String','On');
    set(handles.Onoff_AC,'Value',1);
    set(handles.On_off_Furnance,'String','Off');
    set(handles.On_off_Furnance,'Value',0);

    find_system('Name','Air_conditioner.fig');
    run('Air_conditioner');    
    
elseif  a==0 && a_HT1==1 
    set(handles.AA_Heat,'String','AC');
    axes(handles.axes15)
    [x,map]=imread('AA_ON.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    
    set(handles.OnOff_AAHEAT,'String','Off');
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(a));
    
    
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    set(handles.On_off_Furnance,'String','Off');
    set(handles.On_off_Furnance,'Value',0);    
end
    

% --- Executes on button press in AA_Heat.
function AA_Heat_Callback(hObject, eventdata, handles)
% hObject    handle to AA_Heat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AA_Heat

a=get(hObject,'Value')
if a==1
    set(handles.AA_Heat,'String','AC');
    axes(handles.axes15)
    [x,map]=imread('AA_ON.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    
    
    set(handles.Onoff_AC,'String','On');
    set(handles.Onoff_AC,'Value',1);
    set(handles.On_off_Furnance,'String','Off');
    set(handles.On_off_Furnance,'Value',0);

    find_system('Name','Air_conditioner.fig');
    run('Air_conditioner');    

    
else
    set(handles.AA_Heat,'String','HT');
    set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(a));
    axes(handles.axes15)
    [x,map]=imread('fire.jpg','jpg');
    image(x),colormap(map),axis off,hold on
    
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    set(handles.On_off_Furnance,'String','On');
    set(handles.On_off_Furnance,'Value',1);
    find_system('Name','Furnace.fig');
    run('Furnace');
    
end


function AA_HT_Schedule_Callback(hObject, eventdata, handles)
% hObject    handle to AA_HT_Schedule (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AA_HT_Schedule

Sche=get(hObject,'Value');
if Sche==1
    set(handles.AA_HT_Schedule,'String','Sch On');

    set(handles.P1_text,'Visible','On');set(handles.P1_on,'Visible','On');set(handles.P1_set,'Visible','On');
    set(handles.P2_text,'Visible','On');set(handles.P2_on,'Visible','On');set(handles.P2_set,'Visible','On');
    set(handles.P3_text,'Visible','On');set(handles.P3_on,'Visible','On');set(handles.P3_set,'Visible','On');
    set(handles.P4_text,'Visible','On');set(handles.P4_on,'Visible','On');set(handles.P4_set,'Visible','On');
    set(handles.On_sche,'Visible','On');set(handles.Set_sche,'Visible','On');set(handles.back_sche,'Visible','On');
    
    set(handles.PlusMenosP1,'Visible','On');set(handles.PlusMenosP2,'Visible','On');set(handles.PlusMenosP3,'Visible','On');set(handles.PlusMenosP4,'Visible','On');
    set(handles.PlusMenosP1_text,'Visible','On');set(handles.Coversliders,'Visible','Off');
    
    set(handles.text30,'Visible','Off')
    return
else
    set(handles.AA_HT_Schedule,'String','Sch Off');
   
    set(handles.P1_text,'Visible','Off');set(handles.P1_on,'Visible','Off');set(handles.P1_set,'Visible','Off');
    set(handles.P2_text,'Visible','Off');set(handles.P2_on,'Visible','Off');set(handles.P2_set,'Visible','Off');
    set(handles.P3_text,'Visible','Off');set(handles.P3_on,'Visible','Off');set(handles.P3_set,'Visible','Off');
    set(handles.P4_text,'Visible','Off');set(handles.P4_on,'Visible','Off');set(handles.P4_set,'Visible','Off');
    set(handles.On_sche,'Visible','Off');set(handles.Set_sche,'Visible','Off');set(handles.back_sche,'Visible','Off');

    set(handles.PlusMenosP1,'Visible','Off');set(handles.PlusMenosP2,'Visible','Off');set(handles.PlusMenosP3,'Visible','Off');set(handles.PlusMenosP4,'Visible','Off');
    set(handles.PlusMenosP1_text,'Visible','Off'); set(handles.Coversliders,'Visible','On');
    return
    set_param('Energy_Cost/Thermostat/Sche','Value',num2str(Sche));
end

%%
function P1_on_Callback(hObject, eventdata, handles)
P1_on=str2double(get(handles.P1_on,'String'));
if isempty(P1_on) ||isnan(P1_on)
    errordlg('Please enter an integer value for P1,On');
    set(handles.P1_on,'String',6);
    return
end
set(handles.P1_on,'String',num2str(P1_on))
set_param('Energy_Cost/Thermostat/P1_on','Value',num2str(P1_on));

  
% --- Executes during object creation, after setting all properties.
function P1_on_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%
function P2_on_Callback(hObject, eventdata, handles)
P2_on=str2double(get(handles.P2_on,'String'));
if isempty(P2_on) ||isnan(P2_on)
    errordlg('Please enter an integer value for P2,On');
    set(handles.P2_on,'String',8);
    return
end
set(handles.P2_on,'String',num2str(P2_on))
set_param('Energy_Cost/Thermostat/P2_on','Value',num2str(P2_on));

% --- Executes during object creation, after setting all properties.
function P2_on_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%
function P3_on_Callback(hObject, eventdata, handles)
P3_on=str2double(get(handles.P3_on,'String'));
if isempty(P3_on) ||isnan(P3_on)
    errordlg('Please enter an integer value for P3,On');
    set(handles.P3_on,'String',17);
    return
end
set(handles.P3_on,'String',num2str(P3_on))
set_param('Energy_Cost/Thermostat/P3_on','Value',num2str(P3_on));


% --- Executes during object creation, after setting all properties.
function P3_on_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function P4_on_Callback(hObject, eventdata, handles)
P4_on=str2double(get(handles.P4_on,'String'));
if isempty(P4_on) ||isnan(P4_on)
    errordlg('Please enter an integer value for P4,On');
    set(handles.P4_on,'String',22);
    return
end
set(handles.P4_on,'String',num2str(P4_on))
set_param('Energy_Cost/Thermostat/P4_on','Value',num2str(P4_on));

% --- Executes during object creation, after setting all properties.
function P4_on_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%
function P1_set_Callback(hObject, eventdata, handles)
P1_set=str2double(get(handles.P1_set,'String'));
if isempty(P1_set) ||isnan(P1_set)
    errordlg('Please enter an integer value for P1,set');
    set(handles.P1_set,'String',21);
    return
end
set(handles.P1_set,'String',num2str(P1_set))
set_param('Energy_Cost/Thermostat/P1_set','Value',num2str(P1_set));


% --- Executes during object creation, after setting all properties.
function P1_set_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function P2_set_Callback(hObject, eventdata, handles)
P2_set=str2double(get(handles.P2_set,'String'));
if isempty(P2_set) ||isnan(P2_set)
    errordlg('Please enter an integer value for P2,set');
    set(handles.P2_set,'String',21);
    return
end
set(handles.P2_set,'String',num2str(P2_set))
set_param('Energy_Cost/Thermostat/P2_set','Value',num2str(P2_set));

% --- Executes during object creation, after setting all properties.
function P2_set_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function P3_set_Callback(hObject, eventdata, handles)
P3_set=str2double(get(handles.P3_set,'String'));
if isempty(P3_set) ||isnan(P3_set)
    errordlg('Please enter an integer value for P3,set');
    set(handles.P3_set,'String',21);
    return
end
set(handles.P3_set,'String',num2str(P3_set))
set_param('Energy_Cost/Thermostat/P3_set','Value',num2str(P3_set));


% --- Executes during object creation, after setting all properties.
function P3_set_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function P4_set_Callback(hObject, eventdata, handles)
P4_set=str2double(get(handles.P4_set,'String'));
if isempty(P4_set) ||isnan(P4_set)
    errordlg('Please enter an integer value for P4,set');
    set(handles.P4_set,'String',21);
    return
end
set(handles.P4_set,'String',num2str(P4_set))
set_param('Energy_Cost/Thermostat/P4_set','Value',num2str(P4_set));


% --- Executes during object creation, after setting all properties.
function P4_set_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P4_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in On_off_Furnance.
function On_off_Furnance_Callback(hObject, eventdata, handles)
% hObject    handle to On_off_Furnance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of On_off_Furnance

HT=get(hObject,'Value');
set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(HT));

if HT==1
   
    set(handles.On_off_Furnance,'String','On');
    
    set(handles.OnOff_AAHEAT,'String','On');
    set(handles.OnOff_AAHEAT,'Value',1);
    set(handles.AA_Heat,'String','HT');
    set(handles.AA_Heat,'Value',0);
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    

    find_system('Name','Furnace.fig');
    run('Furnace');    
    
else
    set(handles.On_off_Furnance,'String','Off');
    
    set(handles.OnOff_AAHEAT,'String','Off');
    set(handles.OnOff_AAHEAT,'Value',0);
    set(handles.AA_Heat,'String','HT');
    set(handles.AA_Heat,'Value',0);
    set(handles.Onoff_AC,'String','Off');
    set(handles.Onoff_AC,'Value',0);
    
end


% --- Executes on button press in On_off_Ws.
function On_off_Ws_Callback(hObject, eventdata, handles)
% hObject    handle to On_off_Ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of On_off_Ws
Ws=get(hObject,'Value');
if Ws==1
    set(handles.On_off_Ws,'String','On');
else
    set(handles.On_off_Ws,'String','Off');
end


% --- Executes on button press in Onoff_Lt.
function Onoff_Lt_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_Lt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_Lt

Lt=get(hObject,'Value')
if Lt==1
    set(handles.Onoff_Lt,'String','On');
    find_system('Name','Lights_Parameters.fig');
    run('Lights_Parameters');
    
else
    set(handles.Onoff_Lt,'String','Off');
    close('Lights_Parameters');
end


% --- Executes on button press in Onoff_Wh.
function Onoff_Wh_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_Wh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_Wh
Wh=get(hObject,'Value');
if Wh==1
    set(handles.Onoff_Wh,'String','On');
    set_param('Energy_Cost/Water Heater/OnOff WH','Value',num2str(Wh));
    Set=get_param('Energy_Cost/Set Point WH','Value');
    set_param('Energy_Cost/Water Heater/Integrator1','InitialCondition',num2str(Set));
    
    find_system('Name','Water_Heater.fig');
    run('Water_Heater');
else
    set(handles.Onoff_Wh,'String','Off');
    set_param('Energy_Cost/Water Heater/OnOff WH','Value',num2str(Wh));
    
    Tinlet=get_param('Energy_Cost/Water Heater/Tinlet','Gain');
    set_param('Energy_Cost/Water Heater/Integrator1','InitialCondition',num2str(Tinlet));

end


% --- Executes on button press in Onoff_Rf.
function Onoff_Rf_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_Rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_Rf

Rf=get(hObject,'Value');
if Rf==1
    set(handles.Onoff_Rf,'String','On');
    find_system('Name','Refrigerator.fig');
    run('Refrigerator');
else
    set(handles.Onoff_Rf,'String','Off');
     close('Refrigerator');
end


% --- Executes on button press in Onoff_AC.
function Onoff_AC_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_AC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_AC
AC=get(hObject,'Value');
set_param('Energy_Cost/Air Conditioner/AA_OnOff','Value',num2str(AC));



if AC==1
    set(handles.Onoff_AC,'String','On');
    set(handles.On_off_Furnance,'String','Off');
    set(handles.On_off_Furnance,'Value',0);
    
    set(handles.OnOff_AAHEAT,'String','On');
    set(handles.OnOff_AAHEAT,'Value',1);
    set(handles.AA_Heat,'String','AC');
    set(handles.AA_Heat,'Value',1);
    
    find_system('Name','Air_conditioner.fig');
    run('Air_conditioner');

else
    set(handles.Onoff_AC,'String','Off');
    
    set(handles.OnOff_AAHEAT,'String','Off');
    set(handles.OnOff_AAHEAT,'Value',0);
    set(handles.AA_Heat,'String','HT');
    set(handles.AA_Heat,'Value',0);
end


% --- Executes on button press in Onoff_St.
function Onoff_St_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_St (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_St
St=get(hObject,'Value');
if St==1
    set(handles.Onoff_St,'String','On');
    find_system('Name','Stove.fig');
    run('Stove');
else
    set(handles.Onoff_St,'String','Off');
    close('Stove');
end


% --- Executes on button press in Onoff_DW.
function Onoff_DW_Callback(hObject, eventdata, handles)
% hObject    handle to Onoff_DW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Onoff_DW
Onoff_DW=get(hObject,'Value');
if Onoff_DW==1
    set(handles.Onoff_DW,'String','On');
    find_system('Name','Dishwasher.fig');
    run('Dishwasher');
else
    set(handles.Onoff_DW,'String','Off');
    close('Dishwasher');
end


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param(gcs,'SimulationCommand','Stop');


% --- Executes on button press in help_prices.
function help_prices_Callback(hObject, eventdata, handles)
% hObject    handle to help_prices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


find_system('Name','Help_EnergyRates.fig');
run('Help_EnergyRates');
% close('Help_AirConditioner')



% --- Executes on button press in Help_Therm.
function Help_Therm_Callback(hObject, eventdata, handles)
% hObject    handle to Help_Therm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_Thermostat.fig');
run('Help_Thermostat');



% --- Executes on slider movement.
function slider_Thermost_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Thermost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% handles.slider_Thermost=0.5; %Initial value of slider.
handles.slider_Thermost=get(hObject,'Value');
handles.slider_Thermost= handles.slider_Thermost*2;
set(handles.Cr,'String',handles.slider_Thermost);
guidata(hObject,handles);
if handles.slider_Thermost==0
handles.slider_Thermost=handles.slider_Thermost+0.499;
set(handles.Cr,'String',handles.slider_Thermost);
end
Cr = get(handles.Cr,'String');
SetP_AC = handles.slider_Thermost;
set_param('Energy_Cost/Air Conditioner/Relay','OnSwitchValue',num2str(SetP_AC));
set_param('Energy_Cost/Air Conditioner/Relay','OffSwitchValue',num2str(-SetP_AC));



% --- Executes during object creation, after setting all properties.
function slider_Thermost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Thermost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in morelessP1.
function morelessP1_Callback(hObject, eventdata, handles)
% hObject    handle to morelessP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns morelessP1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from morelessP1


% --- Executes during object creation, after setting all properties.
function morelessP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to morelessP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderPlusMenosP1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderPlusMenosP1=get(hObject,'Value');
handles.sliderPlusMenosP1= handles.sliderPlusMenosP1*2;
set(handles.PlusMenosP1,'String',handles.sliderPlusMenosP1);
guidata(hObject,handles);
if handles.sliderPlusMenosP1==0
handles.sliderPlusMenosP1=handles.sliderPlusMenosP1+0.499;
set(handles.PlusMenosP1,'String',handles.sliderPlusMenosP1);
end



% --- Executes during object creation, after setting all properties.
function sliderPlusMenosP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderPlusMenosP2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sliderPlusMenosP2=get(hObject,'Value');
handles.sliderPlusMenosP2= handles.sliderPlusMenosP2*2;
set(handles.PlusMenosP2,'String',handles.sliderPlusMenosP2);
guidata(hObject,handles);
if handles.sliderPlusMenosP2==0
handles.sliderPlusMenosP2=handles.sliderPlusMenosP2+0.499;
set(handles.PlusMenosP2,'String',handles.sliderPlusMenosP2);
end


% --- Executes during object creation, after setting all properties.
function sliderPlusMenosP2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderPlusMenosP3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderPlusMenosP3=get(hObject,'Value');
handles.sliderPlusMenosP3= handles.sliderPlusMenosP3*2;
set(handles.PlusMenosP3,'String',handles.sliderPlusMenosP3);
guidata(hObject,handles);
if handles.sliderPlusMenosP3==0
handles.sliderPlusMenosP3=handles.sliderPlusMenosP3+0.499;
set(handles.PlusMenosP3,'String',handles.sliderPlusMenosP3);
end



% --- Executes during object creation, after setting all properties.
function sliderPlusMenosP3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderPlusMenosP4_Callback(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sliderPlusMenosP4=get(hObject,'Value');
handles.sliderPlusMenosP4= handles.sliderPlusMenosP4*2;
set(handles.PlusMenosP4,'String',handles.sliderPlusMenosP4);
guidata(hObject,handles);
if handles.sliderPlusMenosP4==0
handles.sliderPlusMenosP4=handles.sliderPlusMenosP4+0.499;
set(handles.PlusMenosP4,'String',handles.sliderPlusMenosP4);
end


% --- Executes during object creation, after setting all properties.
function sliderPlusMenosP4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderPlusMenosP4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Set_temp.
function Set_temp_Callback(hObject, eventdata, handles)
% hObject    handle to Set_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Temperatures.fig');
run('Temperatures');
Set_temp = get(hObject,'Value');
% if Set_temp==1
%     load Temp.mat
%     axes(handles.axes2)
%     plot(Temp);
%     axis([0 24 0 45]);
%     xlabel('Time (hrs)');
%     ylabel('Temperature ^o C');
%     title('Outside temperature');
% end

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

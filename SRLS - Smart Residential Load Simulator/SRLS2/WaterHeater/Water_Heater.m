function varargout = Water_Heater(varargin)
% WATER_HEATER MATLAB code for Water_Heater.fig
%      WATER_HEATER, by itself, creates a new WATER_HEATER or raises the existing
%      singleton*.
%
%      H = WATER_HEATER returns the handle to a new WATER_HEATER or the handle to
%      the existing singleton*.
%
%      WATER_HEATER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATER_HEATER.M with the given input arguments.
%
%      WATER_HEATER('Property','Value',...) creates a new WATER_HEATER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Water_Heater_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Water_Heater_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Water_Heater

% Last Modified by GUIDE v2.5 08-Feb-2012 13:24:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Water_Heater_OpeningFcn, ...
                   'gui_OutputFcn',  @Water_Heater_OutputFcn, ...
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


% --- Executes just before Water_Heater is made visible.
function Water_Heater_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Water_Heater (see VARARGIN)

% Choose default command line output for Water_Heater
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1)
[x,map]=imread('Water_Heater.jpg','jpg');
image(x),colormap(map),axis off,hold on



% --- Outputs from this function are returned to the command line.
function varargout = Water_Heater_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Tinlet_Callback(hObject, eventdata, handles)
% hObject    handle to Tinlet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tinlet as text
%        str2double(get(hObject,'String')) returns contents of Tinlet as a double


% --- Executes during object creation, after setting all properties.
function Tinlet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tinlet (see GCBO)
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
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Continue.
function Continue_Callback(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Tinlet = str2double(get(handles.Tinlet,'String'));
Tamb = str2double(get(handles.Tamb,'String'));
Q_WH = str2double(get(handles.Q_WH,'String'));
Volu = str2double(get(handles.Volu,'String'));
EF = str2double(get(handles.EF,'String'));
%Check the input values.
if isempty(Tinlet) ||isnan(Tinlet)
    errordlg('Please enter an integer value for temperature inlet water');
    set(handles.Tinlet,'String',1);
    return
end
if isempty(Tamb) ||isnan(Tamb)
    errordlg('Please enter an integer value for temperature of ambient');
    set(handles.Tamb,'String',1);
    return
end
if isempty(Q_WH) ||isnan(Q_WH)
    errordlg('Please enter an integer value for rated power');
    set(handles.Q_WH,'String',1);
    return
end
if isempty(Volu) ||isnan(Volu)
    errordlg('Please enter an integer value for the volume of the water heater');
    set(handles.Volu,'String',1);
    return
end
if isempty(EF) ||isnan(EF)
    errordlg('Please enter an integer value for the Eficiency');
    set(handles.EF,'String',1);
    return
end
Type_WH = get(handles.Type_WH,'Value');
if Type_WH==1
    Q_WH_EF=Q_WH*EF*3600;   % 3600 because Watts --->Joules
else
    Q_WH_EF=Q_WH*EF*3600*0.293083;   % 0.293083BTU--->Watts 3600 because Watts --->Joules
end

set(handles.Power,'String',num2str(Q_WH))
set(handles.Power,'String',num2str(EF))
UA_WH = 6837.48;  %J/hrs o^C Thermal conductivity
mdot_WH = 999.4;   %kg/m3     mass of water
Cp_WH = 4186.8;    %J/kg o^C  specific heat of water
          %Ltr-->m3
Cw_WH = (Volu*0.001)*Cp_WH*mdot_WH;    %thermal Capacitance of water
Joule_Watts = 1/(3600*EF);
Cp_mdot=Cp_WH*mdot_WH;


set_param('Energy_Cost/Water Heater/Q_WH*EF','Value',num2str(Q_WH_EF));
set_param('Energy_Cost/Water Heater/UA_WH','Value',num2str(UA_WH));
set_param('Energy_Cost/Water Heater/UA_WH1','Value',num2str(UA_WH));
set_param('Energy_Cost/Water Heater/1_(3600*EF)','Gain',num2str(Joule_Watts));
set_param('Energy_Cost/Water Heater/Cp_WH*mdot_WH','Value',num2str(Cp_WH*mdot_WH));
set_param('Energy_Cost/Water Heater/Tinlet','Gain',num2str(Tinlet));
set_param('Energy_Cost/Water Heater/1_Cw_WH','Gain',num2str(1/Cw_WH));
set_param('Energy_Cost/Water Heater/mdot_WH*Cp_WH','Gain',num2str(mdot_WH*Cp_WH));

save('Water_Heater')
close('Water_Heater')


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

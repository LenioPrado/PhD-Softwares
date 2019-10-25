function varargout = Furnace(varargin)
% FURNACE MATLAB code for Furnace.fig
%      FURNACE, by itself, creates a new FURNACE or raises the existing
%      singleton*.
%
%      H = FURNACE returns the handle to a new FURNACE or the handle to
%      the existing singleton*.
%
%      FURNACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FURNACE.M with the given input arguments.
%
%      FURNACE('Property','Value',...) creates a new FURNACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Furnace_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Furnace_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Furnace

% Last Modified by GUIDE v2.5 27-Aug-2019 18:22:04

% Juan Miguel Gonzalez Lopez

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Furnace_OpeningFcn, ...
                   'gui_OutputFcn',  @Furnace_OutputFcn, ...
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


% --- Executes just before Furnace is made visible.
function Furnace_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Furnace (see VARARGIN)

% Choose default command line output for Furnace
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1)
[x,map]=imread('Gas_Furnace.jpg','jpg');
image(x),colormap(map),axis off,hold on



% --- Outputs from this function are returned to the command line.
function varargout = Furnace_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Volts_Callback(hObject, eventdata, handles)
% hObject    handle to Volts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Volts as text
%        str2double(get(hObject,'String')) returns contents of Volts as a double

Volts = str2double(get(handles.Volts,'String'));
if isempty(Volts) ||isnan(Volts) ||(Volts<100) ||(Volts>250)
    errordlg('Please enter an integer value for Volts which usually is 115V or 230V');
    set(handles.Volts,'String',230);
    return
end





% --- Executes during object creation, after setting all properties.
function Volts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Volts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ampers_Callback(hObject, eventdata, handles)
% hObject    handle to Ampers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ampers as text
%        str2double(get(hObject,'String')) returns contents of Ampers as a double

Ampers = str2double(get(handles.Ampers,'String'));
if isempty(Ampers) ||isnan(Ampers) ||(Ampers<1) ||(Ampers>25)
    errordlg('Please enter an integer value for Ampers which usually is around 2 Amp to 25 Amp');
    set(handles.Ampers,'String',2);
    return
end


% --- Executes during object creation, after setting all properties.
function Ampers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ampers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Watts_Callback(hObject, eventdata, handles)
% hObject    handle to Watts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Watts as text
%        str2double(get(hObject,'String')) returns contents of Watts as a double

Watts = str2double(get(handles.Watts,'String'));
if isempty(Watts) ||isnan(Watts) ||(Watts<1) ||(Watts>25)
    errordlg('Please enter an integer value for Watts 600-3500');
    set(handles.Watts,'String',1500);
    return
end


% --- Executes during object creation, after setting all properties.
function Watts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Watts (see GCBO)
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
    set(handles.Watts,'String',4500)
    set(handles.EF,'String',0.92)
    Rate_Ele_WH=1;
    Gas_rate=0;
    set_param('Energy_Cost/Water Heater/Rates/Rate_Ele_WH','Value',num2str(Rate_Ele_WH));
    set_param('Energy_Cost/Water Heater/Rates/Rate_Gas_WH','Value',num2str(Gas_rate));
else
    set(handles.Watts,'String',40000)
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



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider1=40; %Inicializar el valor del slider.
handles.slider1=get(hObject,'Value');
handles.slider1= handles.slider1*50;
set(handles.SetPoint_Aa,'String',handles.slider1);
guidata(hObject,handles);
if handles.slider1==0
handles.slider1=handles.slider1+0.01;
set(handles.SetPoint_Aa,'String',handles.slider1);
end
SetP_AA = get(handles.SetPoint_Aa,'String');
set_param('Energy_Cost/Set Point WH','Value',num2str(SetP_AA));

handles.slider1


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

a = get(handles.BTU,'Value');
BTU = str2double(get(handles.BTU,'String'));
btu = BTU(a,1);

Cool_cap = btu*3600/3.412;   %  BTU--> watts-hrs
set_param('Energy_Cost/Air Conditioner/Q_AC','Value',num2str(Cool_cap));
set_param('Energy_Cost/Air Conditioner/Relay','OnOutputValue',num2str(1));
set_param('Energy_Cost/Air Conditioner/Relay','OffOutputValue',num2str(0));
set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(1));


set_param('Energy_Cost/Air Conditioner/Cost_AA/Rates/Rate_Ele_WH','Value',num2str(0));
set_param('Energy_Cost/Air Conditioner/Cost_AA/Rates/Rate_Gas_WH','Value',num2str(1));
set_param('Energy_Cost/Air Conditioner/Cost_AA/AcHt','Gain',num2str(1));


save('Furnace')
find_system('Name','Household.fig');
run('Household');
close('Furnace')


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


% --- Executes on button press in help_HT.
function help_HT_Callback(hObject, eventdata, handles)
% hObject    handle to help_HT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


find_system('Name','Help_Furnace.fig');
run('Help_Furnace');


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in BTU.
function BTU_Callback(hObject, eventdata, handles)
% hObject    handle to BTU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns BTU contents as cell array
%        contents{get(hObject,'Value')} returns selected item from BTU

hobj = get(handles.BTU,'Value');
if hobj ==1
    set(handles.EER,'String',10);
elseif hobj == 2    
    set(handles.EER,'String',10);
elseif hobj ==3
    set(handles.EER,'String',11.7);
elseif hobj ==4
    set(handles.EER,'String',10.3);
elseif hobj ==5
    set(handles.EER,'String',11.25);
elseif hobj ==6
    set(handles.EER,'String',11.25);
end
    
    
    



% --- Executes during object creation, after setting all properties.
function BTU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BTU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function EER_Callback(hObject, eventdata, handles)
% hObject    handle to EER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EER as text
%        str2double(get(hObject,'String')) returns contents of EER as a double
EER = str2double(get(handles.EER,'String'));
if isempty(EER) ||isnan(EER) ||(EER<7) ||(EER>25)
    errordlg('Please enter an integer value for Energy Eficient Factor if known');
    a = get(handles.BTU,'Value');
    BTU = str2double(get(handles.BTU,'String'));
    btu = BTU(a,1);
    Watts = str2double(get(handles.Watts,'String'));
    watts = Watts;
    eer = btu/watts;
    set(handles.EER,'String',eer);
    return
end


% --- Executes during object creation, after setting all properties.
function EER_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Continue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

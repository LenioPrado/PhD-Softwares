function varargout = Air_conditioner(varargin)
% AIR_CONDITIONER MATLAB code for Air_conditioner.fig
%      AIR_CONDITIONER, by itself, creates a new AIR_CONDITIONER or raises the existing
%      singleton*.
%
%      H = AIR_CONDITIONER returns the handle to a new AIR_CONDITIONER or the handle to
%      the existing singleton*.
%
%      AIR_CONDITIONER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AIR_CONDITIONER.M with the given input arguments.
%
%      AIR_CONDITIONER('Property','Value',...) creates a new
%      AIR_CONDITIONER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Air_conditioner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Air_conditioner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Air_conditioner

% Last Modified by GUIDE v2.5 15-Aug-2019 18:28:34

% Juan Miguel Gonzalez Lopez

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Air_conditioner_OpeningFcn, ...
                   'gui_OutputFcn',  @Air_conditioner_OutputFcn, ...
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


% --- Executes just before Air_conditioner is made visible.
function Air_conditioner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Air_conditioner (see VARARGIN)

% Choose default command line output for Air_conditioner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1)
[x,map]=imread('AA.jpg','jpg');
image(x),colormap(map),axis off,hold on



% --- Outputs from this function are returned to the command line.
function varargout = Air_conditioner_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in BTU.
function BTU_Callback(hObject, eventdata, handles)
% hObject    handle to BTU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns BTU contents as cell array
%        contents{get(hObject,'Value')} returns selected item from BTU

hobj = get(handles.BTU,'Value');
if hobj ==1
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',4.5);
    set(handles.Watts,'String',880);
    set(handles.EER,'String',10);
elseif hobj == 2    
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',5.0);
    set(handles.Watts,'String',1100);
    set(handles.EER,'String',10);
elseif hobj ==3
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',6.7);
    set(handles.Watts,'String',1530);
    set(handles.EER,'String',11.7);
elseif hobj ==4
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',9.8);
    set(handles.Watts,'String',2345);
    set(handles.EER,'String',10.3);
elseif hobj ==5
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',10.5);
    set(handles.Watts,'String',2400);
    set(handles.EER,'String',11.25);
elseif hobj ==6
    set(handles.Volts,'String',230);
    set(handles.Ampers,'String',15.5);
    set(handles.Watts,'String',4450);
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



% --- Executes on button press in Continue.
function Continue_Callback(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(handles.BTU,'Value');
BTU = str2double(get(handles.BTU,'String'));
btu = BTU(a,1);

Cool_cap = -btu*3600/3.412;   %  BTU--> watts-hrs
set_param('Energy_Cost/Air Conditioner/Q_AC','Value',num2str(Cool_cap));
set_param('Energy_Cost/Air Conditioner/Relay','OnOutputValue',num2str(0));
set_param('Energy_Cost/Air Conditioner/Relay','OffOutputValue',num2str(1));
set_param('Energy_Cost/Air Conditioner/AA or Heat','Value',num2str(2));

set_param('Energy_Cost/Air Conditioner/Cost_AA/Rates/Rate_Ele_WH','Value',num2str(1));
set_param('Energy_Cost/Air Conditioner/Cost_AA/Rates/Rate_Gas_WH','Value',num2str(0));
set_param('Energy_Cost/Air Conditioner/Cost_AA/AcHt','Gain',num2str(1));


save('Air_conditioner')
find_system('Name','Household.fig');
run('Household');
close('Air_conditioner')



% --- Executes on button press in help_AC.
function help_AC_Callback(hObject, eventdata, handles)
% hObject    handle to help_AC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_AirConditioner.fig');
run('Help_AirConditioner');
% close('Help_AirConditioner')

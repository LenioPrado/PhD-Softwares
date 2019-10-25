function varargout = Help_Clothwasher(varargin)
% HELP_CLOTHWASHER M-file for Help_Clothwasher.fig
%      HELP_CLOTHWASHER, by itself, creates a new HELP_CLOTHWASHER or raises the existing
%      singleton*.
%
%      H = HELP_CLOTHWASHER returns the handle to a new HELP_CLOTHWASHER or the handle to
%      the existing singleton*.
%
%      HELP_CLOTHWASHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_CLOTHWASHER.M with the given input arguments.
%
%      HELP_CLOTHWASHER('Property','Value',...) creates a new HELP_CLOTHWASHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Clothwasher_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Clothwasher_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Clothwasher

% Last Modified by GUIDE v2.5 16-Apr-2012 10:04:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Clothwasher_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Clothwasher_OutputFcn, ...
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


% --- Executes just before Help_Clothwasher is made visible.
function Help_Clothwasher_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Clothwasher (see VARARGIN)

% Choose default command line output for Help_Clothwasher
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Clothwasher wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Clothwasher_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Clothwasher_power_waveform.jpg','jpg');
image(x),colormap(map),axis off,hold on          

axes(handles.axes2)
[x,map]=imread('Bottons3.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


axes(handles.axes3)
[x,map]=imread('Bottons1.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


axes(handles.axes4)
[x,map]=imread('Clothwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


text2  = {'Clothwasher (CW)'};
% Create a text
set(handles.text2,'Units', 'characters',...
                  'HorizontalAlignment','left',...
                 'Position', [1 20 30 1.5],...
                 'String',  text2,...
                 'FontSize',  12);


text3  = {'The CW process is controlled by a step timer or an electronic control device. Electrical energy is used mainly for driving the drum motor and heating up the water, if it was not hot enough; in spite of the fact that about 3/4 to 2/3 of the water is used as cold water for rinsing. An example of the washer average power demand profile is given bellow:'};
% Create a text
set(handles.text3,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 14 160 6],...
                 'String',  text3,...
                 'FontSize',  10);

text4  = {'In the presented figure three main sections are presented with constant power. P1 and P4 are used to filling and draining with rinse water. While P2 and P3 are used to heat water if this function is selected. The model presented in this simulator fits this type of behavior according to the yellow energy guide label and with the user inputs.'};
set(handles.text4,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 0.5 160 5],...
                 'String',  text4,...
                 'FontSize',  10);
          
             
             
% --- Executes on selection change in NumLoads.
function NumLoads_Callback(hObject, eventdata, handles)
% hObject    handle to NumLoads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NumLoads contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NumLoads




% --- Executes during object creation, after setting all properties.
function NumLoads_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumLoads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in lowEfficiency.
function lowEfficiency_Callback(hObject, eventdata, handles)
% hObject    handle to lowEfficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lowEfficiency



% --- Executes on button press in EnergyStar.
function EnergyStar_Callback(hObject, eventdata, handles)
% hObject    handle to EnergyStar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of EnergyStar


% --- Executes on button press in checkWH.
function checkWH_Callback(hObject, eventdata, handles)
% hObject    handle to checkWH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkWH



function AnnualPower_Callback(hObject, eventdata, handles)
% hObject    handle to AnnualPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AnnualPower as text
%        str2double(get(hObject,'String')) returns contents of AnnualPower as a double



% --- Executes during object creation, after setting all properties.
function AnnualPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AnnualPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in MinLoad.
function MinLoad_Callback(hObject, eventdata, handles)
% hObject    handle to MinLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MinLoad contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MinLoad



% --- Executes during object creation, after setting all properties.
function MinLoad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

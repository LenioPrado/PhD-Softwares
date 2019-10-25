function varargout = Help_Dryer(varargin)
% HELP_DRYER M-file for Help_Dryer.fig
%      HELP_DRYER, by itself, creates a new HELP_DRYER or raises the existing
%      singleton*.
%
%      H = HELP_DRYER returns the handle to a new HELP_DRYER or the handle to
%      the existing singleton*.
%
%      HELP_DRYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_DRYER.M with the given input arguments.
%
%      HELP_DRYER('Property','Value',...) creates a new HELP_DRYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Dryer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Dryer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Dryer

% Last Modified by GUIDE v2.5 14-Apr-2012 13:26:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Dryer_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Dryer_OutputFcn, ...
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


% --- Executes just before Help_Dryer is made visible.
function Help_Dryer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Dryer (see VARARGIN)

% Choose default command line output for Help_Dryer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Dryer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Dryer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Dryer_power_waveform.jpg','jpg');
image(x),colormap(map),axis off,hold on          

axes(handles.axes2)
[x,map]=imread('Dryer.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


axes(handles.axes3)
[x,map]=imread('Bottons2.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


text2  = {'Dryer (DY)'};
% Create a text
set(handles.text2,'Units', 'characters',...
                  'HorizontalAlignment','left',...
                 'Position', [1 17 30 1.5],...
                 'String',  text2,...
                 'FontSize',  12);


text3  = {'All clothes dryers work the same way; the big difference is in their energy source: gas or electricity. Only electrical ones are considered on this simulator, since electrical dryer are the most common used in North America. Unlike other appliances, the energy used by clothes dryers does noy vary significantly from model to model. That’s why they usually do not display energy-rating labels.  An example of a dryer consumption pattern is shown in the figure bellow [1-3], normal power is in the range of 2000 to 2500 Watts during P1 period and 500 Watts for P2.'};
% Create a text
set(handles.text3,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 10 160 6],...
                 'String',  text3,...
                 'FontSize',  10);

text4  = {'In this simulator 2500 Watts is used for the first 60 minutes of use, and 500 Watts for the rest of its simulation.'};
set(handles.text4,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 1 160 1],...
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

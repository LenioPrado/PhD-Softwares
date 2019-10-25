function varargout = Help_Dishwasher(varargin)
% HELP_DISHWASHER M-file for Help_Dishwasher.fig
%      HELP_DISHWASHER, by itself, creates a new HELP_DISHWASHER or raises the existing
%      singleton*.
%
%      H = HELP_DISHWASHER returns the handle to a new HELP_DISHWASHER or the handle to
%      the existing singleton*.
%
%      HELP_DISHWASHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_DISHWASHER.M with the given input arguments.
%
%      HELP_DISHWASHER('Property','Value',...) creates a new HELP_DISHWASHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Dishwasher_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Dishwasher_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Dishwasher

% Last Modified by GUIDE v2.5 11-Apr-2012 15:43:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Dishwasher_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Dishwasher_OutputFcn, ...
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


% --- Executes just before Help_Dishwasher is made visible.
function Help_Dishwasher_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Dishwasher (see VARARGIN)

% Choose default command line output for Help_Dishwasher
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Dishwasher wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Dishwasher_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Dishwasher_power_waveform.jpg','jpg');
image(x),colormap(map),axis off,hold on          

axes(handles.axes2)
[x,map]=imread('Bottons.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


axes(handles.axes3)
[x,map]=imread('Bottons1.jpg','jpg');
% [x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


axes(handles.axes4)
[x,map]=imread('Dishwasher_EnerGuide.jpg','jpg');
image(x),colormap(map),axis off,hold on  


text2  = {'Dishwasher (DW)'};
% Create a text
set(handles.text2,'Units', 'characters',...
                  'HorizontalAlignment','left',...
                 'Position', [1 20 30 1.5],...
                 'String',  text2,...
                 'FontSize',  12);


text3  = {'Dishwasher operates with a sequence of operations depicted in the figure bellow, first filling with water for about 15 minutes with a constant power (P1), then provide electric heating increasing the power to (P2), the time of this period depend if is connected to hot water or cold water goes into the dishwasher [1]. After that, hot water and detergent are sprayed over the dishes, alternatively draining and refilling with rinse water (P3). Then the dishes are dried using the electric resistance element again (P4) and finally (P5) uses the hot air remaining in the dishwasher.'};
% Create a text
set(handles.text3,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 14 160 6],...
                 'String',  text3,...
                 'FontSize',  10);

text4  = {'According to [1] around 55 percent of the energy used by a dishwasher goes to heat water even if is connected to water heater, and 65 percent if cold water goes into the dishwasher. And the period P3 depend on the efficiency of the dishwasher. The model presented in this simulator try to fit the figure presented on the top with the use of the yellow energy guide under standard conditions and with the use of the entries given by the user.'};
set(handles.text4,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [2 0.5 160 5],...
                 'String',  text4,...
                 'FontSize',  10);
             
              
text5  = {'References',...
    '[1] David E. Hoak, Danny S. Parker and Andreas H. Hermelink, "How energy efficient are modern dishwashers",',...
    '     Florida solar energy center, Proceedings of ACEEE 2008.'};


% Create a uitable on the left side of the figure
set(handles.text5,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [5 1 125 3],...
                 'String',  text5,...
                 'FontSize',  8);              
             
             
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

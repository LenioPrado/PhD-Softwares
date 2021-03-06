function varargout = Plots(varargin)
% PLOTS MATLAB code for Plots.fig
%      PLOTS, by itself, creates a new PLOTS or raises the existing
%      singleton*.
%
%      H = PLOTS returns the handle to a new PLOTS or the handle to
%      the existing singleton*.
%
%      PLOTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTS.M with the given input arguments.
%
%      PLOTS('Property','Value',...) creates a new PLOTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Plots_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Plots_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Plots

% Last Modified by GUIDE v2.5 06-Feb-2012 12:02:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Plots_OpeningFcn, ...
                   'gui_OutputFcn',  @Plots_OutputFcn, ...
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


% --- Executes just before Plots is made visible.
function Plots_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Plots (see VARARGIN)

% Choose default command line output for Plots
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Plots wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Plots_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on uitable4 and none of its controls.
function uitable4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fie lds (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in EnergyConsumption.
function EnergyConsumption_Callback(hObject, eventdata, handles)
% hObject    handle to EnergyConsumption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of EnergyConsumption


% --- Executes on button press in Cost_Lighting.
function Cost_Lighting_Callback(hObject, eventdata, handles)
% hObject    handle to Cost_Lighting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cost_Lighting




% --- Executes on button press in Plot.
function Plot_Callback(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

EnergyConsumption = get(handles.EnergyConsumption,'Value');
Cost_Lighting = get(handles.Cost_Lighting,'Value');


load Light_Inc.mat
load Light_CFL.mat
load Light_FLU.mat
load Lighting_Total.mat
 
time = Light_Inc(1,:);

if EnergyConsumption==1 && Cost_Lighting==0
    axes(handles.axes1)
    plot(time,Lighting_Total(2,:)*1000);grid on;
    xlabel('Time (hrs)'); ylabel('Power (Watts)');
%     axis([0 24 [] [] ]); 
    hleg1 =legend('Lighting Power', 'South');set(hleg1,'Location','NorthWest')
     
    axes(handles.axes2)
    plot(time,Light_Inc(2,:));hold on; grid on;plot(time,Light_CFL(2,:),'--r');
    plot(time,Light_FLU(2,:),':k');xlabel('Time (hrs)'); ylabel('Power kW-h');
%     axis([0 24 [] [] ]); 
    hleg1=legend('Incandescent','CFL','FLU');set(hleg1,'Location','NorthWest')
end

if Cost_Lighting==1 && EnergyConsumption==0
    axes(handles.axes1)
    plot(time,Lighting_Total(2,:)*1000);grid on;
    xlabel('Time (hrs)'); ylabel('Power (Watts)');
%     axis([0 24 [] [] ]); 
    hleg1=legend('Lighting Power');    set(hleg1,'Location','NorthWest')

    
    axes(handles.axes2)
    plot(time,Light_Inc(3,:));hold on; grid on; plot(time,Light_CFL(3,:),'--r');
    plot(time,Light_FLU(3,:),':k');xlabel('Time (hrs)');ylabel('Cost c/kW-h');
%     axis([0 24 [] [] ]);
    hleg1=legend('Incandescent','CFL','FLU');set(hleg1,'Location','NorthWest');

end

if Cost_Lighting==1 && EnergyConsumption==1
opc=questdlg('�Chose Cost or Energy consumption at a time?','SALIR','Continue','Cancel');
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4

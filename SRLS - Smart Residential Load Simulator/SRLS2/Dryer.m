 function varargout = Dryer(varargin)
% DRYER M-file for Dryer.fig
%      DRYER, by itself, creates a new DRYER or raises the existing
%      singleton*.
%
%      H = DRYER returns the handle to a new DRYER or the handle to
%      the existing singleton*.
%
%      DRYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRYER.M with the given input arguments.
%
%      DRYER('Property','Value',...) creates a new DRYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Dryer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Dryer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Dryer

% Last Modified by GUIDE v2.5 09-Apr-2012 14:55:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Dryer_OpeningFcn, ...
                   'gui_OutputFcn',  @Dryer_OutputFcn, ...
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


% --- Executes just before Dryer is made visible.
function Dryer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Dryer (see VARARGIN)

% Choose default command line output for Dryer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Dryer wait for user response (see UIRESUME)
% uiwait(handles.figure1);



set(handles.uipanelOn_DW2,'Visible','Off');
set(handles.uipanelOn_DW3,'Visible','Off');



set_param('Energy_Cost/Dryer/DY_OnOff','Value',num2str(1));
set_param('Energy_Cost/Dryer/LoadsDay','Value',num2str(1));
set_param('Energy_Cost/Dryer/MinOfLoad','Value',num2str(50));
set_param('Energy_Cost/Dryer/WhenUsed1','Value',num2str(25));
set_param('Energy_Cost/Dryer/WhenUsed2','Value',num2str(25));
set_param('Energy_Cost/Dryer/WhenUsed3','Value',num2str(25));




% --- Outputs from this function are returned to the command line.
function varargout = Dryer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Dryer.jpg','jpg');
image(x),colormap(map),axis off,hold on          
                
% --- Executes on selection change in NumLoads.
function NumLoads_Callback(hObject, eventdata, handles)
% hObject    handle to NumLoads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NumLoads contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NumLoads


NumLoads = get(handles.NumLoads,'Value');
set_param('Energy_Cost/Dryer/LoadsDay','Value',num2str(NumLoads));
if NumLoads ==1
    set(handles.uipanelOn_DW2,'Visible','Off');
    set(handles.uipanelOn_DW3,'Visible','Off');
elseif NumLoads ==2
    set(handles.uipanelOn_DW2,'Visible','On');
    set(handles.uipanelOn_DW3,'Visible','Off');
else
    set(handles.uipanelOn_DW2,'Visible','On');
    set(handles.uipanelOn_DW3,'Visible','On');
end
    





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



function On_DY1_Callback(hObject, eventdata, handles)
% hObject    handle to On_DY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_DY1 as text
%        str2double(get(hObject,'String')) returns contents of On_DY1 as a double
On_DW1 = str2double(get(handles.On_DY1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.On_DY1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_DY1,'String',[]);
    return
end
set_param('Energy_Cost/Dryer/WhenUsed1','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function On_DY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_DY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_DY2_Callback(hObject, eventdata, handles)
% hObject    handle to On_DY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_DY2 as text
%        str2double(get(hObject,'String')) returns contents of On_DY2 as a double
On_DW2 = str2double(get(handles.On_DY2,'String'));
if isempty(On_DW2) ||isnan(On_DW2)
    errordlg('Please enter an integer value');
    set(handles.On_DY2,'String',[]);
    return
end
if On_DW2<0 || On_DW2>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_DY2,'String',[]);
    return
end
set_param('Energy_Cost/Dryer/WhenUsed2','Value',num2str(On_DW2));

% --- Executes during object creation, after setting all properties.
function On_DY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_DY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function On_DY3_Callback(hObject, eventdata, handles)
% hObject    handle to On_DY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_DY3 as text
%        str2double(get(hObject,'String')) returns contents of On_DY3 as a double
On_DW3 = str2double(get(handles.On_DY3,'String'));
if isempty(On_DW3) ||isnan(On_DW3)
    errordlg('Please enter an integer value');
    set(handles.On_DY3,'String',[]);
    return
end
if On_DW3<0 || On_DW3>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_DY3,'String',[]);
    return
end
set_param('Energy_Cost/Dryer/WhenUsed3','Value',num2str(On_DW3));

% --- Executes during object creation, after setting all properties.
function On_DY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_DY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ContinueDW.
function ContinueDW_Callback(hObject, eventdata, handles)
% hObject    handle to ContinueDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

save('Dryer')
close('Dryer')


% --- Executes on button press in HelpDW.
function HelpDW_Callback(hObject, eventdata, handles)
% hObject    handle to HelpDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_Dryer.fig');
run('Help_Dryer');



% --- Executes on button press in checkWH.
function checkWH_Callback(hObject, eventdata, handles)
% hObject    handle to checkWH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkWH

checkWH = get(handles.checkWH,'Value');
if checkWH ==0
    set_param('Energy_Cost/Dryer/WH conected','Value',num2str(0));
elseif checkWH ==1
    set_param('Energy_Cost/Dryer/WH conected','Value',num2str(1));
end



% --- Executes on selection change in MinLoad.
function MinLoad_Callback(hObject, eventdata, handles)
% hObject    handle to MinLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MinLoad contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MinLoad
MinLoad = get(handles.MinLoad,'Value');
if MinLoad ==1
    MinLoad = 50;
elseif MinLoad==2
    MinLoad = 60;
elseif MinLoad==3
    MinLoad = 70;
elseif MinLoad==4
    MinLoad = 80;    
elseif MinLoad==5
    MinLoad = 90;    
elseif MinLoad==6
    MinLoad = 100;
elseif MinLoad==7
    MinLoad = 110;
elseif MinLoad==8
    MinLoad = 120;       
end
set_param('Energy_Cost/Dryer/MinOfLoad','Value',num2str(MinLoad));



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

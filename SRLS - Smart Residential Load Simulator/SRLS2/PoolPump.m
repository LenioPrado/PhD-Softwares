function varargout = PoolPump(varargin)
% POOLPUMP M-file for PoolPump.fig
%      POOLPUMP, by itself, creates a new POOLPUMP or raises the existing
%      singleton*.
%
%      H = POOLPUMP returns the handle to a new POOLPUMP or the handle to
%      the existing singleton*.
%
%      POOLPUMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POOLPUMP.M with the given input arguments.
%
%      POOLPUMP('Property','Value',...) creates a new POOLPUMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PoolPump_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PoolPump_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PoolPump

% Last Modified by GUIDE v2.5 14-Jan-2013 11:44:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PoolPump_OpeningFcn, ...
                   'gui_OutputFcn',  @PoolPump_OutputFcn, ...
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


% --- Executes just before PoolPump is made visible.
function PoolPump_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PoolPump (see VARARGIN)

% Choose default command line output for PoolPump
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PoolPump wait for user response (see UIRESUME)
% uiwait(handles.figure1);



set(handles.uipanelOn_DW2,'Visible','Off');
set(handles.uipanelOn_DW3,'Visible','Off');



set_param('Energy_Cost/PoolPump/PP_OnOff','Value',num2str(1));
set_param('Energy_Cost/PoolPump/LoadsDay','Value',num2str(1));
set_param('Energy_Cost/PoolPump/MinOfLoad','Value',num2str(50));
set_param('Energy_Cost/PoolPump/WhenUsed1','Value',num2str(25));
set_param('Energy_Cost/PoolPump/WhenUsed2','Value',num2str(25));
set_param('Energy_Cost/PoolPump/WhenUsed3','Value',num2str(25));




% --- Outputs from this function are returned to the command line.
function varargout = PoolPump_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('PoolPump.jpg','jpg');
image(x),colormap(map),axis off,hold on          
                
% --- Executes on selection change in NumLoads.
function NumLoads_Callback(hObject, eventdata, handles)
% hObject    handle to NumLoads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NumLoads contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NumLoads


NumLoads = get(handles.NumLoads,'Value');
set_param('Energy_Cost/PoolPump/LoadsDay','Value',num2str(NumLoads));
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



function On_PP1_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP1 as text
%        str2double(get(hObject,'String')) returns contents of On_PP1 as a double
On_DW1 = str2double(get(handles.On_PP1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.On_PP1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_PP1,'String',[]);
    return
end
set_param('Energy_Cost/PoolPump/WhenUsed1','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function On_PP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_PP2_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP2 as text
%        str2double(get(hObject,'String')) returns contents of On_PP2 as a double
On_DW2 = str2double(get(handles.On_PP2,'String'));
if isempty(On_DW2) ||isnan(On_DW2)
    errordlg('Please enter an integer value');
    set(handles.On_PP2,'String',[]);
    return
end
if On_DW2<0 || On_DW2>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_PP2,'String',[]);
    return
end
set_param('Energy_Cost/PoolPump/WhenUsed2','Value',num2str(On_DW2));

% --- Executes during object creation, after setting all properties.
function On_PP2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function On_PP3_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP3 as text
%        str2double(get(hObject,'String')) returns contents of On_PP3 as a double
On_DW3 = str2double(get(handles.On_PP3,'String'));
if isempty(On_DW3) ||isnan(On_DW3)
    errordlg('Please enter an integer value');
    set(handles.On_PP3,'String',[]);
    return
end
if On_DW3<0 || On_DW3>=24
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.On_PP3,'String',[]);
    return
end
set_param('Energy_Cost/PoolPump/WhenUsed3','Value',num2str(On_DW3));

% --- Executes during object creation, after setting all properties.
function On_PP3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP3 (see GCBO)
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

save('PoolPump')
close('PoolPump')


% --- Executes on button press in HelpDW.
function HelpDW_Callback(hObject, eventdata, handles)
% hObject    handle to HelpDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','PoolPump.fig');
run('Help_PoolPump');



% --- Executes on button press in checkWH.
function checkWH_Callback(hObject, eventdata, handles)
% hObject    handle to checkWH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkWH

checkWH = get(handles.checkWH,'Value');
if checkWH ==0
    set_param('Energy_Cost/PoolPump/WH conected','Value',num2str(0));
elseif checkWH ==1
    set_param('Energy_Cost/PoolPump/WH conected','Value',num2str(1));
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
    MinLoad = 30;
elseif MinLoad==2
    MinLoad = 60;
elseif MinLoad==3
    MinLoad = 90;
elseif MinLoad==4
    MinLoad = 120;    
elseif MinLoad==5
    MinLoad = 150;    
elseif MinLoad==6
    MinLoad = 180;
elseif MinLoad==7
    MinLoad = 210;
elseif MinLoad==8
    MinLoad = 240;
elseif MinLoad==9
    MinLoad = 270;  
elseif MinLoad==10
    MinLoad = 300;
elseif MinLoad==11
    MinLoad = 330;
elseif MinLoad==12
    MinLoad = 360;
elseif MinLoad==13
    MinLoad = 390;
elseif MinLoad==14
    MinLoad = 420;
elseif MinLoad==15
    MinLoad = 450;
elseif MinLoad==16
    MinLoad = 480;    
end
set_param('Energy_Cost/PoolPump/MinOfLoad','Value',num2str(MinLoad));



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



function On_PP1_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP1 as text
%        str2double(get(hObject,'String')) returns contents of On_PP1 as a double
On_DW1 = str2double(get(handles.On_PP1,'String'));

% --- Executes during object creation, after setting all properties.
function On_PP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_PP3_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP3 as text
%        str2double(get(hObject,'String')) returns contents of On_PP3 as a double


% --- Executes during object creation, after setting all properties.
function On_PP3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_PP2_Callback(hObject, eventdata, handles)
% hObject    handle to On_PP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_PP2 as text
%        str2double(get(hObject,'String')) returns contents of On_PP2 as a double


% --- Executes during object creation, after setting all properties.
function On_PP2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_PP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

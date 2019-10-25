 function varargout = Battery(varargin)
% BATTERY M-file for Battery.fig
%      BATTERY, by itself, creates a new BATTERY or raises the existing
%      singleton*.
%
%      H = BATTERY returns the handle to a new BATTERY or the handle to
%      the existing singleton*.
%
%      BATTERY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BATTERY.M with the given input arguments.
%
%      BATTERY('Property','Value',...) creates a new BATTERY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Battery_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Battery_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Battery

% Last Modified by GUIDE v2.5 15-Aug-2013 15:39:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Battery_OpeningFcn, ...
                   'gui_OutputFcn',  @Battery_OutputFcn, ...
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


% --- Executes just before Battery is made visible.
function Battery_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Battery (see VARARGIN)

% Choose default command line output for Battery
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Battery wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set_param('Energy_Cost/Battery/BT_OnOff','Value',num2str(1)); 
set_param('Energy_Cost/Battery/Power1','Value',num2str(35));
set_param('Energy_Cost/Battery/Power2','Value',num2str(55));
set_param('Energy_Cost/Battery/Power3','Value',num2str(20));
set_param('Energy_Cost/Battery/Power4','Value',num2str(70));
set_param('Energy_Cost/Battery/Power5','Value',num2str(25));
set_param('Energy_Cost/Battery/Power6','Value',num2str(30));
set_param('Energy_Cost/Battery/Power7','Value',num2str(45));
set_param('Energy_Cost/Battery/Power8','Value',num2str(60));
set_param('Energy_Cost/Battery/Power9','Value',num2str(45));
set_param('Energy_Cost/Battery/Power10','Value',num2str(80));
set_param('Energy_Cost/Battery/Power11','Value',num2str(85));
set_param('Energy_Cost/Battery/Power12','Value',num2str(55));
set_param('Energy_Cost/Battery/Power13','Value',num2str(92));
set_param('Energy_Cost/Battery/Power14','Value',num2str(76));
set_param('Energy_Cost/Battery/Power15','Value',num2str(51));
set_param('Energy_Cost/Battery/Power16','Value',num2str(31));
set_param('Energy_Cost/Battery/Power17','Value',num2str(62));
set_param('Energy_Cost/Battery/Power18','Value',num2str(87));
set_param('Energy_Cost/Battery/Power19','Value',num2str(97));
set_param('Energy_Cost/Battery/Power20','Value',num2str(75));
set_param('Energy_Cost/Battery/Power21','Value',num2str(61));
set_param('Energy_Cost/Battery/Power22','Value',num2str(43));
set_param('Energy_Cost/Battery/Power23','Value',num2str(29));
set_param('Energy_Cost/Battery/Power24','Value',num2str(59));
set_param('Energy_Cost/Battery/Power25','Value',num2str(1500));
%set_param('Energy_Cost/Battery/BT_OnOff','Value',num2str(1));





set_param('Energy_Cost/Battery/MinOfLoad','Value',num2str(50));
set_param('Energy_Cost/Battery/WhenUsed1','Value',num2str(25));
set_param('Energy_Cost/Battery/WhenUsed2','Value',num2str(25));
set_param('Energy_Cost/Battery/WhenUsed3','Value',num2str(25));




% --- Outputs from this function are returned to the command line.
function varargout = Battery_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Battery.jpg','jpg');
image(x),colormap(map),axis off,hold on          
                
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



% --- Executes on button press in ContinueDW.
function ContinueDW_Callback(hObject, eventdata, handles)
% hObject    handle to ContinueDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

save('Battery')
close('Battery')


% --- Executes on button press in HelpDW.
function HelpDW_Callback(hObject, eventdata, handles)
% hObject    handle to HelpDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Battery.3.fig');
run('Help_Battery');



% --- Executes on button press in checkWH.
function checkWH_Callback(hObject, eventdata, handles)
% hObject    handle to checkWH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkWH

checkWH = get(handles.checkWH,'Value');
if checkWH ==0
    set_param('Energy_Cost/Battery/WH conected','Value',num2str(0));
elseif checkWH ==1
    set_param('Energy_Cost/Battery/WH conected','Value',num2str(1));
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
set_param('Energy_Cost/Battery/MinOfLoad','Value',num2str(MinLoad));



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


% --- Executes on selection change in Battery_type.
function Battery_type_Callback(hObject, eventdata, handles)
% hObject    handle to Battery_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Battery_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Battery_type
Battery_type = get(handles.Battery_type,'Value')
set_param('Energy_Cost/Battery/Battery_type','Value',num2str(Battery_type));


% --- Executes during object creation, after setting all properties.
function Battery_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Battery_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power1_Callback(hObject, eventdata, handles)
% hObject    handle to Power1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power1 as text
%        str2double(get(hObject,'String')) returns contents of Power1 as a double
On_DW1 = str2double(get(handles.Power1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power1,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power1,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power1','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power2_Callback(hObject, eventdata, handles)
% hObject    handle to Power2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power2 as text
%        str2double(get(hObject,'String')) returns contents of Power2 as a double
On_DW1 = str2double(get(handles.Power2,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power2,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power2,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power2','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Power2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power3_Callback(hObject, eventdata, handles)
% hObject    handle to Power3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power3 as text
%        str2double(get(hObject,'String')) returns contents of Power3 as a double

On_DW1 = str2double(get(handles.Power3,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power3,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power3,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power3','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power4_Callback(hObject, eventdata, handles)
% hObject    handle to Power4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power4 as text
%        str2double(get(hObject,'String')) returns contents of Power4 as a double
On_DW1 = str2double(get(handles.Power4,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power4,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power4,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power4','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Power4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function Power5_Callback(hObject, eventdata, handles)
% hObject    handle to Power5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power5 as text
%        str2double(get(hObject,'String')) returns contents of Power5 as a double

On_DW1 = str2double(get(handles.Power5,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power5,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power5,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power5','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power6_Callback(hObject, eventdata, handles)
% hObject    handle to Power6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power6 as text
%        str2double(get(hObject,'String')) returns contents of Power6 as a double

On_DW1 = str2double(get(handles.Power6,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power6,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power6,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power6','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power7_Callback(hObject, eventdata, handles)
% hObject    handle to Power7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power7 as text
%        str2double(get(hObject,'String')) returns contents of Power7 as a double

On_DW1 = str2double(get(handles.Power7,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power7,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power7,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power7','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power8_Callback(hObject, eventdata, handles)
% hObject    handle to Power8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power8 as text
%        str2double(get(hObject,'String')) returns contents of Power8 as a double
On_DW1 = str2double(get(handles.Power8,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power8,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power8,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power8','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power9_Callback(hObject, eventdata, handles)
% hObject    handle to Power9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power9 as text
%        str2double(get(hObject,'String')) returns contents of Power9 as a double

On_DW1 = str2double(get(handles.Power9,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power9,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power9,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power9','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power10_Callback(hObject, eventdata, handles)
% hObject    handle to Power10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power10 as text
%        str2double(get(hObject,'String')) returns contents of Power10 as a double

On_DW1 = str2double(get(handles.Power10,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power10,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power10,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power10','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power11_Callback(hObject, eventdata, handles)
% hObject    handle to Power11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power11 as text
%        str2double(get(hObject,'String')) returns contents of Power11 as a double

On_DW1 = str2double(get(handles.Power11,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power11,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power11,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power11','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power12_Callback(hObject, eventdata, handles)
% hObject    handle to Power12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power12 as text
%        str2double(get(hObject,'String')) returns contents of Power12 as a double
On_DW1 = str2double(get(handles.Power12,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power12,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power12,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power12','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power13_Callback(hObject, eventdata, handles)
% hObject    handle to Power13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power13 as text
%        str2double(get(hObject,'String')) returns contents of Power13 as a double
On_DW1 = str2double(get(handles.Power13,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power13,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power13,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power13','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power14_Callback(hObject, eventdata, handles)
% hObject    handle to Power14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power14 as text
%        str2double(get(hObject,'String')) returns contents of Power14 as a double
On_DW1 = str2double(get(handles.Power14,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power14,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power14,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power14','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power15_Callback(hObject, eventdata, handles)
% hObject    handle to Power15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power15 as text
%        str2double(get(hObject,'String')) returns contents of Power15 as a double
On_DW1 = str2double(get(handles.Power15,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power15,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power15,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power15','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power16_Callback(hObject, eventdata, handles)
% hObject    handle to Power16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power16 as text
%        str2double(get(hObject,'String')) returns contents of Power16 as a double
On_DW1 = str2double(get(handles.Power16,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power16,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power16,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power16','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power17_Callback(hObject, eventdata, handles)
% hObject    handle to Power17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power17 as text
%        str2double(get(hObject,'String')) returns contents of Power17 as a double
On_DW1 = str2double(get(handles.Power17,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power17,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power17,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power17','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power18_Callback(hObject, eventdata, handles)
% hObject    handle to Power18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power18 as text
%        str2double(get(hObject,'String')) returns contents of Power18 as a double

On_DW1 = str2double(get(handles.Power18,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power18,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power18,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power18','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power19_Callback(hObject, eventdata, handles)
% hObject    handle to Power19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power19 as text
%        str2double(get(hObject,'String')) returns contents of Power19 as a double
On_DW1 = str2double(get(handles.Power19,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power19,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power19,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power19','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power20_Callback(hObject, eventdata, handles)
% hObject    handle to Power20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power20 as text
%        str2double(get(hObject,'String')) returns contents of Power20 as a double

On_DW1 = str2double(get(handles.Power20,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power20,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power20,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power20','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power21_Callback(hObject, eventdata, handles)
% hObject    handle to Power21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power21 as text
%        str2double(get(hObject,'String')) returns contents of Power21 as a double

On_DW1 = str2double(get(handles.Power21,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power21,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power21,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power21','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power22_Callback(hObject, eventdata, handles)
% hObject    handle to Power22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power22 as text
%        str2double(get(hObject,'String')) returns contents of Power22 as a double

On_DW1 = str2double(get(handles.Power22,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power22,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power22,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power22','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power23_Callback(hObject, eventdata, handles)
% hObject    handle to Power23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power23 as text
%        str2double(get(hObject,'String')) returns contents of Power23 as a double

On_DW1 = str2double(get(handles.Power23,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power23,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power23,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power23','Value',num2str(On_DW1));
% --- Executes during object creation, after setting all properties.
function Power23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power24_Callback(hObject, eventdata, handles)
% hObject    handle to Power24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power24 as text
%        str2double(get(hObject,'String')) returns contents of Power24 as a double
On_DW1 = str2double(get(handles.Power24,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power24,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power24,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power24','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power25_Callback(hObject, eventdata, handles)
% hObject    handle to Power25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power25 as text
%        str2double(get(hObject,'String')) returns contents of Power25 as a double
On_DW1 = str2double(get(handles.Power25,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power25,'String',[]);
    return
end
if On_DW1<-inf || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power25,'String',[]);
    return
end
set_param('Energy_Cost/Battery/Power25','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Power25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

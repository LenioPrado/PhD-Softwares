function varargout = Wind(varargin)
% Wind MATLAB code for Wind.fig
%      Wind, by itself, creates a new Wind or raises the existing
%      singleton*.
%
%      H = Wind returns the handle to a new Wind or the handle to
%      the existing singleton*.
%
%      Wind('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Wind.M with the given input arguments.
%
%      Wind('Property','Value',...) creates a new Wind or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind

% Last Modified by GUIDE v2.5 23-Jan-2013 18:49:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_OutputFcn, ...
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





% --- Executes just before Wind is made visible.
function Wind_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind (see VARARGIN)

% Choose default command line output for Wind
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wind wait for user response (see UIRESUME)
% uiwait(handles.figure1);


set_param('Energy_Cost/Wind/WD_OnOff','Value',num2str(1)); 
set_param('Energy_Cost/Wind/Power1','Value',num2str(2965));
set_param('Energy_Cost/Wind/Power2','Value',num2str(4220));
set_param('Energy_Cost/Wind/Power3','Value',num2str(2825));
set_param('Energy_Cost/Wind/Power4','Value',num2str(4555));
set_param('Energy_Cost/Wind/Power5','Value',num2str(3220));
set_param('Energy_Cost/Wind/Power6','Value',num2str(3711));
set_param('Energy_Cost/Wind/Power7','Value',num2str(2430));
set_param('Energy_Cost/Wind/Power8','Value',num2str(2000));
set_param('Energy_Cost/Wind/Power9','Value',num2str(2650));
set_param('Energy_Cost/Wind/Power10','Value',num2str(1700));
set_param('Energy_Cost/Wind/Power11','Value',num2str(2440));
set_param('Energy_Cost/Wind/Power12','Value',num2str(2250));
set_param('Energy_Cost/Wind/Power13','Value',num2str(2680));
set_param('Energy_Cost/Wind/Power14','Value',num2str(3100));
set_param('Energy_Cost/Wind/Power15','Value',num2str(4500));
set_param('Energy_Cost/Wind/Power16','Value',num2str(5150));
set_param('Energy_Cost/Wind/Power17','Value',num2str(4550));
set_param('Energy_Cost/Wind/Power18','Value',num2str(3200));
set_param('Energy_Cost/Wind/Power19','Value',num2str(4100));
set_param('Energy_Cost/Wind/Power20','Value',num2str(3600));
set_param('Energy_Cost/Wind/Power21','Value',num2str(4000));
set_param('Energy_Cost/Wind/Power22','Value',num2str(2600));
set_param('Energy_Cost/Wind/Power23','Value',num2str(5220));
set_param('Energy_Cost/Wind/Power24','Value',num2str(3600));

% --- Outputs from this function are returned to the command line.
function varargout = Wind_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('Wind1.jpg','jpg');
image(x),colormap(map),axis off,hold on


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in HelpWind.
function HelpWind_Callback(hObject, eventdata, handles)
% hObject    handle to HelpWind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
find_system('Name','Help_Wind.fig');
run('Help_Wind');


% --- Executes on button press in ContinueWind.
function ContinueWind_Callback(hObject, eventdata, handles)
% hObject    handle to ContinueWind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save('Wind')
close('Wind')

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on selection change in Cell_numbers.
function Cell_numbers_Callback(hObject, eventdata, handles)
% hObject    handle to Cell_numbers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Cell_numbers contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Cell_numbers
Cell_numbers = get(handles.Cell_numbers,'Value')
set_param('Energy_Cost/PV/Cell_numbers','Value',num2str(Cell_numbers));

% --- Executes during object creation, after setting all properties.
function Cell_numbers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cell_numbers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power1,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power1','Value',num2str(On_DW1));


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
    set(handles.Power1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power2,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power2','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power3,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power3','Value',num2str(On_DW1));


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

On_DW1 = str2double(get(handles.Power1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Power1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power4,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power4','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power5,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power5','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power6,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power6','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power7,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power7','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power8,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power8','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power9,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power9','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power10,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power10','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power11,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power11','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power12,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power12','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power13,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power13','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power14,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power14','Value',num2str(On_DW1));

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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power15,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power15','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power16,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power16','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power17,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power17','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power18,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power18','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power19,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power19','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power20,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power20','Value',num2str(On_DW1));

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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power21,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power21','Value',num2str(On_DW1));


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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power22,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power22','Value',num2str(On_DW1));

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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power23,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power23','Value',num2str(On_DW1));

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
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Power24,'String',[]);
    return
end
set_param('Energy_Cost/Wind/Power24','Value',num2str(On_DW1));


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

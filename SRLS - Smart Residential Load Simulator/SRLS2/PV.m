function varargout = PV(varargin)
% PV MATLAB code for PV.fig
%      PV, by itself, creates a new PV or raises the existing
%      singleton*.
%
%      H = PV returns the handle to a new PV or the handle to
%      the existing singleton*.
%
%      PV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PV.M with the given input arguments.
%
%      PV('Property','Value',...) creates a new PV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PV

% Last Modified by GUIDE v2.5 21-Jan-2013 18:25:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PV_OpeningFcn, ...
                   'gui_OutputFcn',  @PV_OutputFcn, ...
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





% --- Executes just before PV is made visible.
function PV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PV (see VARARGIN)

% Choose default command line output for PV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


set_param('Energy_Cost/PV/PV_OnOff','Value',num2str(1)); %PV off
set_param('Energy_Cost/PV/Radiation1','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation2','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation3','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation4','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation5','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation6','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation7','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation8','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation9','Value',num2str(25.85));
set_param('Energy_Cost/PV/Radiation10','Value',num2str(74.18));
set_param('Energy_Cost/PV/Radiation11','Value',num2str(195.32));
set_param('Energy_Cost/PV/Radiation12','Value',num2str(281.63));
set_param('Energy_Cost/PV/Radiation13','Value',num2str(453.22));
set_param('Energy_Cost/PV/Radiation14','Value',num2str(425.31));
set_param('Energy_Cost/PV/Radiation15','Value',num2str(556.11));
set_param('Energy_Cost/PV/Radiation16','Value',num2str(445.22));
set_param('Energy_Cost/PV/Radiation17','Value',num2str(485.13));
set_param('Energy_Cost/PV/Radiation18','Value',num2str(360.17));
set_param('Energy_Cost/PV/Radiation19','Value',num2str(253));
set_param('Energy_Cost/PV/Radiation20','Value',num2str(126.11));
set_param('Energy_Cost/PV/Radiation21','Value',num2str(33.25));
set_param('Energy_Cost/PV/Radiation22','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation23','Value',num2str(0));
set_param('Energy_Cost/PV/Radiation24','Value',num2str(0));

% --- Outputs from this function are returned to the command line.
function varargout = PV_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1)
[x,map]=imread('PV.1.jpg','jpg');
image(x),colormap(map),axis off,hold on


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in HelpPV.
function HelpPV_Callback(hObject, eventdata, handles)
% hObject    handle to HelpPV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
find_system('Name','Help_PV.fig');
run('Help_PV');


% --- Executes on button press in ContinuePV.
function ContinuePV_Callback(hObject, eventdata, handles)
% hObject    handle to ContinuePV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save('PV')
close('PV')

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



function Rad1_Callback(hObject, eventdata, handles)
% hObject    handle to Rad1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad1 as text
%        str2double(get(hObject,'String')) returns contents of Rad1 as a double
On_DW1 = str2double(get(handles.Rad1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad1,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation1','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad2_Callback(hObject, eventdata, handles)
% hObject    handle to Rad2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad2 as text
%        str2double(get(hObject,'String')) returns contents of Rad2 as a double
On_DW1 = str2double(get(handles.Rad2,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad2,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation2','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad3_Callback(hObject, eventdata, handles)
% hObject    handle to Rad3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad3 as text
%        str2double(get(hObject,'String')) returns contents of Rad3 as a double

On_DW1 = str2double(get(handles.Rad3,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad3,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad3,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation3','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad4_Callback(hObject, eventdata, handles)
% hObject    handle to Rad4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad4 as text
%        str2double(get(hObject,'String')) returns contents of Rad4 as a double

On_DW1 = str2double(get(handles.Rad1,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad1,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad4,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation4','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad5_Callback(hObject, eventdata, handles)
% hObject    handle to Rad5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad5 as text
%        str2double(get(hObject,'String')) returns contents of Rad5 as a double
On_DW1 = str2double(get(handles.Rad5,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad5,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad5,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation5','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad6_Callback(hObject, eventdata, handles)
% hObject    handle to Rad6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad6 as text
%        str2double(get(hObject,'String')) returns contents of Rad6 as a double

On_DW1 = str2double(get(handles.Rad6,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad6,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad6,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation6','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad7_Callback(hObject, eventdata, handles)
% hObject    handle to Rad7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad7 as text
%        str2double(get(hObject,'String')) returns contents of Rad7 as a double

On_DW1 = str2double(get(handles.Rad7,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad7,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad7,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation7','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad8_Callback(hObject, eventdata, handles)
% hObject    handle to Rad8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad8 as text
%        str2double(get(hObject,'String')) returns contents of Rad8 as a double
On_DW1 = str2double(get(handles.Rad8,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad8,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad8,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation8','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad9_Callback(hObject, eventdata, handles)
% hObject    handle to Rad9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad9 as text
%        str2double(get(hObject,'String')) returns contents of Rad9 as a double

On_DW1 = str2double(get(handles.Rad9,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad9,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad9,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation9','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad10_Callback(hObject, eventdata, handles)
% hObject    handle to Rad10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad10 as text
%        str2double(get(hObject,'String')) returns contents of Rad10 as a double

On_DW1 = str2double(get(handles.Rad10,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad10,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad10,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation10','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad11_Callback(hObject, eventdata, handles)
% hObject    handle to Rad11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad11 as text
%        str2double(get(hObject,'String')) returns contents of Rad11 as a double

On_DW1 = str2double(get(handles.Rad11,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad11,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad11,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation11','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad12_Callback(hObject, eventdata, handles)
% hObject    handle to Rad12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad12 as text
%        str2double(get(hObject,'String')) returns contents of Rad12 as a double

On_DW1 = str2double(get(handles.Rad12,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad12,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad12,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation12','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad13_Callback(hObject, eventdata, handles)
% hObject    handle to Rad13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad13 as text
%        str2double(get(hObject,'String')) returns contents of Rad13 as a double

On_DW1 = str2double(get(handles.Rad13,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad13,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad13,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation13','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad14_Callback(hObject, eventdata, handles)
% hObject    handle to Rad14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad14 as text
%        str2double(get(hObject,'String')) returns contents of Rad14 as a double

On_DW1 = str2double(get(handles.Rad14,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad14,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad14,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation14','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Rad14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad15_Callback(hObject, eventdata, handles)
% hObject    handle to Rad15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad15 as text
%        str2double(get(hObject,'String')) returns contents of Rad15 as a double

On_DW1 = str2double(get(handles.Rad15,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad15,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad15,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation15','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad16_Callback(hObject, eventdata, handles)
% hObject    handle to Rad16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad16 as text
%        str2double(get(hObject,'String')) returns contents of Rad16 as a double

On_DW1 = str2double(get(handles.Rad16,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad16,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad16,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation16','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad17_Callback(hObject, eventdata, handles)
% hObject    handle to Rad17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad17 as text
%        str2double(get(hObject,'String')) returns contents of Rad17 as a double

On_DW1 = str2double(get(handles.Rad17,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad17,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad17,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation17','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad18_Callback(hObject, eventdata, handles)
% hObject    handle to Rad18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad18 as text
%        str2double(get(hObject,'String')) returns contents of Rad18 as a double

On_DW1 = str2double(get(handles.Rad18,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad18,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad18,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation18','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad19_Callback(hObject, eventdata, handles)
% hObject    handle to Rad19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad19 as text
%        str2double(get(hObject,'String')) returns contents of Rad19 as a double

On_DW1 = str2double(get(handles.Rad19,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad19,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad19,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation19','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad20_Callback(hObject, eventdata, handles)
% hObject    handle to Rad20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad20 as text
%        str2double(get(hObject,'String')) returns contents of Rad20 as a double

On_DW1 = str2double(get(handles.Rad20,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad20,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad20,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation20','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Rad20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad21_Callback(hObject, eventdata, handles)
% hObject    handle to Rad21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad21 as text
%        str2double(get(hObject,'String')) returns contents of Rad21 as a double

On_DW1 = str2double(get(handles.Rad21,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad21,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad21,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation21','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad22_Callback(hObject, eventdata, handles)
% hObject    handle to Rad22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad22 as text
%        str2double(get(hObject,'String')) returns contents of Rad22 as a double

On_DW1 = str2double(get(handles.Rad22,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad22,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad22,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation22','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Rad22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad23_Callback(hObject, eventdata, handles)
% hObject    handle to Rad23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad23 as text
%        str2double(get(hObject,'String')) returns contents of Rad23 as a double

On_DW1 = str2double(get(handles.Rad23,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad23,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad23,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation23','Value',num2str(On_DW1));

% --- Executes during object creation, after setting all properties.
function Rad23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rad24_Callback(hObject, eventdata, handles)
% hObject    handle to Rad24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rad24 as text
%        str2double(get(hObject,'String')) returns contents of Rad24 as a double

On_DW1 = str2double(get(handles.Rad24,'String'));
if isempty(On_DW1) ||isnan(On_DW1)
    errordlg('Please enter an integer value');
    set(handles.Rad24,'String',[]);
    return
end
if On_DW1<0 || On_DW1>=inf
    errordlg('Please enter a value between 0-24 hrs');
    set(handles.Rad24,'String',[]);
    return
end
set_param('Energy_Cost/PV/Radiation24','Value',num2str(On_DW1));


% --- Executes during object creation, after setting all properties.
function Rad24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rad24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

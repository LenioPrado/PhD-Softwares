function varargout = Family(varargin)
% FAMILY MATLAB code for Family.fig
%      FAMILY, by itself, creates a new FAMILY or raises the existing
%      singleton*.
%
%      H = FAMILY returns the handle to a new FAMILY or the handle to
%      the existing singleton*.
%
%      FAMILY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAMILY.M with the given input arguments.
%
%      FAMILY('Property','Value',...) creates a new FAMILY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Family_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Family_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Family

% Last Modified by GUIDE v2.5 06-Feb-2012 12:00:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Family_OpeningFcn, ...
                   'gui_OutputFcn',  @Family_OutputFcn, ...
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


% --- Executes just before Family is made visible.
function Family_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Family (see VARARGIN)

% Choose default command line output for Family
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Family wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Family_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function per_Callback(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of per as text
%        str2double(get(hObject,'String')) returns contents of per as a double


% --- Executes during object creation, after setting all properties.
function per_CreateFcn(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
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


% --- Executes on selection change in athome.
function athome_Callback(hObject, eventdata, handles)
% hObject    handle to athome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns athome contents as cell array
%        contents{get(hObject,'Value')} returns selected item from athome


% --- Executes during object creation, after setting all properties.
function athome_CreateFcn(hObject, eventdata, handles)
% hObject    handle to athome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in senior.
function senior_Callback(hObject, eventdata, handles)
% hObject    handle to senior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns senior contents as cell array
%        contents{get(hObject,'Value')} returns selected item from senior


% --- Executes during object creation, after setting all properties.
function senior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to senior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in no_pay.
function no_pay_Callback(hObject, eventdata, handles)
% hObject    handle to no_pay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns no_pay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from no_pay


% --- Executes during object creation, after setting all properties.
function no_pay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_pay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in no_cw.
function no_cw_Callback(hObject, eventdata, handles)
% hObject    handle to no_cw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns no_cw contents as cell array
%        contents{get(hObject,'Value')} returns selected item from no_cw


% --- Executes during object creation, after setting all properties.
function no_cw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_cw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function age1_Callback(hObject, eventdata, handles)
% hObject    handle to age1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of age1 as text
%        str2double(get(hObject,'String')) returns contents of age1 as a double


% --- Executes during object creation, after setting all properties.
function age1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to age1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function age2_Callback(hObject, eventdata, handles)
% hObject    handle to age2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of age2 as text
%        str2double(get(hObject,'String')) returns contents of age2 as a double


% --- Executes during object creation, after setting all properties.
function age2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to age2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function age3_Callback(hObject, eventdata, handles)
% hObject    handle to age3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of age3 as text
%        str2double(get(hObject,'String')) returns contents of age3 as a double


% --- Executes during object creation, after setting all properties.
function age3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to age3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



per = str2double(get(handles.per,'String'));
age1 = str2double(get(handles.age1,'String'));
age2 = str2double(get(handles.age2,'String'));
age3 = str2double(get(handles.age3,'String'));


%Check the input values.
if isempty(per) ||isnan(per)
    errordlg('Please enter an integer value for the number of persons in the household');
    set(handles.per,'String',1);
    return
end
if isempty(age1) ||isnan(age1)
    errordlg('Please enter an integer value of number of preschool children (0-5yrs)');
    set(handles.age1,'String',1);
    return
end
if isempty(age2) ||isnan(age2)
    errordlg('Please enter an integer value of number of school children (6-13yrs)');
    set(handles.age2,'String',1);
    return
end
if isempty(age3) ||isnan(age3)
    errordlg('Please enter an integer value of number of adults of 14 yrs and over');
    set(handles.age3,'String',1);
    return
end

set(handles.per,'String',num2str(per))
set(handles.age1,'String',num2str(age1))
set(handles.age2,'String',num2str(age2))
set(handles.age3,'String',num2str(age3))


athome = get(handles.athome,'Value');
no_dw = get(handles.no_dw,'Value');
no_cw = get(handles.no_cw,'Value');
senior = get(handles.senior,'Value');


global per age_1 age_2 age_3 athome no_dw no_cw senior



save('Family')
close('Family')


% --- Executes on selection change in no_dw.
function no_dw_Callback(hObject, eventdata, handles)
% hObject    handle to no_dw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns no_dw contents as cell array
%        contents{get(hObject,'Value')} returns selected item from no_dw


% --- Executes during object creation, after setting all properties.
function no_dw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_dw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

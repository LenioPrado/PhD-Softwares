function varargout = Temperatures1(varargin)
% TEMPERATURES1 MATLAB code for Temperatures1.fig
%      TEMPERATURES1, by itself, creates a new TEMPERATURES1 or raises the existing
%      singleton*.
%
%      H = TEMPERATURES1 returns the handle to a new TEMPERATURES1 or the handle to
%      the existing singleton*.
%
%      TEMPERATURES1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPERATURES1.M with the given input arguments.
%
%      TEMPERATURES1('Property','Value',...) creates a new TEMPERATURES1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temperatures1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temperatures1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temperatures1

% Last Modified by GUIDE v2.5 19-Mar-2012 08:22:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temperatures1_OpeningFcn, ...
                   'gui_OutputFcn',  @Temperatures1_OutputFcn, ...
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


% --- Executes just before Temperatures1 is made visible.
function Temperatures1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temperatures1 (see VARARGIN)

% Choose default command line output for Temperatures1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temperatures1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
filas =10;
columnas = 1;
num_elem = cell(filas,columnas);
% num_elem(:,:)={''};
num_elem(1,1)={'0:00'};
num_elem(2,1)={'1:00'};
num_elem(3,1)={'2:00'};
num_elem(4,1)={'3:00'};
num_elem(5,1)={'4:00'};
num_elem(6,1)={'5:00'};
num_elem(7,1)={'6:00'};
num_elem(8,1)={'7:00'};
num_elem(9,1)={'8:00'};
num_elem(10,1)={'9:00'};
num_elem(11,1)={'10:00'};
num_elem(12,1)={'11:00'};
num_elem(13,1)={'12:00'};
num_elem(14,1)={'13:00'};
num_elem(15,1)={'14:00'};
num_elem(16,1)={'15:00'};
num_elem(17,1)={'16:00'};
num_elem(18,1)={'17:00'};
num_elem(19,1)={'18:00'};
num_elem(20,1)={'19:00'};
num_elem(21,1)={'20:00'};
num_elem(22,1)={'21:00'};
num_elem(23,1)={'22:00'};
num_elem(24,1)={'23:00'};


set(handles.uitable1,'Data',num_elem)
set(handles.uitable1,'ColumnEditable',false(1,columnas))

set(handles.uitable2,'Data',num_elem)
set(handles.uitable2,'ColumnEditable',false(1,columnas))

% --- Outputs from this function are returned to the command line.
function varargout = Temperatures1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_filas_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filas as text
%        str2double(get(hObject,'String')) returns contents of edit_filas as a double


% --- Executes during object creation, after setting all properties.
function edit_filas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_col_Callback(hObject, eventdata, handles)
% hObject    handle to edit_col (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_col as text
%        str2double(get(hObject,'String')) returns contents of edit_col as a double


% --- Executes during object creation, after setting all properties.
function edit_col_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_col (see GCBO)
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

% filas =str2double(get(handles.edit_filas,'String'));
% columnas = str2double(get(handles.edit_col,'String'));
% num_elem = cell(filas,columnas);
% num_elem(:,:)={''};
% set(handles.uitable1,'Data',num_elem)
% set(handles.uitable1,'ColumnEditable',true(1,columnas))




% filas =10;
% columnas = 1;
% num_elem = cell(filas,columnas);
% % num_elem(:,:)={''};
% num_elem(1,1)={'Lights'};
% num_elem(2,1)={'Furnace'};
% num_elem(3,1)={'Air Conditioner'};
% num_elem(4,1)={'Fridge'};
% num_elem(5,1)={'Range'};
% num_elem(6,1)={'Water Heater'};
% num_elem(7,1)={'Washer'};
% num_elem(8,1)={'Dish washer'};
% num_elem(9,1)={'Dryer'};
% num_elem(10,1)={'asd'};
% 
% set(handles.uitable1,'Data',num_elem)
% set(handles.uitable1,'ColumnEditable',false(1,columnas))


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get(hobjet.uitable1,'Data',num_elem)
% filas =get(hObject.uitable1,'cell')
% set(handles.uitable1,'ColumnEditable',false(1,columnas))
% a = cell2mat(get(handles.uitable1,'Data'))


% cost1 = (get(handles.uitable1,'Selected'))
% cost1 = (get(handles.uitable1,'array'))
% mwlimits1 = cell2mat(get(handles.uitable2,'Data'))
% Pdt = str2num(get(handles.input3_editText,'String'))




% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% filas =get(hObject,'Value')

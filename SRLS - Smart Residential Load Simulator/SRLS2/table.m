function varargout = table(varargin)
% TABLE MATLAB code for table.fig
%      TABLE, by itself, creates a new TABLE or raises the existing
%      singleton*.
%
%      H = TABLE returns the handle to a new TABLE or the handle to
%      the existing singleton*.
%
%      TABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLE.M with the given input arguments.
%
%      TABLE('Property','Value',...) creates a new TABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before table_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to table_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help table

% Last Modified by GUIDE v2.5 03-Mar-2012 01:16:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @table_OpeningFcn, ...
                   'gui_OutputFcn',  @table_OutputFcn, ...
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


% --- Executes just before table is made visible.
function table_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to table (see VARARGIN)

% Choose default command line output for table
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes table wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = table_OutputFcn(hObject, eventdata, handles) 
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

filas =10;
columnas = 1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'Lights'};
num_elem(2,1)={'Furnace'};
num_elem(3,1)={'Air Conditioner'};
num_elem(4,1)={'Fridge'};
num_elem(5,1)={'Range'};
num_elem(6,1)={'Water Heater'};
num_elem(7,1)={'Washer'};
num_elem(8,1)={'Dish washer'};
num_elem(9,1)={'Dryer'};
num_elem(10,1)={'asd'};

set(handles.Cost,'Data',num_elem)
set(handles.Cost,'ColumnEditable',false(1,columnas))



% --- Executes on selection change in cost1.
function cost1_Callback(hObject, eventdata, handles)
% hObject    handle to cost1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cost1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cost1


% --- Executes during object creation, after setting all properties.
function cost1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cost1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in zoom_on.
function zoom_on_Callback(hObject, eventdata, handles)
% hObject    handle to zoom_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of zoom_on
a=get(handles.zoom_on,'Value');
if a==1
    zoom on;
    set(handles.zoom_on,'String','ZOOM ON');
else
    zoom off;
    set(handles.zoom_on,'String','ZOOM OFF');
end



% --- Executes when entered data in editable cell(s) in Cost.
function Cost_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Cost (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Grid.
function Grid_Callback(hObject, eventdata, handles)
% hObject    handle to Grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% Hint: get(hObject,'Value') returns toggle state of Grid
a=get(handles.Grid,'Value');
if a==1
    grid on;
    set(handles.Grid,'String','Grid ON');
else
    grid off;
    set(handles.Grid,'String','Grid OFF');
end

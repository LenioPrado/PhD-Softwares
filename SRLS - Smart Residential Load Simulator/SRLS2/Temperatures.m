function varargout = Temperatures(varargin)
% TEMPERATURES MATLAB code for Temperatures.fig
%      TEMPERATURES, by itself, creates a new TEMPERATURES or raises the existing
%      singleton*.
%
%      H = TEMPERATURES returns the handle to a new TEMPERATURES or the handle to
%      the existing singleton*.
%
%      TEMPERATURES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPERATURES.M with the given input arguments.
%
%      TEMPERATURES('Property','Value',...) creates a new TEMPERATURES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temperatures_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temperatures_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temperatures

% Last Modified by GUIDE v2.5 19-Mar-2012 12:15:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temperatures_OpeningFcn, ...
                   'gui_OutputFcn',  @Temperatures_OutputFcn, ...
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


% --- Executes just before Temperatures is made visible.
function Temperatures_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temperatures (see VARARGIN)

% Choose default command line output for Temperatures
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temperatures wait for user response (see UIRESUME)
% uiwait(handles.figure1);
filas =24;
columnas = 2;
num_elem = cell(filas,columnas);
set(handles.uitable1, 'ColumnEditable', [false true]);
complexData  = { ...
'0:00'  23;...
'1:00'  24;...
'2:00'  25;...
'3:00'  26;...
'4:00'  26;...
'5:00'  26;...
'6:00'  26;...
'7:00'  27;...
'8:00'  27;
'9:00'      27;...
'10:00'     27;...
'11:00'     30;...
'12:00'     30;...
'13:00'     31;...
'14:00'     32;...
'15:00'     32;...
'16:00'     32;...
'17:00'     33;...
'18:00'     33;...
'19:00'     28;...
'20:00'     28;...
'21:00'     28;...
'22:00'     26;...
'23:00'     26;...
};
set(handles.uitable1, 'Data', complexData);
% Temp = get(handles.uitable1, 'Data');
% Temp = cell2mat(Temp(:,2))
set(handles.uitable1, 'CellEditCallback', @AgeVerificationCallback);
Temp = get(handles.uitable1, 'Data');
Temp = cell2mat(Temp(:,2));

axes(handles.axes1)
plot(Temp);
axis([0 24 0 45]);
xlabel('Time (hrs)');
ylabel('Temperature ^o C');
title('Outside temperature');


% --- Outputs from this function are returned to the command line.
function varargout = Temperatures_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






% --- Executes on button press in plotNew.
function plotNew_Callback(hObject, eventdata, handles)
% hObject    handle to plotNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% filas =str2double(get(handles.edit_filas,'String'));
% columnas = str2double(get(handles.edit_col,'String'));
% num_elem = cell(filas,columnas);
% num_elem(:,:)={''};
% set(handles.uitable1,'Data',num_elem)
% set(handles.uitable1,'ColumnEditable',true(1,columnas))

% set(handles.uitable1, 'Data', complexData);
% Temp = get(handles.uitable1, 'Data');
% Temp = cell2mat(Temp(:,2))
% set(handles.uitable1, 'CellEditCallback', @AgeVerificationCallback);
Temp = get(handles.uitable1, 'Data')
Temp = cell2mat(Temp(:,2));

axes(handles.axes1)
plot(Temp);
axis([0 24 0 45]);
xlabel('Time (hrs)');
ylabel('Temperature ^o C');
title('Outside temperature')




% --- Executes on button press in Grid.
function Grid_Callback(hObject, eventdata, handles)
% hObject    handle to Grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Grid

a=get(handles.Grid,'Value');
if a==1
    grid on;
    set(handles.Grid,'String','Grid on');
else
    grid off;
    set(handles.Grid,'String','Grid off');
end

% --- Executes on button press in zoom.
function zoom_Callback(hObject, eventdata, handles)
% hObject    handle to zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of zoom
a=get(handles.zoom,'Value');
if a==1
    zoom on;
    set(handles.zoom,'String','Zoom on');
else
    zoom off;
    set(handles.zoom,'String','Zoom off');
end


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


% --- Executes on button press in Continue.
function Continue_Callback(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Temp = get(handles.uitable1, 'Data')
Temp = cell2mat(Temp(:,2));
save Temp.mat



save('Temperatures')
close('Temperatures')
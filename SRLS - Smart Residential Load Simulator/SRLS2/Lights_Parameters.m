function varargout = Lights_Parameters(varargin)
% LIGHTS_PARAMETERS MATLAB code for Lights_Parameters.fig
%      LIGHTS_PARAMETERS, by itself, creates a new LIGHTS_PARAMETERS or raises the existing
%      singleton*.
%
%      H = LIGHTS_PARAMETERS returns the handle to a new LIGHTS_PARAMETERS or the handle to
%      the existing singleton*.
%
%      LIGHTS_PARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHTS_PARAMETERS.M with the given input arguments.
%
%      LIGHTS_PARAMETERS('Property','Value',...) creates a new LIGHTS_PARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lights_Parameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lights_Parameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lights_Parameters

% Last Modified by GUIDE v2.5 22-Feb-2012 13:36:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lights_Parameters_OpeningFcn, ...
                   'gui_OutputFcn',  @Lights_Parameters_OutputFcn, ...
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


% --- Executes just before Lights_Parameters is made visible.
function Lights_Parameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lights_Parameters (see VARARGIN)

% Choose default command line output for Lights_Parameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lights_Parameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes1)
background = imread('Incandescent_Bulb.jpg');
axis off;
imshow(background);


axes(handles.axes2)
background = imread('CFL_lighting.jpg');
axis off;
imshow(background);

axes(handles.axes3)
background = imread('Fluorescent_Tube.jpg');
axis off;
imshow(background);


% --- Outputs from this function are returned to the command line.
function varargout = Lights_Parameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function hrs_Morning_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Morning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Morning as text
%        str2double(get(hObject,'String')) returns contents of hrs_Morning as a double
hrs_Morning = str2double(get(handles.hrs_Morning,'String'));
%Check the input values.
if isempty(hrs_Morning) ||isnan(hrs_Morning)
    errordlg('Please enter an integer value for the power-on hours when incandescent bulbs are used on morning');
    set(handles.hrs_Morning,'String',0);
    return
end
if hrs_Morning<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Morning,'String',0);
    return
elseif hrs_Morning>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Morning,'String',12);
    return
end
set(handles.hrs_Morning,'String',num2str(hrs_Morning))
set_param('Energy_Cost/Lighting/hrs_Morning','Value',num2str(hrs_Morning));



% --- Executes during object creation, after setting all properties.
function hrs_Morning_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Morning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Morning_Callback(hObject, eventdata, handles)
% hObject    handle to On_Morning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Morning as text
%        str2double(get(hObject,'String')) returns contents of On_Morning as a double

On_Morning = str2double(get(handles.On_Morning,'String'));
if isempty(On_Morning) ||isnan(On_Morning)
    errordlg('Please enter an integer value for the time when incandescent bulbs are turned on during morning');
    set(handles.On_Morning,'String',0);
    return
end
if On_Morning<0
    errordlg('Negative values not allowed ');
    set(handles.On_Morning,'String',0);
    return
elseif On_Morning>12
    errordlg('Morning is considered from 0:00am to 12:00pm');
    set(handles.On_Morning,'String',0);
    return
end


set(handles.On_Morning,'String',num2str(On_Morning))
set_param('Energy_Cost/Lighting/ON_Morning','Value',num2str(On_Morning));




% --- Executes during object creation, after setting all properties.
function On_Morning_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Morning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrs_Night_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Night (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Night as text
%        str2double(get(hObject,'String')) returns contents of hrs_Night as a double

hrs_Night = str2double(get(handles.hrs_Night,'String'));
if isempty(hrs_Night) ||isnan(hrs_Night)
    errordlg('Please enter an integer value for the power-on hours when incandescent bulbs are used on night');
    set(handles.hrs_Night,'String',0);
    return
end
if hrs_Night<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Night,'String',0);
    return
elseif hrs_Night>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Night,'String',12);
    return
end

set(handles.hrs_Night,'String',num2str(hrs_Night))
set_param('Energy_Cost/Lighting/hrs_Night','Value',num2str(hrs_Night));




% --- Executes during object creation, after setting all properties.
function hrs_Night_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Night (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Night_Callback(hObject, eventdata, handles)
% hObject    handle to On_Night (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Night as text
%        str2double(get(hObject,'String')) returns contents of On_Night as a double

On_Night = str2double(get(handles.On_Night,'String'));
if isempty(On_Night) ||isnan(On_Night)
    errordlg('Please enter an integer value for the time when incandescent bulbs are turned on during night');
    set(handles.On_Night,'String',0);
    return
end
if On_Night<0
    errordlg('Negative values not allowed ');
    set(handles.On_night,'String',0);
    return
elseif On_Night>24
    errordlg('Night is considered until 24hrs');
    set(handles.On_Night,'String',0);
    return
end


set(handles.On_Night,'String',num2str(On_Night))
set_param('Energy_Cost/Lighting/ON_Night','Value',num2str(On_Night));




% --- Executes during object creation, after setting all properties.
function On_Night_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Night (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power_Callback(hObject, eventdata, handles)
% hObject    handle to Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power as text
%        str2double(get(hObject,'String')) returns contents of Power as a double


% --- Executes during object creation, after setting all properties.
function Power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function H_Many_Callback(hObject, eventdata, handles)
% hObject    handle to H_Many (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of H_Many as text
%        str2double(get(hObject,'String')) returns contents of H_Many as a double
H_Many = str2double(get(handles.H_Many,'String'));
if isempty(H_Many) ||isnan(H_Many)
    errordlg('Please enter an integer value of how many incandescent bulbs are used');
    set(handles.H_Many,'String',0);
    return
end
set(handles.H_Many,'String',num2str(H_Many))
set_param('Energy_Cost/Lighting/H_Many','Value',num2str(H_Many));


% --- Executes during object creation, after setting all properties.
function H_Many_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_Many (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function hrs_Morning_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Morning_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Morning_CFL as text
%        str2double(get(hObject,'String')) returns contents of hrs_Morning_CFL as a double

hrs_Morning_CFL = str2double(get(handles.hrs_Morning_CFL,'String'));
%Check the input values.
if isempty(hrs_Morning_CFL) ||isnan(hrs_Morning_CFL)
    errordlg('Please enter an integer value for the power-on hours when CLFs are used on morning');
    set(handles.hrs_Morning_CFL,'String',0);
    return
end

if hrs_Morning_CFL<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Morning_CFL,'String',0);
    return
elseif hrs_Morning_CFL>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Morning_CFL,'String',12);
    return
end

set(handles.hrs_Morning_CFL,'String',num2str(hrs_Morning_CFL))
set_param('Energy_Cost/Lighting/hrs_Morning_CFL','Value',num2str(hrs_Morning_CFL));




% --- Executes during object creation, after setting all properties.
function hrs_Morning_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Morning_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Morning_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to On_Morning_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Morning_CFL as text
%        str2double(get(hObject,'String')) returns contents of On_Morning_CFL as a double
On_Morning_CFL = str2double(get(handles.On_Morning_CFL,'String'));
if isempty(On_Morning_CFL) ||isnan(On_Morning_CFL)
    errordlg('Please enter an integer value for the time when CFLs are turned on during morning');
    set(handles.On_Morning_CFL,'String',0);
    return
end
if On_Morning_CFL<0
    errordlg('Negative values not allowed ');
    set(handles.On_Morning_CFL,'String',0);
    return
elseif On_Morning_CFL>12
    errordlg('Morning is considered from 0:00am to 12:00pm');
    set(handles.On_Morning_CFL,'String',0);
    return
end
set(handles.On_Morning_CFL,'String',num2str(On_Morning_CFL))
set_param('Energy_Cost/Lighting/ON_Morning_CFL','Value',num2str(On_Morning_CFL));



% --- Executes during object creation, after setting all properties.
function On_Morning_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Morning_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrs_Night_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Night_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Night_CFL as text
%        str2double(get(hObject,'String')) returns contents of hrs_Night_CFL as a double
hrs_Night_CFL = str2double(get(handles.hrs_Night_CFL,'String'));
if isempty(hrs_Night_CFL) ||isnan(hrs_Night_CFL)
    errordlg('Please enter an integer value for the power-on hours when CFLs are used on night');
    set(handles.hrs_Night_CFL,'String',0);
    return
end
if hrs_Night_CFL<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Night_CFL,'String',0);
    return
elseif hrs_Night_CFL>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Night_CFL,'String',12);
    return
end

set(handles.hrs_Night_CFL,'String',num2str(hrs_Night_CFL))
set_param('Energy_Cost/Lighting/hrs_Night_CFL','Value',num2str(hrs_Night_CFL));



% --- Executes during object creation, after setting all properties.
function hrs_Night_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Night_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Night_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to On_Night_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Night_CFL as text
%        str2double(get(hObject,'String')) returns contents of On_Night_CFL as a double
On_Night_CFL = str2double(get(handles.On_Night_CFL,'String'));
if isempty(On_Night_CFL) ||isnan(On_Night_CFL)
    errordlg('Please enter an integer value for the time when CFLs are turned on during night');
    set(handles.On_Night_CFL,'String',0);
    return
end
set(handles.On_Night_CFL,'String',num2str(On_Night_CFL))
set_param('Energy_Cost/Lighting/ON_Night_CFL','Value',num2str(On_Night_CFL));



% --- Executes during object creation, after setting all properties.
function On_Night_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Night_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to Power_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power_CFL as text
%        str2double(get(hObject,'String')) returns contents of Power_CFL as a double


% --- Executes during object creation, after setting all properties.
function Power_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function H_Many_CFL_Callback(hObject, eventdata, handles)
% hObject    handle to H_Many_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of H_Many_CFL as text
%        str2double(get(hObject,'String')) returns contents of H_Many_CFL as a double
H_Many_CFL = str2double(get(handles.H_Many_CFL,'String'));
if isempty(H_Many_CFL) ||isnan(H_Many_CFL)
    errordlg('Please enter an integer value of how many CFLs are used');
    set(handles.H_Many_CFL,'String',0);
    return
end
set(handles.H_Many_CFL,'String',num2str(H_Many_CFL))
set_param('Energy_Cost/Lighting/H_Many_CFL','Value',num2str(H_Many_CFL));


% --- Executes during object creation, after setting all properties.
function H_Many_CFL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_Many_CFL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function hrs_Morning_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Morning_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Morning_FLU as text
%        str2double(get(hObject,'String')) returns contents of hrs_Morning_FLU as a double

hrs_Morning_FLU = str2double(get(handles.hrs_Morning_FLU,'String'));
%Check the input values.
if isempty(hrs_Morning_FLU) ||isnan(hrs_Morning_FLU)
    errordlg('Please enter an integer value for the power-on hours when fluorescent tubes are used on morning');
    set(handles.hrs_Morning_FLU,'String',0);
    return
end
if hrs_Morning_FLU<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Morning_FLU,'String',0);
    return
elseif hrs_Morning_FLU>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Morning_FLU,'String',12);
    return
end
set(handles.hrs_Morning_FLU,'String',num2str(hrs_Morning_FLU))
set_param('Energy_Cost/Lighting/hrs_Morning_FLU','Value',num2str(hrs_Morning_FLU));



% --- Executes during object creation, after setting all properties.
function hrs_Morning_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Morning_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Morning_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to On_Morning_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Morning_FLU as text
%        str2double(get(hObject,'String')) returns contents of On_Morning_FLU as a double
On_Morning_FLU = str2double(get(handles.On_Morning_FLU,'String'));
if isempty(On_Morning_FLU) ||isnan(On_Morning_FLU)
    errordlg('Please enter an integer value for the time when fluorescent tubes are turned on during morning');
    set(handles.On_Morning_FLU,'String',0);
    return
end
if On_Morning_FLU<0
    errordlg('Negative values not allowed ');
    set(handles.On_Morning_FLU,'String',0);
    return
elseif On_Morning_FLU>12
    errordlg('Morning is considered from 0:00am to 12:00pm');
    set(handles.On_Morning_FLU,'String',0);
    return
end

set(handles.On_Morning_FLU,'String',num2str(On_Morning_FLU))
set_param('Energy_Cost/Lighting/ON_Morning_FLU','Value',num2str(On_Morning_FLU));



% --- Executes during object creation, after setting all properties.
function On_Morning_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Morning_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrs_Night_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to hrs_Night_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrs_Night_FLU as text
%        str2double(get(hObject,'String')) returns contents of hrs_Night_FLU as a double
hrs_Night_FLU = str2double(get(handles.hrs_Night_FLU,'String'));
if isempty(hrs_Night_FLU) ||isnan(hrs_Night_FLU)
    errordlg('Please enter an integer value for the power-on hours when fluorescent tubes are used on night');
    set(handles.hrs_Night_FLU,'String',0);
    return
end
if hrs_Night_FLU<0
    errordlg('Negative values not allowed for power-on hours');
    set(handles.hrs_Night_FLU,'String',0);
    return
elseif hrs_Night_FLU>12
    errordlg('Please consider morning from 0 to 12 hrs for power-on hours');
    set(handles.hrs_Night_FLU,'String',12);
    return
end

set(handles.hrs_Night_FLU,'String',num2str(hrs_Night_FLU))
set_param('Energy_Cost/Lighting/hrs_Night_FLU','Value',num2str(hrs_Night_FLU));



% --- Executes during object creation, after setting all properties.
function hrs_Night_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrs_Night_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Night_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to On_Night_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Night_FLU as text
%        str2double(get(hObject,'String')) returns contents of On_Night_FLU as a double
On_Night_FLU = str2double(get(handles.On_Night_FLU,'String'));
if isempty(On_Night_FLU) ||isnan(On_Night_FLU)
    errordlg('Please enter an integer value for the time when fluorescent tubes are turned on during night');
    set(handles.On_Night_FLU,'String',0);
    return
end
set(handles.On_Night_FLU,'String',num2str(On_Night_FLU))
set_param('Energy_Cost/Lighting/ON_Night_FLU','Value',num2str(On_Night_FLU));


% --- Executes during object creation, after setting all properties.
function On_Night_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Night_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to Power_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power_FLU as text
%        str2double(get(hObject,'String')) returns contents of Power_FLU as a double


% --- Executes during object creation, after setting all properties.
function Power_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function H_Many_FLU_Callback(hObject, eventdata, handles)
% hObject    handle to H_Many_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of H_Many_FLU as text
%        str2double(get(hObject,'String')) returns contents of H_Many_FLU as a double
H_Many_FLU = str2double(get(handles.H_Many_FLU,'String'));
if isempty(H_Many_FLU) ||isnan(H_Many_FLU)
    errordlg('Please enter an integer value of how many fluorescent tubes are used');
    set(handles.H_Many_FLU,'String',0);
    return
end
set(handles.H_Many_FLU,'String',num2str(H_Many_FLU))
set_param('Energy_Cost/Lighting/H_Many_FLU','Value',num2str(H_Many_FLU));




% --- Executes during object creation, after setting all properties.
function H_Many_FLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_Many_FLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in Continuebutton1.
function Continuebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Continuebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Pow_Lig = get(handles.Power,'Value');
Power_Lig = str2double(get(handles.Power,'String'));
Power = Power_Lig(Pow_Lig);
set(handles.Power,'String',num2str(Power))
set_param('Energy_Cost/Lighting/Power','Value',num2str(Power));

Pow_CFL = get(handles.Power_CFL,'Value');
Power_CFL = str2double(get(handles.Power_CFL,'String'));
Power_CFL = Power_CFL(Pow_CFL);
set(handles.Power_CFL,'String',num2str(Power_CFL))
set_param('Energy_Cost/Lighting/Power_CFL','Value',num2str(Power_CFL));

Pow_FLU = get(handles.Power_FLU,'Value');
Power_FLU = str2double(get(handles.Power_FLU,'String'));
Power_FLU = Power_FLU(Pow_FLU);
set(handles.Power_FLU,'String',num2str(Power_FLU))
set_param('Energy_Cost/Lighting/Power_FLU','Value',num2str(Power_FLU));

H_Many = str2double(get(handles.H_Many,'String'))
H_Many_CFL = str2double(get(handles.H_Many_CFL,'String'))
H_Many_FLU = str2double(get(handles.H_Many_FLU,'String'))
set_param('Energy_Cost/Lighting/H_Many','Value',num2str(H_Many));
set_param('Energy_Cost/Lighting/H_Many_CFL','Value',num2str(H_Many_CFL));
set_param('Energy_Cost/Lighting/H_Many_FLU','Value',num2str(H_Many_FLU));


save('Lights_Parameters')
close('Lights_Parameters')


% --- Executes on button press in Help_Lighting.
function Help_Lighting_Callback(hObject, eventdata, handles)
% hObject    handle to Help_Lighting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_Lighting.fig');
run('Help_Lighting');
    

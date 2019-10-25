function varargout = Stove(varargin)
% STOVE MATLAB code for Stove.fig
%      STOVE, by itself, creates a new STOVE or raises the existing
%      singleton*.
%
%      H = STOVE returns the handle to a new STOVE or the handle to
%      the existing singleton*.
%
%      STOVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STOVE.M with the given input arguments.
%
%      STOVE('Property','Value',...) creates a new STOVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Stove_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Stove_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Stove

% Last Modified by GUIDE v2.5 02-Apr-2012 10:39:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Stove_OpeningFcn, ...
                   'gui_OutputFcn',  @Stove_OutputFcn, ...
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


% --- Executes just before Stove is made visible.
function Stove_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Stove (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('stove4.jpg','jpg');
image(x),colormap(map),axis off,hold on

% axes(handles.axes2)
% [x,map]=imread('stove3.jpg','jpg');
% image(x),colormap(map),axis off,hold on

set(handles.Electric,'Value',1);

% Choose default command line output for Stove
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Stove wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Stove_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sliderBur1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderBur1=0; %Inicializar el valor del slider.
handles.sliderBur1=get(hObject,'Value');
handles.sliderBur1=handles.sliderBur1*100;
set(handles.Burner1,'String',handles.sliderBur1);
guidata(hObject,handles);

% SetP_AA = get(handles.SetPoint_WH,'String');
% set_param('Energy_Cost/Set Point WH','Value',num2str(SetP_AA));


% --- Executes during object creation, after setting all properties.
function sliderBur1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function sliderBur2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBur2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderBur2=0; %Inicializar el valor del slider.
handles.sliderBur2=get(hObject,'Value');
handles.sliderBur2=handles.sliderBur2*100;
set(handles.Burner2,'String',handles.sliderBur2);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function sliderBur2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBur2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBur3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBur3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sliderBur3=0; %Inicializar el valor del slider.
handles.sliderBur3=get(hObject,'Value');
handles.sliderBur3=handles.sliderBur3*100;
set(handles.Burner3,'String',handles.sliderBur3);
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function sliderBur3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBur3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBur4_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBur4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sliderBur4=0; %Inicializar el valor del slider.
handles.sliderBur4=get(hObject,'Value');
handles.sliderBur4=handles.sliderBur4*100;
set(handles.Burner4,'String',handles.sliderBur4);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function sliderBur4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBur4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBur5_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBur5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderBur5=0; %Inicializar el valor del slider.
handles.sliderBur5=get(hObject,'Value');
handles.sliderBur5=handles.sliderBur5*100;
set(handles.Burner5,'String',handles.sliderBur5);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function sliderBur5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBur5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Electric.
function Electric_Callback(hObject, eventdata, handles)
% hObject    handle to Electric (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Electric

Elec=get(handles.Electric,'Value');

if Elec ==1
    set(handles.Gas,'Value',0);
end



% --- Executes on button press in Gas.
function Gas_Callback(hObject, eventdata, handles)
% hObject    handle to Gas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Gas
Gas=get(handles.Gas,'Value');
if Gas ==1
    set(handles.Electric,'Value',0);
end


% --- Executes on selection change in SizeBurner1.
function SizeBurner1_Callback(hObject, eventdata, handles)
% hObject    handle to SizeBurner1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SizeBurner1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SizeBurner1


% --- Executes during object creation, after setting all properties.
function SizeBurner1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SizeBurner1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in SizeBurner2.
function SizeBurner2_Callback(hObject, eventdata, handles)
% hObject    handle to SizeBurner2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SizeBurner2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SizeBurner2


% --- Executes during object creation, after setting all properties.
function SizeBurner2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SizeBurner2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in SizeBurner3.
function SizeBurner3_Callback(hObject, eventdata, handles)
% hObject    handle to SizeBurner3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SizeBurner3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SizeBurner3


% --- Executes during object creation, after setting all properties.
function SizeBurner3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SizeBurner3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SizeBurner4.
function SizeBurner4_Callback(hObject, eventdata, handles)
% hObject    handle to SizeBurner4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SizeBurner4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SizeBurner4


% --- Executes during object creation, after setting all properties.
function SizeBurner4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SizeBurner4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SizeBurner4.
function SizeBurner6_Callback(hObject, eventdata, handles)
% hObject    handle to SizeBurner4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SizeBurner4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SizeBurner4


% --- Executes during object creation, after setting all properties.
function SizeBurner6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SizeBurner4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in MorningUse.
function MorningUse_Callback(hObject, eventdata, handles)
% hObject    handle to MorningUse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MorningUse


% --- Executes on button press in NoonUse.
function NoonUse_Callback(hObject, eventdata, handles)
% hObject    handle to NoonUse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NoonUse


% --- Executes on button press in NightUse.
function NightUse_Callback(hObject, eventdata, handles)
% hObject    handle to NightUse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NightUse



function switchedOn_Noon_Callback(hObject, eventdata, handles)
% hObject    handle to switchedOn_Noon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of switchedOn_Noon as text
%        str2double(get(hObject,'String')) returns contents of switchedOn_Noon as a double


% --- Executes during object creation, after setting all properties.
function switchedOn_Noon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to switchedOn_Noon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOU_Noon_Callback(hObject, eventdata, handles)
% hObject    handle to TOU_Noon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOU_Noon as text
%        str2double(get(hObject,'String')) returns contents of TOU_Noon as a double


% --- Executes during object creation, after setting all properties.
function TOU_Noon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOU_Noon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function switchedOn_Mor_Callback(hObject, eventdata, handles)
% hObject    handle to switchedOn_Mor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of switchedOn_Mor as text
%        str2double(get(hObject,'String')) returns contents of switchedOn_Mor as a double


% --- Executes during object creation, after setting all properties.
function switchedOn_Mor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to switchedOn_Mor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOU_Mor_Callback(hObject, eventdata, handles)
% hObject    handle to TOU_Mor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOU_Mor as text
%        str2double(get(hObject,'String')) returns contents of TOU_Mor as a double


% --- Executes during object creation, after setting all properties.
function TOU_Mor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOU_Mor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function switchedOn_Nig_Callback(hObject, eventdata, handles)
% hObject    handle to switchedOn_Nig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of switchedOn_Nig as text
%        str2double(get(hObject,'String')) returns contents of switchedOn_Nig as a double


% --- Executes during object creation, after setting all properties.
function switchedOn_Nig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to switchedOn_Nig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOU_Nig_Callback(hObject, eventdata, handles)
% hObject    handle to TOU_Nig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOU_Nig as text
%        str2double(get(hObject,'String')) returns contents of TOU_Nig as a double


% --- Executes during object creation, after setting all properties.
function TOU_Nig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOU_Nig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in help_stove.
function help_stove_Callback(hObject, eventdata, handles)
% hObject    handle to help_stove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

find_system('Name','Help_Stove.fig');
run('Help_Stove');


% --- Executes on button press in continue_stove.
function continue_stove_Callback(hObject, eventdata, handles)
% hObject    handle to continue_stove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%get values from sliders
B1=str2double(get(handles.Burner1,'String'))/100;
B2=str2double(get(handles.Burner2,'String'))/100;
B3=str2double(get(handles.Burner3,'String'))/100;
B4=str2double(get(handles.Burner4,'String'))/100;
% B5=str2double(get(handles.Burner5,'String'))/100;

%get values for the size of burners
SB1=get(handles.SizeBurner1,'Value');
SB2=get(handles.SizeBurner2,'Value');
SB3=get(handles.SizeBurner3,'Value');
SB4=get(handles.SizeBurner4,'Value');
% SB5=get(handles.SizeBurner6,'Value');
% pause

%Type of range Electric or Gas
Elec = get(handles.Electric,'Value');
% Gas  = get(handles.Gas,'Value');


if Elec==1
    if SB1 == 1
        SB1 = 1200;
    elseif SB1 == 2
        SB1 = 1500;
    elseif SB1 == 3
        SB1 = 2100;
    elseif SB1 == 4
        SB1 = 2400;
    end
    if SB2 == 1
        SB2 = 1200;
    elseif SB2 == 2
        SB2 = 1500;
    elseif SB2 == 3
        SB2 = 2100;
    elseif SB2 == 4
        SB2 = 2400;
    end
    if SB3 == 1
        SB3 = 1200;
    elseif SB3 == 2
        SB3 = 1500;
    elseif SB3 == 3
        SB3 = 2100;
    elseif SB3 == 4
        SB3 = 2400;
    end
    if SB4 == 1
        SB4 = 1200;
    elseif SB4 == 2
        SB4 = 1500;
    elseif SB4 == 3
        SB4 = 2100;
    elseif SB4 == 4
        SB4 = 2400;
    end
%     if SB5 == 1
%         SB5 = 1200;
%     elseif SB5 == 2
%         SB5 = 1500;
%     elseif SB5 == 3
%         SB5 = 2100;
%     elseif SB5 == 4
%         SB5 = 2400;
%     end
end

% 
% if Gas==1
%     if SB1 == 1
%         SB1 = 7000*0.293083;   % 0.293083BTU--->Watts 3600 because Watts --->Joules
%     elseif SB1 == 2
%         SB1 = 8000*0.293083;
%     elseif SB1 == 3
%         SB1 = 9000*0.293083;
%     elseif SB1 == 4
%         SB1 = 12000*0.293083;
%     end
%     if SB2 == 1
%         SB2 = 7000*0.293083;
%     elseif SB2 == 2
%         SB2 = 8000*0.293083;
%     elseif SB2 == 3
%         SB2 = 9000*0.293083;
%     elseif SB2 == 4
%         SB2 = 12000*0.293083;
%     end
%     if SB3 == 1
%         SB3 = 7000*0.293083;
%     elseif SB3 == 2
%         SB3 = 8000*0.293083;
%     elseif SB3 == 3
%         SB3 = 9000*0.293083;
%     elseif SB3 == 4
%         SB3 = 12000*0.293083;
%     end
%     if SB4 == 1
%         SB4 = 7000*0.293083;
%     elseif SB4 == 2
%         SB4 = 8000*0.293083;
%     elseif SB4 == 3
%         SB4 = 9000*0.293083;
%     elseif SB4 == 4
%         SB4 = 12000*0.293083;
%     end
%     if SB5 == 1
%         SB5 = 7000*0.293083;
%     elseif SB5 == 2
%         SB5 = 8000*0.293083;
%     elseif SB5 == 3
%         SB5 = 9000*0.293083;
%     elseif SB5 == 4
%         SB5 = 12000*0.293083;
%     end
% end


% set_param('Energy_Cost/Range/Rates/Rate_Ele_Ran','Value',num2str(Elec));
% set_param('Energy_Cost/Range/Rates/Rate_Gas_Ran','Value',num2str(Gas));

%Times of use
MorningUse = get(handles.MorningUse,'Value');
NoonUse    = get(handles.NoonUse,'Value');
NightUse   = get(handles.NightUse,'Value');

%
switchedOn_Mor  = get(handles.switchedOn_Mor,'String');
switchedOn_Noon = get(handles.switchedOn_Noon,'String');
switchedOn_Nig  = get(handles.switchedOn_Nig,'String');

%getting minutes of use
TOU_Mor  = str2double(get(handles.TOU_Mor,'String'))/60;
TOU_Noon = str2double(get(handles.TOU_Noon,'String'))/60;
TOU_Nig  = str2double(get(handles.TOU_Nig,'String'))/60;



%%
%Sending values to simulink
set_param('Energy_Cost/Range/B1','Value',num2str(B1));
set_param('Energy_Cost/Range/B2','Value',num2str(B2));
set_param('Energy_Cost/Range/B3','Value',num2str(B3));
set_param('Energy_Cost/Range/B4','Value',num2str(B4));
% set_param('Energy_Cost/Range/B5','Value',num2str(B5));

set_param('Energy_Cost/Range/SB1','Value',num2str(SB1));
set_param('Energy_Cost/Range/SB2','Value',num2str(SB2));
set_param('Energy_Cost/Range/SB3','Value',num2str(SB3));
set_param('Energy_Cost/Range/SB4','Value',num2str(SB4));
% set_param('Energy_Cost/Range/SB5','Value',num2str(SB5));


set_param('Energy_Cost/Range/switchedOn_Mor1','Value',num2str(switchedOn_Mor));
set_param('Energy_Cost/Range/switchedOn_Noon1','Value',num2str(switchedOn_Noon));
set_param('Energy_Cost/Range/switchedOn_Nig1','Value',num2str(switchedOn_Nig));

set_param('Energy_Cost/Range/TOU_Mor1','Value',num2str(TOU_Mor*MorningUse));
set_param('Energy_Cost/Range/TOU_Noon1','Value',num2str(TOU_Noon*NoonUse));
set_param('Energy_Cost/Range/TOU_Nig1','Value',num2str(TOU_Nig*NightUse));


save('Stove')
close('Stove')

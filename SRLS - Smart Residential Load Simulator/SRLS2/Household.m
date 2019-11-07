function varargout = Household(varargin)
% HOUSEHOLD MATLAB code for Household.fig
%      HOUSEHOLD, by itself, creates a new HOUSEHOLD or raises the existing
%      singleton*.
%
%      H = HOUSEHOLD returns the handle to a new HOUSEHOLD or the handle to
%      the existing singleton*.
%
%      HOUSEHOLD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOUSEHOLD.M with the given input arguments.
%
%      HOUSEHOLD('Property','Value',...) creates a new HOUSEHOLD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Household_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Household_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Household

% Last Modified by GUIDE v2.5 24-Mar-2012 00:23:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Household_OpeningFcn, ...
                   'gui_OutputFcn',  @Household_OutputFcn, ...
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


% --- Executes just before Household is made visible.
function Household_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Household (see VARARGIN)

% Choose default command line output for Household
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Household wait for user response (see UIRESUME)
% uiwait(handles.figure1);


axes(handles.axes1)
[x,map]=imread('Typical-Canadian-House.jpg','jpg');
image(x),colormap(map),axis off,hold on

set(handles.Therm_In_R1,'Visible','On');
set(handles.Therm_In_R1,'Value',1);


set(handles.Lwin1,'Visible','Off');
set(handles.Lwin2,'Visible','Off');
set(handles.Lwin3,'Visible','Off');
set(handles.Lwin4,'Visible','Off');

set(handles.Wwin1,'Visible','Off');
set(handles.Wwin2,'Visible','Off');
set(handles.Wwin3,'Visible','Off');
set(handles.Wwin4,'Visible','Off');

set(handles.Lwintext1,'Visible','Off');
set(handles.Lwintext2,'Visible','Off');
set(handles.Lwintext3,'Visible','Off');
set(handles.Lwintext4,'Visible','Off');

set(handles.WindowsR2,'Visible','Off');


set(handles.Wwintext1,'Visible','Off');
set(handles.Wwintext2,'Visible','Off');
set(handles.Wwintext3,'Visible','Off');
set(handles.Wwintext4,'Visible','Off');

% set(handles.text2,'Visible','Off');
% set(handles.text3,'Visible','Off');
% set(handles.text4,'Visible','Off');
% set(handles.text5,'Visible','Off');


set(handles.uipanel2_0,'Visible','Off');
set(handles.uipanel2_1,'Visible','Off');
set(handles.uipanel3_0,'Visible','Off');
set(handles.uipanel3_1,'Visible','Off');
set(handles.uipanel4_0,'Visible','Off');
set(handles.uipanel4_1,'Visible','Off');

set(handles.noyesWindows2,'Visible','Off');
set(handles.noyesWindows3,'Visible','Off');
set(handles.noyesWindows4,'Visible','Off');


% --- Outputs from this function are returned to the command line.
function varargout = Household_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





function LR1_Callback(hObject, eventdata, handles)
% hObject    handle to LR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LR1 as text
%        str2double(get(hObject,'String')) returns contents of LR1 as a double

LR1 = str2double(get(handles.LR1,'String'));
if isempty(LR1) ||isnan(LR1) ||(LR1<=0)
    errordlg('Please enter an integer value for length of room # 1');
    set(handles.LR1,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LR1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LW1_Callback(hObject, eventdata, handles)
% hObject    handle to LW1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LW1 as text
%        str2double(get(hObject,'String')) returns contents of LW1 as a double
LW1 = str2double(get(handles.LW1,'String'));
if isempty(LW1) ||isnan(LW1) ||(LW1<=0)
    errordlg('Please enter an integer value for width of wall for room # 1');
    set(handles.LW1,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LW1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LW1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LH1_Callback(hObject, eventdata, handles)
% hObject    handle to LH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LH1 as text
%        str2double(get(hObject,'String')) returns contents of LH1 as a double
LH1 = str2double(get(handles.LH1,'String'));
if isempty(LH1) ||isnan(LH1) ||(LH1<=0)
    errordlg('Please enter an integer value for high of wall for room # 1');
    set(handles.LH1,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LH1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LR2_Callback(hObject, eventdata, handles)
% hObject    handle to LR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LR2 as text
%        str2double(get(hObject,'String')) returns contents of LR2 as a double
LR2 = str2double(get(handles.LR2,'String'));
if isempty(LR2) ||isnan(LR2) ||(LR2<=0)
    errordlg('Please enter an integer value for lenght of wall for room # 2');
    set(handles.LR2,'String',[]);
    return
end




% --- Executes during object creation, after setting all properties.
function LR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LW2_Callback(hObject, eventdata, handles)
% hObject    handle to LW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LW2 as text
%        str2double(get(hObject,'String')) returns contents of LW2 as a double
LW2 = str2double(get(handles.LW2,'String'));
if isempty(LW2) ||isnan(LW2) ||(LW2<=0)
    errordlg('Please enter an integer value for width of wall for room # 2');
    set(handles.LW2,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LW2_CreateFcn(hObject, ~, handles)
% hObject    handle to LW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LH2_Callback(hObject, eventdata, handles)
% hObject    handle to LH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LH2 as text
%        str2double(get(hObject,'String')) returns contents of LH2 as a double
LH2 = str2double(get(handles.LH2,'String'));
if isempty(LH2) ||isnan(LH2) ||(LH2<=0)
    errordlg('Please enter an integer value for high of wall for room # 2');
    set(handles.LH2,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LH2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function LR3_Callback(hObject, eventdata, handles)
% hObject    handle to LR3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LR3 as text
%        str2double(get(hObject,'String')) returns contents of LR3 as a double
LR3 = str2double(get(handles.LR3,'String'));
if isempty(LR3) ||isnan(LR3) ||(LR3<=0)
    errordlg('Please enter an integer value for length of wall for room # 3');
    set(handles.LR3,'String',[]);
    return
end




% --- Executes during object creation, after setting all properties.
function LR3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LR3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LW3_Callback(hObject, eventdata, handles)
% hObject    handle to LW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LW3 as text
%        str2double(get(hObject,'String')) returns contents of LW3 as a double
LW3 = str2double(get(handles.LW3,'String'));
if isempty(LW3) ||isnan(LW3) ||(LW3<=0)
    errordlg('Please enter an integer value for width of wall for room # 3');
    set(handles.LW3,'String',[]);
    return
end



% --- Executes during object creation, after setting all properties.
function LW3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LH3_Callback(hObject, eventdata, handles)
% hObject    handle to LH3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LH3 as text
%        str2double(get(hObject,'String')) returns contents of LH3 as a double

LH3 = str2double(get(handles.LH3,'String'));
if isempty(LH3) ||isnan(LH3) ||(LH3<=0)
    errordlg('Please enter an integer value for high of wall for room # 3');
    set(handles.LH3,'String',[]);
    return
end




% --- Executes during object creation, after setting all properties.
function LH3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LH3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function LR4_Callback(hObject, eventdata, handles)
% hObject    handle to LR4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LR4 as text
%        str2double(get(hObject,'String')) returns contents of LR4 as a double

LR4 = str2double(get(handles.LR4,'String'));
if isempty(LR4) ||isnan(LR4) ||(LR4<=0)
    errordlg('Please enter an integer value for length of wall for room # 4');
    set(handles.LR4,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LR4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LR4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LW4_Callback(hObject, eventdata, handles)
% hObject    handle to LW4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LW4 as text
%        str2double(get(hObject,'String')) returns contents of LW4 as a double
LW4 = str2double(get(handles.LW4,'String'));
if isempty(LW4) ||isnan(LW4) ||(LW4<=0)
    errordlg('Please enter an integer value for width of wall for room # 4');
    set(handles.LW4,'String',[]);
    return
end




% --- Executes during object creation, after setting all properties.
function LW4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LW4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LH4_Callback(hObject, eventdata, handles)
% hObject    handle to LH4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LH4 as text
%        str2double(get(hObject,'String')) returns contents of LH4 as a double
LH4 = str2double(get(handles.LH4,'String'));
if isempty(LH4) ||isnan(LH4) ||(LH4<=0)
    errordlg('Please enter an integer value for high of wall for room # 4');
    set(handles.LH4,'String',[]);
    return
end


% --- Executes during object creation, after setting all properties.
function LH4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LH4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Therm_In_R4.
function Therm_In_R1_Callback(hObject, eventdata, handles)
% hObject    handle to Therm_In_R4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Therm_In_R4


% --- Executes on button press in Therm_In_R2.
function Therm_In_R2_Callback(hObject, eventdata, handles)
% hObject    handle to Therm_In_R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Therm_In_R2


% --- Executes on button press in Therm_In_R3.
function Therm_In_R3_Callback(hObject, eventdata, handles)
% hObject    handle to Therm_In_R3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Therm_In_R3


% --- Executes on button press in Therm_In_R4.
function Therm_In_R4_Callback(hObject, eventdata, handles)
% hObject    handle to Therm_In_R4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Therm_In_R4




% --- Executes on selection change in No_of_rooms.
function No_of_rooms_Callback(hObject, eventdata, handles)
% hObject    handle to No_of_rooms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns No_of_rooms contents as cell array
%        contents{get(hObject,'Value')} returns selected item from No_of_rooms


NoRooms = get(handles.No_of_rooms,'Value');
if NoRooms==1
    set(handles.uipanel1,'Visible','On');    
    set(handles.uipanel2,'Visible','Off');
    set(handles.uipanel3,'Visible','Off');
    set(handles.uipanel4,'Visible','Off');  

    set(handles.Therm_In_R1,'Value',1)

    
    
    set(handles.Lwin2,'Visible','Off');
    set(handles.Wwin2,'Visible','Off');
    set(handles.Lwintext2,'Visible','Off');
    set(handles.WindowsR2,'Visible','Off');
    set(handles.Wwintext2,'Visible','Off');
    set(handles.uipanel2_0,'Visible','Off');
    set(handles.uipanel2_1,'Visible','Off');
    set(handles.noyesWindows2,'Visible','Off');


    set(handles.Lwin3,'Visible','Off');
    set(handles.Wwin3,'Visible','Off');
    set(handles.Lwintext3,'Visible','Off');
    set(handles.WindowsR3,'Visible','Off');
    set(handles.Wwintext3,'Visible','Off');
    set(handles.uipanel3_0,'Visible','Off');
    set(handles.uipanel3_1,'Visible','Off');
    set(handles.noyesWindows3,'Visible','Off');


    set(handles.Lwin4,'Visible','Off');
    set(handles.Wwin4,'Visible','Off');
    set(handles.Lwintext4,'Visible','Off');
    set(handles.WindowsR4,'Visible','Off');
    set(handles.Wwintext4,'Visible','Off');
    set(handles.uipanel4_0,'Visible','Off');
    set(handles.uipanel4_1,'Visible','Off');
    set(handles.noyesWindows4,'Visible','Off');
    
   
elseif NoRooms==2
    set(handles.uipanel1,'Visible','On');
    set(handles.uipanel2,'Visible','On');
    set(handles.uipanel3,'Visible','Off');
    set(handles.uipanel4,'Visible','Off');   

    set(handles.Therm_In_R1,'Visible','On');
    set(handles.Therm_In_R1,'Value',1);
    
    set(handles.WindowsR2,'Visible','On');
    set(handles.uipanel2_0,'Visible','On');
    set(handles.uipanel2_1,'Visible','On');
    set(handles.noyesWindows2,'Visible','On');
    
    set(handles.Lwin3,'Visible','Off');
    set(handles.Wwin3,'Visible','Off');
    set(handles.Lwintext3,'Visible','Off');
    set(handles.WindowsR3,'Visible','Off');
    set(handles.Wwintext3,'Visible','Off');
    set(handles.uipanel3_0,'Visible','Off');
    set(handles.uipanel3_1,'Visible','Off');
    set(handles.noyesWindows3,'Visible','Off');


    set(handles.Lwin4,'Visible','Off');
    set(handles.Wwin4,'Visible','Off');
    set(handles.Lwintext4,'Visible','Off');
    set(handles.WindowsR4,'Visible','Off');
    set(handles.Wwintext4,'Visible','Off');
    set(handles.uipanel4_0,'Visible','Off');
    set(handles.uipanel4_1,'Visible','Off');
    set(handles.noyesWindows4,'Visible','Off');  
    

    
elseif NoRooms==3
    set(handles.uipanel1,'Visible','On');
    set(handles.uipanel2,'Visible','On');
    set(handles.uipanel3,'Visible','On');
    set(handles.uipanel4,'Visible','Off');    
    
    set(handles.Therm_In_R1,'Visible','On');
    set(handles.Therm_In_R1,'Value',1);
    
    
    set(handles.WindowsR2,'Visible','On');
    set(handles.uipanel2_0,'Visible','On');
    set(handles.uipanel2_1,'Visible','On');
    set(handles.noyesWindows2,'Visible','On');
    
    
    set(handles.WindowsR3,'Visible','On');
    set(handles.uipanel3_0,'Visible','On');
    set(handles.uipanel3_1,'Visible','On');
    set(handles.noyesWindows3,'Visible','On');


    set(handles.Lwin4,'Visible','Off');
    set(handles.Wwin4,'Visible','Off');
    set(handles.Lwintext4,'Visible','Off');
    set(handles.WindowsR4,'Visible','Off');
    set(handles.Wwintext4,'Visible','Off');
    set(handles.uipanel4_0,'Visible','Off');
    set(handles.uipanel4_1,'Visible','Off');
    set(handles.noyesWindows4,'Visible','Off');  
    

elseif NoRooms==4
    set(handles.uipanel1,'Visible','On');
    set(handles.uipanel2,'Visible','On');
    set(handles.uipanel3,'Visible','On');
    set(handles.uipanel4,'Visible','On');    

    set(handles.Therm_In_R1,'Visible','On');
    set(handles.Therm_In_R1,'Value',1);
    
    

    set(handles.WindowsR2,'Visible','On');
    set(handles.uipanel2_0,'Visible','On');
    set(handles.uipanel2_1,'Visible','On');
    set(handles.noyesWindows2,'Visible','On');

    
    set(handles.WindowsR3,'Visible','On');
    set(handles.uipanel3_0,'Visible','On');
    set(handles.uipanel3_1,'Visible','On');
    set(handles.noyesWindows3,'Visible','On');    
    

    set(handles.WindowsR4,'Visible','On');
    set(handles.uipanel4_0,'Visible','On');
    set(handles.uipanel4_1,'Visible','On');
    set(handles.noyesWindows4,'Visible','On');    


end
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function No_of_rooms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to No_of_rooms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lwin1_Callback(hObject, eventdata, handles)
% hObject    handle to Lwin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lwin1 as text
%        str2double(get(hObject,'String')) returns contents of Lwin1 as a double


% --- Executes during object creation, after setting all properties.
function Lwin1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lwin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wwin1_Callback(hObject, eventdata, handles)
% hObject    handle to Wwin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wwin1 as text
%        str2double(get(hObject,'String')) returns contents of Wwin1 as a double


% --- Executes during object creation, after setting all properties.
function Wwin1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wwin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lwin2_Callback(hObject, eventdata, handles)
% hObject    handle to Lwin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lwin2 as text
%        str2double(get(hObject,'String')) returns contents of Lwin2 as a double


% --- Executes during object creation, after setting all properties.
function Lwin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lwin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wwin2_Callback(hObject, eventdata, handles)
% hObject    handle to Wwin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wwin2 as text
%        str2double(get(hObject,'String')) returns contents of Wwin2 as a double


% --- Executes during object creation, after setting all properties.
function Wwin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wwin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Lwin4_Callback(hObject, eventdata, handles)
% hObject    handle to Lwin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lwin4 as text
%        str2double(get(hObject,'String')) returns contents of Lwin4 as a double


% --- Executes during object creation, after setting all properties.
function Lwin4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lwin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wwin4_Callback(hObject, eventdata, handles)
% hObject    handle to Wwin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wwin4 as text
%        str2double(get(hObject,'String')) returns contents of Wwin4 as a double


% --- Executes during object creation, after setting all properties.
function Wwin4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wwin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lwin3_Callback(hObject, eventdata, handles)
% hObject    handle to Lwin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lwin3 as text
%        str2double(get(hObject,'String')) returns contents of Lwin3 as a double


% --- Executes during object creation, after setting all properties.
function Lwin3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lwin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wwin3_Callback(hObject, eventdata, handles)
% hObject    handle to Wwin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wwin3 as text
%        str2double(get(hObject,'String')) returns contents of Wwin3 as a double


% --- Executes during object creation, after setting all properties.
function Wwin3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wwin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noyesWindows1.
function noyesWindows1_Callback(hObject, eventdata, handles)
% hObject    handle to noyesWindows1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noyesWindows1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noyesWindows1
noyesWindows1 = get(handles.noyesWindows1,'Value');
if noyesWindows1==1
    set(handles.Lwin1,'Visible','Off');        
    set(handles.Lwintext1,'Visible','Off');        
    set(handles.Wwin1,'Visible','Off');        
    set(handles.Wwintext1,'Visible','Off');  
%     set(handles.text2,'Visible','Off');

else
    set(handles.Lwin1,'Visible','On');        
    set(handles.Lwintext1,'Visible','On');        
    set(handles.Wwin1,'Visible','On');        
    set(handles.Wwintext1,'Visible','On');        
%     set(handles.text2,'Visible','On');
end    



% --- Executes during object creation, after setting all properties.
function noyesWindows1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noyesWindows1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noyesWindows2.
function noyesWindows2_Callback(hObject, eventdata, handles)
% hObject    handle to noyesWindows2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noyesWindows2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noyesWindows2

noyesWindows2 = get(handles.noyesWindows2,'Value');
if noyesWindows2==1
    set(handles.Lwin2,'Visible','Off');        
    set(handles.Lwintext2,'Visible','Off');        
    set(handles.Wwin2,'Visible','Off');        
    set(handles.Wwintext2,'Visible','Off');  
%     set(handles.text3,'Visible','Off');

else
    set(handles.Lwin2,'Visible','On');        
    set(handles.Lwintext2,'Visible','On');        
    set(handles.Wwin2,'Visible','On');        
    set(handles.Wwintext2,'Visible','On');        
%     set(handles.text3,'Visible','On');
end    



% --- Executes during object creation, after setting all properties.
function noyesWindows2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noyesWindows2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noyesWindows3.
function noyesWindows3_Callback(hObject, eventdata, handles)
% hObject    handle to noyesWindows3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noyesWindows3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noyesWindows3

noyesWindows3 = get(handles.noyesWindows3,'Value');
if noyesWindows3==1
    set(handles.Lwin3,'Visible','Off');        
    set(handles.Lwintext3,'Visible','Off');        
    set(handles.Wwin3,'Visible','Off');        
    set(handles.Wwintext3,'Visible','Off');   
%     set(handles.text4,'Visible','Off');


else
    set(handles.Lwin3,'Visible','On');        
    set(handles.Lwintext3,'Visible','On');        
    set(handles.Wwin3,'Visible','On');        
    set(handles.Wwintext3,'Visible','On');        
%     set(handles.text4,'Visible','On');

    
end    



% --- Executes during object creation, after setting all properties.
function noyesWindows3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noyesWindows3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in noyesWindows4.
function noyesWindows4_Callback(hObject, eventdata, handles)
% hObject    handle to noyesWindows4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noyesWindows4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noyesWindows4
noyesWindows4 = get(handles.noyesWindows4,'Value');
if noyesWindows4==1
    set(handles.Lwin4,'Visible','Off');        
    set(handles.Lwintext4,'Visible','Off');        
    set(handles.Wwin4,'Visible','Off');        
    set(handles.Wwintext4,'Visible','Off'); 
%     set(handles.text5,'Visible','Off');

else
    set(handles.Lwin4,'Visible','On');        
    set(handles.Lwintext4,'Visible','On');        
    set(handles.Wwin4,'Visible','On');        
    set(handles.Wwintext4,'Visible','On');        
%     set(handles.text5,'Visible','On');
    
end    


% --- Executes during object creation, after setting all properties.
function noyesWindows4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noyesWindows4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HelpHouse.
function HelpHouse_Callback(hObject, eventdata, handles)
% hObject    handle to HelpHouse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
find_system('Name','Help_Household.fig');
run('Help_Household');






% --- Executes on button press in Continue.
function Continue_Callback(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Room1zero;   Room2zero;  Room3zero;  Room4zero;

Len_wall1 = str2double(get(handles.LR1,'String'));   Lwin1 = str2double(get(handles.Lwin1,'String'));
Width_wall1 = str2double(get(handles.LW1,'String')); Wwin1 = str2double(get(handles.Wwin1,'String'));
Higth_wall1 = str2double(get(handles.LH1,'String'));

Len_wall2 = str2double(get(handles.LR2,'String'));   Lwin2 = str2double(get(handles.Lwin2,'String'));
Width_wall2 = str2double(get(handles.LW2,'String')); Wwin2 = str2double(get(handles.Wwin2,'String'));
Higth_wall2 = str2double(get(handles.LH2,'String'));


Len_wall3 = str2double(get(handles.LR3,'String'));   Lwin3 = str2double(get(handles.Lwin3,'String'));
Width_wall3 = str2double(get(handles.LW3,'String')); Wwin3 = str2double(get(handles.Wwin3,'String'));
Higth_wall3 = str2double(get(handles.LH3,'String'));

Len_wall4 = str2double(get(handles.LR4,'String'));   Lwin4 = str2double(get(handles.Lwin4,'String'));
Width_wall4 = str2double(get(handles.LW4,'String')); Wwin4 = str2double(get(handles.Wwin4,'String'));
Higth_wall4 = str2double(get(handles.LH4,'String'));

NoRooms = get(handles.No_of_rooms,'Value');
Hou = ones(NoRooms,3);            win = ones(NoRooms,1);
Hou1 = zeros(4-NoRooms,3);        win1 = zeros(4-NoRooms,1);
Hou2 = [Hou; Hou1];               win2 = [win; win1];
house = [Len_wall1      Width_wall1   Higth_wall1
         Len_wall2      Width_wall2   Higth_wall2
         Len_wall3      Width_wall3   Higth_wall3
         Len_wall4      Width_wall4   Higth_wall4];
house = house.*Hou2;     
Area_window  = [Lwin1*Wwin1*(get(handles.noyesWindows1,'Value')-1)
                Lwin2*Wwin2*(get(handles.noyesWindows2,'Value')-1)
                Lwin3*Wwin3*(get(handles.noyesWindows3,'Value')-1)
                Lwin4*Wwin4*(get(handles.noyesWindows4,'Value')-1)].*win2;

[Rw, Cw, Rc, Ci] = thermal_calculation_param(house,Area_window);

a = (1)./((1./(2*Rw))+(1./Rc));
b = (30-23)./a;

for c = 1:4
    if c<=NoRooms
        Rw(c,1)=  Rw(c,1);
        Cw(c,1)=  Cw(c,1);
        Ci(c,1)=  Ci(c,1);
        Rc(c,1)=  Rc(c,1);
        b(c,1)=  b(c,1);
    else
        Rw(c,1)=  0;
        Cw(c,1)=  0;
        Ci(c,1)=  0;
        Rc(c,1)=  0;
        b(c,1)=  0;
    end
end

% [b(1,1)/sum(b) b(2,1)/sum(b) b(3,1)/sum(b) b(4,1)/sum(b)]
Rw1=Rw(1,1); Rw2=Rw(2,1); Rw3=Rw(3,1); Rw4=Rw(4,1);
Rc1=Rc(1,1); Rc2=Rc(2,1); Rc3=Rc(3,1); Rc4=Rc(4,1);
Cw1=Cw(1,1); Cw2=Cw(2,1); Cw3=Cw(3,1); Cw4=Cw(4,1);
Ci1=Ci(1,1); Ci2=Ci(2,1); Ci3=Ci(3,1); Ci4=Ci(4,1);

if NoRooms==1
    Room1ones; Room2zero; Room3zero; Room4zero;
    set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(0));
    set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(0));
    set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));
elseif NoRooms==2
    Room1ones; Room2ones; Room3zero; Room4zero;
    set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(0));
    set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));

elseif NoRooms==3
    Room1ones; Room2ones; Room3ones; Room4zero;
    set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));
    
elseif NoRooms==4
    Room1ones; Room2ones; Room3ones; Room4ones;
    set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(21));
    set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(21));
end

inputs.NoRooms = NoRooms;
inputs.Rw = Rw;
inputs.Cw = Cw;
inputs.Rc = Rc;
inputs.Ci = Ci;
inputs.b = b;
for i=1:4
    room = sprintf('Room_%d', i);
    inputs.(room).WallLength = str2double(get(handles.(['LR' num2str(i)]),'String'));
    inputs.(room).WallWidth = str2double(get(handles.(['LW' num2str(i)]),'String'));
    inputs.(room).WallHeigth = str2double(get(handles.(['LH' num2str(i)]),'String'));
    inputs.(room).WindowLength = str2double(get(handles.(['Lwin' num2str(i)]),'String'));
    inputs.(room).WindowWidth = str2double(get(handles.(['Wwin' num2str(i)]),'String'));
    inputs.(room).WindowNoYes = get(handles.(['noyesWindows' num2str(i)]),'Value');
end

results = getHouseholdResults();

save('results.mat', 'inputs', 'results');

save('Household')
close('Household')
function varargout = Help_PV(varargin)
% HELP_PV MATLAB code for Help_PV.fig
%      HELP_PV, by itself, creates a new HELP_PV or raises the existing
%      singleton*.
%
%      H = HELP_PV returns the handle to a new HELP_PV or the handle to
%      the existing singleton*.
%
%      HELP_PV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_PV.M with the given input arguments.
%
%      HELP_PV('Property','Value',...) creates a new HELP_PV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_PV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_PV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_PV

% Last Modified by GUIDE v2.5 28-Sep-2012 11:43:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_PV_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_PV_OutputFcn, ...
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


% --- Executes just before Help_PV is made visible.
function Help_PV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_PV (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('PVcell.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes5)
[x,map]=imread('PV.1.jpg','jpg');
image(x),colormap(map),axis off,hold on



% Choose default command line output for Help_PV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_PV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_PV_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


text1  = {'Photovoltaic (PV)'};
% Create a text
set(handles.text1,'Units', 'characters',...
                 'Position', [1 24 30 1.5],...
                 'String',  text1,...
                 'FontSize',  12);

text2  = {'The output power from PV cell is modeled here as follows:',... 
   
    %'A PV model can be expressed by the equivalent circuit shown in figure bellow.'...
    };
% Create a text
set(handles.text2,'Units', 'characters',...
                 'Position', [2 20.51 141 3],...
                 'String',  text2,...
                 'FontSize',  10);
%text3  = {'The modeling of the PV is depicted in the figure bellow and its corresponds equation is [1]. This represents the measurement of how much cooling effect is provided by the AC and it is known as the Energy Efficiency Ratio (EER). In this equation, Qout is the energy required to extract the heat (Qin) in the cooling space. An electrical input Win (in Watts) is required to do this work.'};
% Create a text
%set(handles.text3,'Units', 'characters',...
 %                'Position', [2 12 141 5],...
  %               'String',  text3,...
   %              'FontSize',  10);
             


%text7  = {'Refer to [2] to find the types of AC in households.'}; 
%set(handles.text7,'Units', 'characters',...
 %                'HorizontalAlignment','left',...
  %               'Position', [75 4 60 2],...
   %              'String',  text7,...
    %             'FontSize',  8);

text8  = {'References',...
    '[1] A. Khaligh, and O.C. Onar, "Energy Harvesting: Solar, Wind, and Ocean Energy Conversion Systems. CRC Press; 1 edition (December 1, 2009).',...
    };

% Create a uitable on the left side of the figure
set(handles.text8,'Units', 'characters',...
                 'Position', [2 0.5 142 3],...
                 'String',  text8,...
                 'FontSize',  8);
             
             
% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

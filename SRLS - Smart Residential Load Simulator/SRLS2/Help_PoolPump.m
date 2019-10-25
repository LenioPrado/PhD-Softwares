function varargout = Help_PoolPump(varargin)
% HELP_POOLPUMP MATLAB code for Help_PoolPump.fig
%      HELP_POOLPUMP, by itself, creates a new HELP_POOLPUMP or raises the existing
%      singleton*.
%
%      H = HELP_POOLPUMP returns the handle to a new HELP_POOLPUMP or the handle to
%      the existing singleton*.
%
%      HELP_POOLPUMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_POOLPUMP.M with the given input arguments.
%
%      HELP_POOLPUMP('Property','Value',...) creates a new HELP_POOLPUMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_PoolPump_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_PoolPump_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_PoolPump

% Last Modified by GUIDE v2.5 31-Oct-2012 15:32:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_PoolPump_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_PoolPump_OutputFcn, ...
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


% --- Executes just before Help_PoolPump is made visible.
function Help_PoolPump_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_PoolPump (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('Poolpump.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes3)
[x,map]=imread('PoolPumpConsumption.jpg','jpg');
image(x),colormap(map),axis off,hold on


% Choose default command line output for Help_PoolPump
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_PoolPump wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_PoolPump_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


text1  = {'Pool Pump'};
% Create a text
set(handles.text1,'Units', 'characters',...
                 'Position', [1 32.5 30 1.5],...
                 'String',  text1,...
                 'FontSize',  12);

text2  = {'Pool pumps are used to maintain the quality of water in swimming pools by circulating the water through the filtering and chemical treatment systems. Therefore, by operating the pool pump for particular hours a day, the pumping system keeps the water relatively clean, and free of bacteria. The break-up of electrical energy use in swimming pools is:',...
    '   1. 76% for pumps,',... 
    '   2. 6% for chlorination cells,'...
    '   3. 14% for electric heaters,'...
    '   4. 4% for timers and controls.'...
    %'5. Need for clean and renewable energy resources.'...
    };
% Create a text
set(handles.text2,'Units', 'characters',...
                 'Position', [2 22.5 141 10],...
                 'String',  text2,...
                 'FontSize',  10);

text3  = {'Generally 500 to 2000 W single phase pumps are used for residential swimming pools with 3 to 8 working hours per day for water filtration depending on pool size, pump size, environmental conditions such as outside temperature and sunlight illumination level, water filtration equipment, and how often the pool is used. Usually, pool pumps are controlled by electro-mechanical or electronic ON/OFF clock timers with start- and end-time manually selected by users. ',...
   '',... 

  };
% Create a text
set(handles.text3,'Units', 'characters',...
                 'Position', [2 20 141 5],...
                 'String',  text3,...
                 'FontSize',  10);
             


text8  = {'References',...
    '[1] H. Hassen, "Implementation of energy hub management system for residential sector," Masters thesis, University of Waterloo, April 2010.'};

% Create a uitable on the left side of the figure
set(handles.text8,'Units', 'characters',...
                 'Position', [2 1 141 5],...
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

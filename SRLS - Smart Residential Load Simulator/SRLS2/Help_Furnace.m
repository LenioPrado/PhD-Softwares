function varargout = Help_Furnace(varargin)
% HELP_FURNACE MATLAB code for Help_Furnace.fig
%      HELP_FURNACE, by itself, creates a new HELP_FURNACE or raises the existing
%      singleton*.
%
%      H = HELP_FURNACE returns the handle to a new HELP_FURNACE or the handle to
%      the existing singleton*.
%
%      HELP_FURNACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_FURNACE.M with the given input arguments.
%
%      HELP_FURNACE('Property','Value',...) creates a new HELP_FURNACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Furnace_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Furnace_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Furnace

% Last Modified by GUIDE v2.5 24-Mar-2012 03:01:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Furnace_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Furnace_OutputFcn, ...
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


% --- Executes just before Help_Furnace is made visible.
function Help_Furnace_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Furnace (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('HT_model.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes2)
[x,map]=imread('Gas_Furnace.jpg','jpg');
image(x),colormap(map),axis off,hold on



% Choose default command line output for Help_Furnace
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Furnace wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Furnace_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


text1  = {'Furnace (HT)'};
% Create a text
set(handles.text1,'Units', 'characters',...
                 'Position', [1 19.5 30 1.5],...
                 'String',  text1,...
                 'FontSize',  12);

text2  = {'A furnace is a device used to heat the house. he most common type used in a household are central gas furnaces, which force hot air into the house. '...
    '',...
    };
% Create a text
set(handles.text2,'Units', 'characters',...
                 'Position', [2 16.5 140 3],...
                 'String',  text2,...
                 'FontSize',  10);

text3  = {'The modeling of the heating system is depicted in the figure bellow, where the efficiency is known by Annual Fuel Utilization Efficiency (AFUE) rating. The following equation models the furnace in the figure where Qht represents the capacity of the furnace, and Qin represents the heat inside house.',...
};
% Create a text
set(handles.text3,'Units', 'characters',...
                 'Position', [2 12.5 140 4],...
                 'String',  text3,...
                 'FontSize',  10);
             
text4  = {'      Capacity (BTU):',...
    '',...
    'Annual Fuel Utilization Efficiency (AFUE):',...
};
% Create a text
set(handles.text4,'Units', 'characters',...
                 'HorizontalAlignment','right',...
                 'Position', [22.5 5 25 5],...
                 'String',  text4,...
                 'FontSize',  8);


text5  = {'----->',...
    '',...
    '----->',...
};
% Create a text
set(handles.text5,'Units', 'characters',...
                 'Position', [69 4 7 13],...
                 'String',  text5,...
                 'FontSize',  8);
             
text8  = {'Capacity in (BTU) of the furnace.',...
    '',...
    'Typical AFUE value for no high efficiency furnace is 80 and 90 for high efficiency furnace.',...
};
% Create a text
set(handles.text8,'Units', 'characters',...
                 'HorizontalAlignment','left',...
                 'Position', [1 1.5 49 5],...
                 'String',  text8,...
                 'FontSize',  8);
             
             

text6  = {'Refer to [1] to find the types of furnaces in households.',...
    '',...
};             
% Create a text
set(handles.text6,'Units', 'characters',...
                 'Position', [80 10 100 1],...
                 'String',  text6,...
                 'FontSize',  8);
             
text7  = {'References',...
    '[1] http://www.furnacecompare.com/furnace_ratings.html '};

% Create a uitable on the left side of the figure
set(handles.text7,'Units', 'characters',...
                 'Position', [5 1 145 5],...
                 'String',  text7,...
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

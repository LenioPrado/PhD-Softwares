function varargout = Help_Wind(varargin)
% HELP_WIND MATLAB code for Help_Wind.fig
%      HELP_WIND, by itself, creates a new HELP_WIND or raises the existing
%      singleton*.
%
%      H = HELP_WIND returns the handle to a new HELP_WIND or the handle to
%      the existing singleton*.
%
%      HELP_WIND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_WIND.M with the given input arguments.
%
%      HELP_WIND('Property','Value',...) creates a new HELP_WIND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Wind_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Wind_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Wind

% Last Modified by GUIDE v2.5 01-Mar-2013 12:02:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Wind_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Wind_OutputFcn, ...
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


% --- Executes just before Help_Wind is made visible.
function Help_Wind_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Wind (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('Wind2.jpg','jpg');
image(x),colormap(map),axis off,hold on

% Choose default command line output for Help_Wind
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Wind wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Wind_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

text1  = {'Wind Power'};
% Create a text
set(handles.text1,'Units', 'characters',...
                 'Position', [1 24.5 30 1.5],...
                 'String',  text1,...
                 'FontSize',  12);
             
             
             text3  = {'The output power of the turbine modeled here can be obtained from the following equation:',... 

  };
% Create a text
set(handles.text3,'Units', 'characters',...
                 'Position', [2 18.5 141 5],...
                 'String',  text3,...
                 'FontSize',  10);
             

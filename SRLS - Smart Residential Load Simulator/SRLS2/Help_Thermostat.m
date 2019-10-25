function varargout = Help_Thermostat(varargin)
% HELP_THERMOSTAT MATLAB code for Help_Thermostat.fig
%      HELP_THERMOSTAT, by itself, creates a new HELP_THERMOSTAT or raises the existing
%      singleton*.
%
%      H = HELP_THERMOSTAT returns the handle to a new HELP_THERMOSTAT or the handle to
%      the existing singleton*.
%
%      HELP_THERMOSTAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_THERMOSTAT.M with the given input arguments.
%
%      HELP_THERMOSTAT('Property','Value',...) creates a new HELP_THERMOSTAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Thermostat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Thermostat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Thermostat

% Last Modified by GUIDE v2.5 25-Mar-2012 23:51:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Thermostat_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Thermostat_OutputFcn, ...
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


% --- Executes just before Help_Thermostat is made visible.
function Help_Thermostat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Thermostat (see VARARGIN)

axes(handles.axes1)
[x,map]=imread('thermostat_help2.jpg','jpg');
image(x),colormap(map),axis off,hold on

axes(handles.axes2)
[x,map]=imread('thermostat_help3.jpg','jpg');
image(x),colormap(map),axis off,hold on

% Choose default command line output for Help_Thermostat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Thermostat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Thermostat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% text1  = {'Thermostat'};
% % Create a text
% set(handles.text1,'Units', 'characters',...
%                  'Position', [1 18.5 30 1.5],...
%                  'String',  text1,...
%                  'FontSize',  12);

% text2  = {'A furnace is a device used to heat the house,  the most common type used in a household are the central gas furnaces forcing hot air into the house. '...
%     '',...
%     };
% % Create a text
% set(handles.text2,'Units', 'characters',...
%                  'Position', [2 15 130 3],...
%                  'String',  text2,...
%                  'FontSize',  10);

% text3  = {'The modeling of the heating system is depicted in the figure, where the efficiency is known as Annual Fuel Utilization Efficiency (AFUE) rating, Qht represents the capacity of the furnace, Qout the heat in the air coming from out of the house and Qin represents the inside house heat.',...
% '',...    
% 'The following equation represents the system presented in the figure:',...
% };
% % Create a text
% set(handles.text3,'Units', 'characters',...
%                  'Position', [39 7 105 8],...
%                  'String',  text3,...
%                  'FontSize',  10);
%              
% text4  = {'      Capacity (BTU)',...
%     '',...
%     'Annual Fuel Utilization Efficiency (AFUE)',...
% };
% % Create a text
% set(handles.text4,'Units', 'characters',...
%                  'Position', [38 5 25 5],...
%                  'String',  text4,...
%                  'FontSize',  8);
% 
% 
% text5  = {'----->',...
%     '',...
%     '----->',...
% };
% % Create a text
% set(handles.text5,'Units', 'characters',...
%                  'Position', [69 7.5 7 13],...
%                  'String',  text5,...
%                  'FontSize',  8);
%              
% text8  = {'Capacity in (BTU) of the furnace',...
%     '',...
%     'Typical AFUE value for no high efficiency furnace is 80 and 90 for high efficiency furnace',...
% };
% % Create a text
% set(handles.text8,'Units', 'characters',...
%                  'Position', [15 1 49 5],...
%                  'String',  text8,...
%                  'FontSize',  8);
%              
%              
% 
% text6  = {'Refer to [1] if you need to find the type of furnace you have in your household.',...
%     '',...
% };             
% % Create a text
% set(handles.text6,'Units', 'characters',...
%                  'Position', [5 9 140 1],...
%                  'String',  text6,...
%                  'FontSize',  8);
%              
% text7  = {'References',...
%     '[1] http://www.furnacecompare.com/furnace_ratings.html ',...
%     '[2] '};
% 
% % Create a uitable on the left side of the figure
% set(handles.text7,'Units', 'characters',...
%                  'Position', [5 3 145 5],...
%                  'String',  text7,...
%                  'FontSize',  8);
%              
             

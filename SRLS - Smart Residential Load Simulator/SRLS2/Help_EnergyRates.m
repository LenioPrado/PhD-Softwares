function varargout = Help_EnergyRates(varargin)
% HELP_ENERGYRATES M-file for Help_EnergyRates.fig
%      HELP_ENERGYRATES, by itself, creates a new HELP_ENERGYRATES or raises the existing
%      singleton*.
%
%      H = HELP_ENERGYRATES returns the handle to a new HELP_ENERGYRATES or the handle to
%      the existing singleton*.
%
%      HELP_ENERGYRATES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_ENERGYRATES.M with the given input arguments.
%
%      HELP_ENERGYRATES('Property','Value',...) creates a new HELP_ENERGYRATES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_EnergyRates_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_EnergyRates_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_EnergyRates

% Last Modified by GUIDE v2.5 21-Mar-2012 14:43:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_EnergyRates_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_EnergyRates_OutputFcn, ...
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


% --- Executes just before Help_EnergyRates is made visible.
function Help_EnergyRates_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_EnergyRates (see VARARGIN)

% Choose default command line output for Help_EnergyRates
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_EnergyRates wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_EnergyRates_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% UIWAIT makes Temperatures wait for user response (see UIRESUME)
% uiwait(handles.figure1);
filas =5;
columnas = 4;
num_elem = cell(filas,columnas);
% set(handles.uitableElecRates, 'ColumnEditable', [false false false false false]);
complexData  = { ...
   '         7:00'      '        11:00'  '              9.2 Mid peak'    '            10.8 On peak';...
   '        11:00'      '        17:00'  '             10.8 On peak'    '              9.2 Mid peak';...
   '        17:00'      '        19:00'  '              9.2 Mid peak'    '            10.8 On peak';...
   '        19:00'      '         7:00'  '              6.2 Off peak'    '             6.2 Off peak';...
};

% Define parameters for a uitable (col headers are fictional)
colnames = {'From Time','To Time','Summer rate cents/m3','Winter rate cents/m3'};
% Disallow editing values (but this can be changed)
coledit = [false false false false false];
% Set columns all the same width (must be in pixels)
colwdt = {80 80 150 150 60};
% Create a uitable on the left side of the figure
set(handles.uitableElecRates,'Units', 'characters',...
                 'Position', [13.8 22.85 92.5 7.5],...
                 'Data',  complexData,... 
                 'ColumnName', colnames,...
                 'ColumnWidth', colwdt,...
                 'ColumnEditable', false);

             
text1  = {'Cost of electricity'};
% Create a text
set(handles.text1,'Units', 'characters',...
                 'Position', [5 43.5 25 1.5],...
                 'String',  text1,...
                 'FontSize',  12);
             
text2  = {'Utilities worldwide are replacing meters used by residential customers to introduce "Smart Meters" which allows the application of Time-of-Use tariffs. The cost of electricity is charged at different prices through the day, since smart meters can report how much electricity is used and when is used.'...
'',...
'The cost of electricity depend on the season and changes mainly by three rates during the day: off-peak, mid-peak, on-peak. On-peak demand corresponds to a period when most of the consumers are using electricity at the same time. Table I shows a list of TOU prices for electricity in Ontario [1]:'...
''...
'Table I. TOU tariffs in Ontario 2012.'};
% Create a text
set(handles.text2,'Units', 'characters',...
                 'Position', [5 8.5 140 12],...
                 'String',  text2,...
                 'FontSize',  8);
             
             
             
text3  = {'Cost of Natural Gas.'};
% Create a text
set(handles.text3,'Units', 'characters',...
                 'Position', [5 20 25 1.5],...
                 'String',  text3,...
                 'FontSize',  12);

text4  = {'Natural gas utilities typically apply a flat rate during the day. Table II depicts a list of prices for natural gas from Union Gas [2].',...
    '',...
    'Table II Natural gas rates for southern Ontario in 2012 '};

% % Create a text
set(handles.text4,'Units', 'characters',...
                 'Position', [5 14.5 145 5],...
                 'String',  text4,...
                 'FontSize',  8);
             
             
filas =4;
columnas = 2;
num_elem = cell(filas,columnas);
complexData  = { ...
   'Gas supply'        '11.1713 cents/m3';...
   'Transportation'    '5.0623 cents/m3';...
   'Storage'           '0.9735 cents/m3';...
   'Total'             '17.2071 cents/m3';...
};
% Set columns all the same width (must be in pixels)
colwdt = {100 100};
% Create a uitable on the left side of the figure
set(handles.uitableGasRates,'Units', 'characters',...
                 'Position', [13.8 10 40.7 6],...
                 'Data',  complexData,... 
                 'ColumnWidth', colwdt,...
                 'ColumnName',{} ,...
                 'ColumnEditable', false);
             
             
text5  = {'References',...
    '[1] www.ontario-hydro.com/index.php?page=current_rates',...
    '[2] http://www.directenergy.com/EN/Ontario/Pages/Ontario-Energy.aspx'};

% Create a uitable on the left side of the figure
set(handles.text5,'Units', 'characters',...
                 'Position', [5 3 145 5],...
                 'String',  text5,...
                 'FontSize',  8);

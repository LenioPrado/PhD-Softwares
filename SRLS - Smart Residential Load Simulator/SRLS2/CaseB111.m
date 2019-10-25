function varargout = CaseB111(varargin)
% CASEB111 M-file for CaseB111.fig
%      CASEB111, by itself, creates a new CASEB111 or raises the existing
%      singleton*.
%
%      H = CASEB111 returns the handle to a new CASEB111 or the handle to
%      the existing singleton*.
%
%      CASEB111('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CASEB111.M with the given input arguments.
%
%      CASEB111('Property','Value',...) creates a new CASEB111 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CaseB111_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CaseB111_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CaseB111

% Last Modified by GUIDE v2.5 24-Nov-2013 14:23:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CaseB111_OpeningFcn, ...
                   'gui_OutputFcn',  @CaseB111_OutputFcn, ...
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


% --- Executes just before CaseB111 is made visible.
function CaseB111_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CaseB111 (see VARARGIN)

% Choose default command line output for CaseB111
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CaseB111 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CaseB111_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function varargout = Plots2(varargin)
% PLOTS2 MATLAB code for Plots2.fig
%      PLOTS2, by itself, creates a new PLOTS2 or raises the existing
%      singleton*.
%
%      H = PLOTS2 returns the handle to a new PLOTS2 or the handle to
%      the existing singleton*.
%
%      PLOTS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTS2.M with the given input arguments.
%
%      PLOTS2('Property','Value',...) creates a new PLOTS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Plots2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Plots2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Plots2

% Last Modified by GUIDE v2.5 23-Mar-2014 11:00:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Plots2_OpeningFcn, ...
                   'gui_OutputFcn',  @Plots2_OutputFcn, ...
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


% --- Executes just before Plots2 is made visible.
function Plots2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Plots2 (see VARARGIN)
% Choose default command line output for Plots2
handles.output = hObject;
 % Update handles structure
guidata(hObject, handles);

% UIWAIT makes Plots2 wait for user response (see UIRESUME)


load SOC.mat;
load Cost_KW_BT2.mat;

filas =1;
columnas =1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'SOC'};
%num_elem(2,1)={'Total'};
set(handles.uitable11,'Data',num_elem);
set(handles.uitable11,'ColumnEditable',false(1,columnas));

Gen3 = [Cost_KW_BT2(3,:)];
   
         Total_Gen3 = sum(Gen3);
     Gen3(2,:)=Total_Gen3;

%%

filas =3;
columnas =1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'Battery'};
num_elem(2,1)={'Wind'};
num_elem(3,1)={'PV'};
num_elem(4,1)={'Total'};
set(handles.uitable9,'Data',num_elem);
set(handles.uitable9,'ColumnEditable',false(1,columnas));
% 
 set(handles.uitable10,'Data',num_elem);
 set(handles.uitable10,'ColumnEditable',false(1,columnas));

    load Cost_KW_BT.mat;
    load Cost_KW_WD.mat;
    load Cost_KW_PV.mat;
     
    
% 
  Gen1= [Cost_KW_BT(3,:)
            Cost_KW_WD(3,:)
            Cost_KW_PV(3,:)
            ];
%         
        Total_Gen1 = sum(Gen1);
Gen1(4,:)=Total_Gen1;
% save('Gen1.mat','Gen1','time')
%         
% 
   Gen2 = [Cost_KW_BT(2,:)
             Cost_KW_WD(2,:)
             Cost_KW_PV(2,:)
             ];
   
         Total_Gen2 = sum(Gen2);
     Gen2(4,:)=Total_Gen2;

% uiwait(handles.figure1);
filas =10;
columnas = 1;
num_elem = cell(filas,columnas);
num_elem(1,1)={'Water Heater'};
num_elem(2,1)={'Air Conditioner'};
num_elem(3,1)={'Furnace'};
num_elem(4,1)={'Range'};
num_elem(5,1)={'Lights'};
num_elem(6,1)={'Fridge'};
num_elem(7,1)={'Dryer'};
num_elem(8,1)={'Dishwasher'};
num_elem(9,1)={'Washer'};
num_elem(10,1)={'PoolPump'};
num_elem(11,1)={'Total'};
set(handles.uitable1,'Data',num_elem);
set(handles.uitable1,'ColumnEditable',false(1,columnas));

set(handles.uitable2,'Data',num_elem);
set(handles.uitable2,'ColumnEditable',false(1,columnas));


load Cost_KW_WH.mat;
time = Cost_KW_WH(1,:);

save('Gen1.mat','Gen1','time');
save('Gen2.mat','Gen2','time');
save('Gen3.mat','Gen3','time');
    
%% Price of electricity   
Rate_season = str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
Ele_off  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_off','Value'));
Ele_mid  = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_mid','Value'));
Ele_peak = str2num(get_param('Energy_Cost/Water Heater/Rates/Ele_peak','Value'));
Rate_Elec = Price_electricity(Rate_season,Ele_off,Ele_mid,Ele_peak,time);%calculating the price of electricity during the day


waitforbar;


%% load variables from simulink
    load Pow_Cost_AC;        % This is for the AC or Heater at the same time
    load Cost_KW_Ran;
    load Lighting_Total_LG.mat;
    load Cost_KW_Fridge.mat;
    


    Ener = [Cost_KW_WH(3,:)
            Pow_Cost_AC(3,:)
            Pow_Cost_AC(3,:).*(-1)
            Energy_SV
            Energy_LG
            Cost_KW_Fridge(3,:)
            Energy_DY
            Energy_DW
            Energy_CW
            Energy_PP];
        
   WH_GASELEC = str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_Ele_WH','Value'));
   if WH_GASELEC==0
      Ener(1,:) = Ener(1,:)*9.932;
   end
   
   AC_HT=  str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
    if AC_HT==1
        Ener(2,:) = 0;
    else 
        Ener(3,:) = 0;
    end
   
    Total_Ener = sum(Ener);
Ener(11,:)=Total_Ener;
save('Energy.mat','Ener','time');


%%
    Cost = [Cost_KW_WH(4,:)
            Pow_Cost_AC(4,:)
            Pow_Cost_AC(4,:).*(-1)/9.932
            Cost_SV
            Cost_LG
            Cost_KW_Fridge(4,:)
            Cost_DY
            Cost_DW
            Cost_CW
            Cost_PP];
    AC_HT=  str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
    if AC_HT==1
        Cost(2,:) = 0;
    else 
        Cost(3,:) = 0;
    end
    Total_Co = sum(Cost);
    Cost(11,:)=Total_Co;
    
  
 save('Cost_Ener.mat','Cost','time');   

% save(filename, variables)    
    T1 = length(find(time(1,:)<=7));
    T2 = length(find(time(1,:)<=11));
    T3 = length(find(time(1,:)<=17));
    T4 = length(find(time(1,:)<=19));
  Total_Energy = Total_Ener(1,length(Total_Ener));
  Total_Cost = Total_Co(1,length(Total_Co));

  Total_Gen = Total_Gen1(1,length(Total_Gen1));
  Total_Genco = Total_Gen2(1,length(Total_Gen2));

%% 
% Rate_season=get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value');
Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
if Rate_season==1
    OffPeak_En = Total_Energy-Total_Ener(1,T4)+Total_Ener(1,T1);
    MidPeak_En = Total_Ener(1,T2) - Total_Ener(1,T1)+Total_Ener(1,T4)-Total_Ener(1,T3);
    OnPeak_En = Total_Ener(1,T3)-Total_Ener(1,T2);
    
    OffPeak_Co = (Total_Cost-Total_Co(1,T4)+Total_Co(1,T1))/100;
    MidPeak_Co = (Total_Co(1,T2) - Total_Co(1,T1)+Total_Co(1,T4)-Total_Co(1,T3))/100;
    OnPeak_Co  = (Total_Co(1,T3)-Total_Co(1,T2))/100;
   
else
    OffPeak_En = Total_Energy-Total_Ener(1,T4)+Total_Ener(1,T1);
    MidPeak_En = Total_Ener(1,T3)-Total_Ener(1,T2);
    OnPeak_En = Total_Ener(1,T2)-Total_Ener(1,T1)+Total_Ener(1,T4)-Total_Ener(1,T3);
    
    OffPeak_Co = (Total_Cost-Total_Co(1,T4)+Total_Co(1,T1))/100;
    MidPeak_Co = (Total_Co(1,T3)-Total_Co(1,T2))/100;
    OnPeak_Co = (Total_Co(1,T2)-Total_Co(1,T1)+Total_Co(1,T4)-Total_Co(1,T3))/100;    
end


   if WH_GASELEC==0 %if gas water heater
      Cost_Gas = Cost_KW_WH(4,:);
      Total_EnerGas = Cost_KW_WH(3,:);
      
      Total_CostGas = Cost_Gas(1,length(Cost_Gas));   
      Total_CoGas = Cost_Gas;

      Total_EnergyGas = Total_EnerGas(1,length(Total_EnerGas))*9.932;
      Total_EnerGas = Total_EnerGas*9.932;
%       Total_CoGas = sum(Cost_Gas)

        Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
        if Rate_season==1
            OffPeak_EnGas = Total_EnergyGas-Total_EnerGas(1,T4)+Total_EnerGas(1,T1);
            MidPeak_EnGas = Total_EnerGas(1,T2) - Total_EnerGas(1,T1)+Total_EnerGas(1,T4)-Total_EnerGas(1,T3);
            OnPeak_EnGas = Total_EnerGas(1,T3)-Total_EnerGas(1,T2);
    
            OffPeak_Gas = (Total_CostGas-Total_CoGas(1,T4)+Total_CoGas(1,T1))/100;
            MidPeak_Gas = (Total_CoGas(1,T2) - Total_CoGas(1,T1)+Total_CoGas(1,T4)-Total_CoGas(1,T3))/100;
            OnPeak_Gas  = (Total_CoGas(1,T3)-Total_CoGas(1,T2))/100;
        else
            OffPeak_EnGas = Total_EnergyGas-Total_EnerGas(1,T4)+Total_EnerGas(1,T1);
            MidPeak_EnGas = Total_EnerGas(1,T3)-Total_EnerGas(1,T2);
            OnPeak_EnGas = Total_EnerGas(1,T2)-Total_EnerGas(1,T1)+Total_EnerGas(1,T4)-Total_EnerGas(1,T3);

            OffPeak_Gas = (Total_CostGas-Total_CoGas(1,T4)+Total_CoGas(1,T1))/100;
            MidPeak_Gas = (Total_CoGas(1,T3)-Total_CoGas(1,T2))/100;
            OnPeak_Gas = (Total_CoGas(1,T2)-Total_CoGas(1,T1)+Total_CoGas(1,T4)-Total_CoGas(1,T3))/100;
        end

        OffPeak_Co = OffPeak_Co - OffPeak_Gas;
        MidPeak_Co = MidPeak_Co - MidPeak_Gas;
        OnPeak_Co  = OnPeak_Co - OnPeak_Gas;

        OffPeak_En = OffPeak_En - OffPeak_EnGas;
        MidPeak_En = MidPeak_En - MidPeak_EnGas;
        OnPeak_En  = OnPeak_En - OnPeak_EnGas;
        
        m3GasWH = Total_EnerGas(1,length(Total_EnerGas))/9.932;
        Total_costOfGasWH = Cost_KW_WH(4,length(Cost_KW_WH(4,:)))/100;
   else
       m3GasWH =0;
       Total_costOfGasWH=0;
       
   end
        %%
   if  AC_HT==1  %if furnace
       disp('adfasd')
      Cost_GasF = Pow_Cost_AC(4,:).*(-1)/9.932;
      Total_EnerGasF = Pow_Cost_AC(3,:).*(-1);
      
      Total_CostGasF = Cost_GasF(1,length(Cost_GasF));   
      Total_CoGasF = Cost_GasF;

      Total_EnergyGasF = Total_EnerGasF(1,length(Total_EnerGasF));
      Total_EnerGasF = Total_EnerGasF;
%       Total_CoGas = sum(Cost_Gas)

        Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));
        if Rate_season==1
            OffPeak_EnGasF = Total_EnergyGasF-Total_EnerGasF(1,T4)+Total_EnerGasF(1,T1);
            MidPeak_EnGasF = Total_EnerGasF(1,T2) - Total_EnerGasF(1,T1)+Total_EnerGasF(1,T4)-Total_EnerGasF(1,T3);
            OnPeak_EnGasF = Total_EnerGasF(1,T3)-Total_EnerGasF(1,T2);
    
            OffPeak_GasF = (Total_CostGasF-Total_CoGasF(1,T4)+Total_CoGasF(1,T1))/100;
            MidPeak_GasF = (Total_CoGasF(1,T2) - Total_CoGasF(1,T1)+Total_CoGasF(1,T4)-Total_CoGasF(1,T3))/100;
            OnPeak_GasF  = (Total_CoGasF(1,T3)-Total_CoGasF(1,T2))/100;
        else
            OffPeak_EnGasF = Total_EnergyGasF-Total_EnerGasF(1,T4)+Total_EnerGasF(1,T1);
            MidPeak_EnGasF = Total_EnerGasF(1,T3)-Total_EnerGasF(1,T2);
            OnPeak_EnGasF = Total_EnerGasF(1,T2)-Total_EnerGasF(1,T1)+Total_EnerGasF(1,T4)-Total_EnerGasF(1,T3);

            OffPeak_GasF = (Total_CostGasF-Total_CoGasF(1,T4)+Total_CoGasF(1,T1))/100;
            MidPeak_GasF = (Total_CoGasF(1,T3)-Total_CoGasF(1,T2))/100;
            OnPeak_GasF = (Total_CoGasF(1,T2)-Total_CoGasF(1,T1)+Total_CoGasF(1,T4)-Total_CoGasF(1,T3))/100;
        end

        OffPeak_Co = OffPeak_Co - OffPeak_GasF;
        MidPeak_Co = MidPeak_Co - MidPeak_GasF;
        OnPeak_Co  = OnPeak_Co - OnPeak_GasF;

        OffPeak_En = OffPeak_En - OffPeak_EnGasF;
        MidPeak_En = MidPeak_En - MidPeak_EnGasF;
        OnPeak_En  = OnPeak_En - OnPeak_EnGasF;
        
        m3GasF = Total_EnerGasF(1,length(Total_EnerGasF))/9.932;
        Total_costOfGasF = Pow_Cost_AC(4,length(Pow_Cost_AC(4,:)))/100  .*(-1)/9.932;
   else
       m3GasF = 0;
       Total_costOfGasF =0;
  
     end

  if AC_HT ~=1 &&  WH_GASELEC~=0
    m3GasWH = 0;
    m3GasF = 0;
    Total_costOfGasWH = 0;
    Total_costOfGasF = 0;
  end

   m3Gas = m3GasWH + m3GasF;
   Total_costOfGas = Total_costOfGasWH + Total_costOfGasF;

OffPeak_Color = [0 0 1];
MidPeak_Color = [1 0.694 0.392];
OnPeak_Color = [1 0 0];

%% Electricity
set(handles.En_Off,'String',num2str(OffPeak_En));
set(handles.En_Mid,'String',num2str(MidPeak_En));
set(handles.En_On,'String',num2str(OnPeak_En));
set(handles.En_Total,'String',num2str(OffPeak_En+MidPeak_En+OnPeak_En));


set(handles.Cost_Off,'String',num2str(OffPeak_Co));
set(handles.Cost_Mid,'String',num2str(MidPeak_Co));
set(handles.Cost_On,'String',num2str(OnPeak_Co));
set(handles.Cost_Total,'String',num2str(OffPeak_Co+MidPeak_Co+OnPeak_Co));

                
set(handles.m3,'String',num2str(m3Gas));
set(handles.m3_Cost,'String',num2str(Total_costOfGas));

                %%
                 Rate_season=str2num(get_param('Energy_Cost/Water Heater/Rates/Rate_season','Value'));    
if Rate_season==1
    OffPeak_Gen = Total_Gen-Total_Gen1(1,T4)+Total_Gen1(1,T1);
    MidPeak_Gen = Total_Gen1(1,T2) - Total_Gen1(1,T1)+Total_Gen1(1,T4)-Total_Gen1(1,T3);
    OnPeak_Gen = Total_Gen1(1,T3)-Total_Gen1(1,T2);
    
    OffPeak_Genco = (Total_Genco-Total_Gen2(1,T4)+Total_Gen2(1,T1))/100;
    MidPeak_Genco = (Total_Gen2(1,T2) - Total_Gen2(1,T1)+Total_Gen2(1,T4)-Total_Gen2(1,T3))/100;
    OnPeak_Genco  = (Total_Gen2(1,T3)-Total_Gen2(1,T2))/100;
   
else
    OffPeak_Gen = Total_Gen-Total_Gen1(1,T4)+Total_Gen1(1,T1);
    MidPeak_Gen = Total_Gen1(1,T3)-Total_Gen1(1,T2);
    OnPeak_Gen = Total_Gen1(1,T2)-Total_Gen1(1,T1)+Total_Gen1(1,T4)-Total_Gen1(1,T3);
    
    OffPeak_Genco = (Total_Genco-Total_Gen2(1,T4)+Total_Gen2(1,T1))/100;
    MidPeak_Genco = (Total_Gen2(1,T3)-Total_Gen2(1,T2))/100;
    OnPeak_Genco = (Total_Gen2(1,T2)-Total_Gen2(1,T1)+Total_Gen2(1,T4)-Total_Gen2(1,T3))/100;    
       end      
%

set(handles.Off_Gen,'String',num2str(OffPeak_Gen));
set(handles.Mid_Gen,'String',num2str(MidPeak_Gen));
set(handles.On_Gen,'String',num2str(OnPeak_Gen));
set(handles.Total_Enr,'String',num2str(OffPeak_Gen+MidPeak_Gen+OnPeak_Gen));

set(handles.Off_Sav,'String',num2str(OffPeak_Genco));
set(handles.Mid_Sav,'String',num2str(MidPeak_Genco));
set(handles.On_Sav,'String',num2str(OnPeak_Genco));
set(handles.Total_Sav,'String',num2str(OffPeak_Genco+MidPeak_Genco+OnPeak_Genco));
                
                

 function select_callback(hObject, eventdata)
    % hObject    Handle to uitable1 (see GCBO)
    % eventdata  Currently selected table indices
    % Callback to erase and replot markers, showing only those
    % corresponding to user-selected cells in table. 
    % Repeatedly called while user drags across cells of the uitable

        % hmkrs are handles to lines having markers only
%         set(hmkrs, 'Visible', 'on') % turn them off to begin
        
        % Get the list of currently selected table cells
        sel = eventdata.Indices;     % Get selection indices (row, col)
                                     % Noncontiguous selections are ok
        selcols = unique(sel(:,2));  % Get all selected data col IDs
        table = get(hObject,'Data'); % Get copy of uitable data
        
        % Get vectors of x,y values for each column in the selection;
        for idx = 1:numel(selcols)
            col = selcols(idx);
            xvals = sel(:,1);
            xvals(sel(:,2) ~= col) = [];
            yvals = table(xvals, col)';
            set(hmkrs(col), 'Visible', 'on',...
                            'XData', xvals,...
                            'YData', yvals);
        end
        
        

% --- Outputs from this function are returned to the command line.
function varargout = Plots2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Grid_OnOff.
function Grid_OnOff_Callback(hObject, eventdata, handles)
% hObject    handle to Grid_OnOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Grid_OnOff

a=get(handles.Grid_OnOff,'Value');
if a==1
    grid on;
    set(handles.Grid_OnOff,'String','Grid on');
else
    grid off;
    set(handles.Grid_OnOff,'String','Grid off');
end


% --- Executes on button press in zoomOnOff.
function zoomOnOff_Callback(hObject, eventdata, handles)
% hObject    handle to zoomOnOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of zoomOnOff

a=get(handles.zoomOnOff,'Value');
if a==1
    zoom on;
    set(handles.zoomOnOff,'String','Zoom on');
else
    zoom off;
    set(handles.zoomOnOff,'String','Zoom off');
end



% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

load Energy.mat;

    axes(handles.axes1);
    EnePlot=plot(time,Ener);grid on;
    set(EnePlot, 'Visible', 'off');

    sel1 = eventdata.Indices;
    selrows = unique(sel1(:,1));
    table = get(hObject,'Data'); % Get copy of uitable data
    Ener1=Ener(selrows,:);
    lege = table(selrows,:);
    EnePlot = plot(time,Ener1,'Visible','on'); 
    xlabel('Time (hrs)');ylabel('Energy  (kWh)');
    h=legend(lege);
    set(h,'Location','NorthWest');
    title('Energy consumption');
    
% pause

% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


load Cost_Ener.mat;

    axes(handles.axes2);
    EnePlot=plot(time,Cost);grid on;
    set(EnePlot, 'Visible', 'off');
    
sel1 = eventdata.Indices;
        selrows = unique(sel1(:,1));
        table = get(hObject,'Data'); % Get copy of uitable data
        Cost1=Cost(selrows,:);
        lege = table(selrows,:);
             EnePlot = plot(time,Cost1,'Visible','on'); 
             xlabel('Time (hrs)'); ylabel('Cost (¢)');
            h=legend(lege);
        set(h,'Location','NorthWest');
    title('Cost of energy'); 
    

% --- Executes on selection change in Details.
function Details_Callback(hObject, eventdata, handles)
% hObject    handle to Details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Details contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Details

a = get(handles.Details,'Value');
%% WH
            load Cost_KW_WH.mat;
            load Pow_Tem_WCon_WH;
       time = Pow_Tem_WCon_WH(1,:);
       WH = [Pow_Tem_WCon_WH(2:3,:); Cost_KW_WH(2,:)];
           
%% AC and HT
            load Pow_Cost_AC;        % This is for the AC or Heater at the same time
            load RoomsTemp;
        ACHT= str2num(get_param('Energy_Cost/Air Conditioner/AA or Heat','Value'));
        if ACHT==1
            AC_HT = [Pow_Cost_AC(2,:).*(-1)/3.412; RoomsTemp(2:5,:)]; 
        else 
            AC_HT = [Pow_Cost_AC(2,:)./3.412; RoomsTemp(2:5,:)]; 
        
        end
        
%%  Range
            load Cost_KW_Ran;
%%    Light
            load Lighting_Total_LG.mat;
%% Fridge    
            load Cost_KW_Fridge.mat;
            load Tin.mat;
            load TinBT.mat;     %Battery
            load TinWD.mat;     %Wind
            load TinPV.mat;     %Wind
         FG = [Cost_KW_Fridge(2,:)./100; Tin(2,:)];   

    load Power_SV.mat;  %Range
    load Power_LG.mat;  %Lights
    load Power_CW.mat;  %Dish
    load Power_DY.mat;  %Dryer
    load Power_DW.mat;  %Dishwasher
    load Power_PP.mat;  %PoolPump
    load Pow_LG.mat; 
 
    if AC_HT==1
        Ener(2,:) = 0;
    else 
        Ener(3,:) = 0;
    end

if a==1
        axes(handles.axes3);
        plot(time,WH);
        ylabel('Water Heater'); xlabel('Time in (hrs)');
        h = legend('Temperature of water (^o C)','Water Consumption (Ltrs)','Power (kW)');
        set(h,'Location','NorthOutside');
elseif a==2 
%     if AC_HT1==0
%         axes(handles.axes3)
%         plot(time,AC_HT);
%         ylabel('Air conditioner'); xlabel('Time in (hrs)');
%         h = legend('Power (kW)','Ambient Temp. (^oC)','Rooms Temp. (^o C)');
%         set(h,'Location','NorthOutside');
%     else
%         helpdlg('Furnace was used instead','Point Selection');
%     end
    
        if ACHT==1
            plot(time,AC_HT*0);
        else 
        axes(handles.axes3);
        plot(time,AC_HT);
        ylabel('Air conditioner'); xlabel('Time in (hrs)');
        h = legend('Power (kW)','Outside Temp. (^oC)','Rooms Temp. (^o C)');
        set(h,'Location','NorthOutside');
        end
    
        
elseif a==3
    if ACHT==1
        axes(handles.axes3);
        plot(time,AC_HT);
        ylabel('Furnace'); xlabel('Time in (hrs)');
        h = legend('Power (kW)','Outsidet Temp. (^oC)','Rooms Temp. (^o C)');
        set(h,'Location','NorthOutside');
    else
        plot(time,AC_HT*0);
    end
elseif a==4
    axes(handles.axes3);
    plot(time,Power_SV);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
elseif a==5
    axes(handles.axes3);
    plot(time,Pow_LG);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');

elseif a==6
    axes(handles.axes3);
    plot(time,FG);
        ylabel('Fridge'); xlabel('Time in (hrs)');
        h = legend('Power (kW)','Indoor Temp. (^oC)');
        set(h,'Location','NorthOutside');
elseif a==7
    axes(handles.axes3);
    plot(time,Power_DY);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
elseif a==8
    axes(handles.axes3);
    plot(time,Power_DW);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
elseif a==9
    axes(handles.axes3);
    plot(time,Power_CW);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
elseif a==10
    axes(handles.axes3);
    plot(time,Power_PP);
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
elseif a==11
    axes(handles.axes3);
    plot(time,TinBT(2,:));
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
elseif a==12
    axes(handles.axes3);
    plot(time,TinWD(2,:));
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
    
elseif a==13
    axes(handles.axes3);
    plot(time,TinPV(2,:));
    ylabel('Power (kW)'); xlabel('Time in (hrs)');
    
% elseif a==14
%     axes(handles.axes8)
%     plot(time,SOC(3,:));
%     ylabel('Power in (kWatts)'); xlabel('Time in (hrs)');
    
% elseif a==10
%     axes(handles.axes3)
%     plot(time,Total_power);
%     ylabel('Power in (Watts)'); xlabel('Time in (hrs)');
end


% Rate_season = get(handles.YearSeason,'Value');   
    
% --- Executes during object creation, after setting all properties.
function Details_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in uitable9.
function uitable9_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable9 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

load Gen1.mat;

    axes(handles.axes6);
    EnePlot=plot(time,Gen1);grid on;
    set(EnePlot, 'Visible', 'off');

    sel1 = eventdata.Indices;
    selrows = unique(sel1(:,1));
    table = get(hObject,'Data'); % Get copy of uitable data
    Gen2=Gen1(selrows,:);
    lege = table(selrows,:);
    EnePlot = plot(time,Gen2,'Visible','on'); 
    xlabel('Time (hrs)');ylabel('Energy  (kWh)');
    h=legend(lege);
    set(h,'Location','NorthWest');
    title('Energy Generation');
    
    


% --- Executes when selected cell(s) is changed in uitable10.
function uitable10_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable10 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


load Gen2.mat;

    axes(handles.axes7);
    EnePlot=plot(time,Gen2);grid on;
    set(EnePlot, 'Visible', 'off');
    
sel1 = eventdata.Indices;
        selrows = unique(sel1(:,1));
        table = get(hObject,'Data'); % Get copy of uitable data
        GenCost1=Gen2(selrows,:);
        lege = table(selrows,:);
             EnePlot = plot(time,GenCost1,'Visible','on'); 
             xlabel('Time (hrs)'); ylabel('Saving (¢)');
            h=legend(lege);
        set(h,'Location','NorthWest');
    title('Cost of energy'); 


% --- Executes when selected cell(s) is changed in uitable11.
function uitable11_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable11 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

load Gen3.mat;

    axes(handles.axes8);
    EnePlot=plot(time,Gen3);grid on;
    set(EnePlot, 'Visible', 'off');
    
sel1 = eventdata.Indices;
        selrows = unique(sel1(:,1));
        table = get(hObject,'Data'); % Get copy of uitable data
        GenCost3=Gen3(selrows,:);
        lege = table(selrows,:);
             EnePlot = plot(time,GenCost3,'Visible','on'); 
             xlabel('Time (hrs)'); ylabel('SOC (%)');
            h=legend(lege);
        set(h,'Location','NorthWest');
    title('Initial State-Of-Charge'); 



function En_Off_Callback(hObject, eventdata, handles)
% hObject    handle to En_Off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of En_Off as text
%        str2double(get(hObject,'String')) returns contents of En_Off as a double




% --- Executes during object creation, after setting all properties.
function En_Off_CreateFcn(hObject, eventdata, handles)
% hObject    handle to En_Off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function En_Mid_Callback(hObject, eventdata, handles)
% hObject    handle to En_Mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of En_Mid as text
%        str2double(get(hObject,'String')) returns contents of En_Mid as a double


% --- Executes during object creation, after setting all properties.
function En_Mid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to En_Mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function En_On_Callback(hObject, eventdata, handles)
% hObject    handle to En_On (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of En_On as text
%        str2double(get(hObject,'String')) returns contents of En_On as a double


% --- Executes during object creation, after setting all properties.
function En_On_CreateFcn(hObject, eventdata, handles)
% hObject    handle to En_On (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function En_Total_Callback(hObject, eventdata, handles)
% hObject    handle to En_Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of En_Total as text
%        str2double(get(hObject,'String')) returns contents of En_Total as a double


% --- Executes during object creation, after setting all properties.
function En_Total_CreateFcn(hObject, eventdata, handles)
% hObject    handle to En_Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cost_Off_Callback(hObject, eventdata, handles)
% hObject    handle to Cost_Off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cost_Off as text
%        str2double(get(hObject,'String')) returns contents of Cost_Off as a double


% --- Executes during object creation, after setting all properties.
function Cost_Off_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cost_Off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cost_Mid_Callback(hObject, eventdata, handles)
% hObject    handle to Cost_Mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cost_Mid as text
%        str2double(get(hObject,'String')) returns contents of Cost_Mid as a double


% --- Executes during object creation, after setting all properties.
function Cost_Mid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cost_Mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cost_On_Callback(hObject, eventdata, handles)
% hObject    handle to Cost_On (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cost_On as text
%        str2double(get(hObject,'String')) returns contents of Cost_On as a double


% --- Executes during object creation, after setting all properties.
function Cost_On_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cost_On (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cost_Total_Callback(hObject, eventdata, handles)
% hObject    handle to Cost_Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cost_Total as text
%        str2double(get(hObject,'String')) returns contents of Cost_Total as a double


% --- Executes during object creation, after setting all properties.
function Cost_Total_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cost_Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Off_Gen_Callback(hObject, eventdata, handles)
% hObject    handle to Off_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Off_Gen as text
%        str2double(get(hObject,'String')) returns contents of Off_Gen as a double


% --- Executes during object creation, after setting all properties.
function Off_Gen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Off_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mid_Gen_Callback(hObject, eventdata, handles)
% hObject    handle to Mid_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mid_Gen as text
%        str2double(get(hObject,'String')) returns contents of Mid_Gen as a double


% --- Executes during object creation, after setting all properties.
function Mid_Gen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mid_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Gen_Callback(hObject, eventdata, handles)
% hObject    handle to On_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Gen as text
%        str2double(get(hObject,'String')) returns contents of On_Gen as a double


% --- Executes during object creation, after setting all properties.
function On_Gen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Off_Sav_Callback(hObject, eventdata, handles)
% hObject    handle to Off_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Off_Sav as text
%        str2double(get(hObject,'String')) returns contents of Off_Sav as a double


% --- Executes during object creation, after setting all properties.
function Off_Sav_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Off_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mid_Sav_Callback(hObject, eventdata, handles)
% hObject    handle to Mid_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mid_Sav as text
%        str2double(get(hObject,'String')) returns contents of Mid_Sav as a double


% --- Executes during object creation, after setting all properties.
function Mid_Sav_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mid_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function On_Sav_Callback(hObject, eventdata, handles)
% hObject    handle to On_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of On_Sav as text
%        str2double(get(hObject,'String')) returns contents of On_Sav as a double


% --- Executes during object creation, after setting all properties.
function On_Sav_CreateFcn(hObject, eventdata, handles)
% hObject    handle to On_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Total_Enr_Callback(hObject, eventdata, handles)
% hObject    handle to Total_Enr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Total_Enr as text
%        str2double(get(hObject,'String')) returns contents of Total_Enr as a double


% --- Executes during object creation, after setting all properties.
function Total_Enr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Total_Enr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Total_Sav_Callback(hObject, eventdata, handles)
% hObject    handle to Total_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Total_Sav as text
%        str2double(get(hObject,'String')) returns contents of Total_Sav as a double


% --- Executes during object creation, after setting all properties.
function Total_Sav_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Total_Sav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m3_Callback(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m3 as text
%        str2double(get(hObject,'String')) returns contents of m3 as a double


% --- Executes during object creation, after setting all properties.
function m3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m3_Cost_Callback(hObject, eventdata, handles)
% hObject    handle to m3_Cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m3_Cost as text
%        str2double(get(hObject,'String')) returns contents of m3_Cost as a double


% --- Executes during object creation, after setting all properties.
function m3_Cost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m3_Cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

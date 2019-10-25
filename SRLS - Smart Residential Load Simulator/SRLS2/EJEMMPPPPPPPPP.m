
clear all
clc
% % Use a MATLAB icon for the tool
% [X map] = imread(fullfile(...
%     matlabroot,'toolbox','matlab','icons','matlabicon.gif'));


% Create a figure that will have a uitable, axes and checkboxes
figure('Position', [100, 300, 600, 460],...
       'Name', 'TablePlot',...  % Title figure
       'NumberTitle', 'off',... % Do not show figure number
       'MenuBar', 'none');      % Hide standard menu bar menus
   
   
[X1,map1]=imread('fire.gif');

% Convert indexed image and colormap to truecolor
icon = ind2rgb(X1,map1);

uicontrol(gcf,...
   'Style','pushbutton',...
   'Position',[15,3,140,250],...
   'CData',icon,...
   'BackgroundColor','g');



% % Create a uipushtool in the toolbar
% hpt = uipushtool(ht,'CData',icon,...
%                  'TooltipString','uipushtool',...
%                  'ClickedCallback','disp(''Hello World!'')')
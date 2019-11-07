function y = teste(handles)
    disp(handles);
    
    Rate_season = handles.YearSeason;
    Ele_off = str2double(handles.Off_Peak);
    Ele_mid = str2double(handles.Mid_Peak);
    Ele_peak = str2double(handles.On_Peak);
    
    y.rate = Rate_season;
    y.off = Ele_off*100;
    y.mid = Ele_mid*100;
    y.peak = Ele_peak*100;
end
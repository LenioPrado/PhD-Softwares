function y = teste(handles)
    Rate_season = handles.YearSeason;
    Ele_off = str2double(handles.Off_Peak);
    Ele_mid = str2double(handles.Mid_Peak);
    Ele_peak = str2double(handles.On_Peak);
    
    y.rate = Rate_season;
    y.off = Ele_off;
    y.mid = Ele_mid;
    y.peak = Ele_peak;
end  
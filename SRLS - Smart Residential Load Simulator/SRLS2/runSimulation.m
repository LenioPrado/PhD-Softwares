function result = runSimulation(handles)
    Rate_season = handles.YearSeason;

    %To Water Heater subsystem
    set_param('Energy_Cost/Water Heater/Rates/Rate_season','Value',num2str(Rate_season));

    load Typical_Temp.mat
    if Rate_season==1  %Summer Rate  Outdoor Temp
        set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(1));
        set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(0));
        %axes(handles.axes2)
        plot(Typical_Temp(:,1),Typical_Temp(:,3));grid on;
        axis([0 24 0 45]);
        xlabel('Time (hrs)');
        ylabel('Temperature ^o C')

    else  %Winter Rate
        set_param('Energy_Cost/Outdoor Temp/Temp_aux','Value',num2str(0));
        set_param('Energy_Cost/Outdoor Temp/Temp_aux1','Value',num2str(1));
        %axes(handles.axes2)
        plot(Typical_Temp(:,1),Typical_Temp(:,2));grid on;
        axis([0 24 -30 20]);
        xlabel('Time (hrs)');
        ylabel('Temperature ^o C')
    end

    Ele_off = str2double(handles.Off_Peak);
    Ele_mid = str2double(handles.Mid_Peak);
    Ele_peak = str2double(handles.On_Peak);
    for clock=1:1:24;
        if Rate_season==1  %Summer Rate
            if clock <= 7  || clock >= 19
                Rate_Elec(clock) = Ele_off ;
                time(clock)=clock;
            elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
                Rate_Elec(clock) = Ele_mid ;
                time(clock)=clock;
            else
                Rate_Elec(clock) = Ele_peak;
                time(clock)=clock;
            end
        else  %Winter Rate
            if clock <= 7  || clock >= 19
                Rate_Elec(clock) = Ele_off ;
                time(clock)=clock;
            elseif (clock >= 7  && clock <= 11) || (clock >= 17  && clock <= 19)
                Rate_Elec(clock) = Ele_peak;
                time(clock)=clock;
            else
                Rate_Elec(clock) = Ele_mid ;
                time(clock)=clock;
            end
        end
    end


    %axes(handles.axes1)
    plot(time,Rate_Elec);grid on;
    xlabel('Time (hrs)');
    ylabel('Price  (c/kW-h)')
    axis([0 24 3 12]);

    result.season = Rate_season;
    result.off = Ele_off;
    result.mid = Ele_mid;
    result.peak = Ele_peak;
    
    set_param(gcs,'SimulationCommand','Start');
end
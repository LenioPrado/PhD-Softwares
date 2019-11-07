function houseParameters(rooms)
    Room1zero;   Room2zero;  Room3zero;  Room4zero;

    Len_wall1 = str2double(get(handles.LR1,'String'));   Lwin1 = str2double(get(handles.Lwin1,'String'));
    Width_wall1 = str2double(get(handles.LW1,'String')); Wwin1 = str2double(get(handles.Wwin1,'String'));
    Higth_wall1 = str2double(get(handles.LH1,'String'));

    Len_wall2 = str2double(get(handles.LR2,'String'));   Lwin2 = str2double(get(handles.Lwin2,'String'));
    Width_wall2 = str2double(get(handles.LW2,'String')); Wwin2 = str2double(get(handles.Wwin2,'String'));
    Higth_wall2 = str2double(get(handles.LH2,'String'));


    Len_wall3 = str2double(get(handles.LR3,'String'));   Lwin3 = str2double(get(handles.Lwin3,'String'));
    Width_wall3 = str2double(get(handles.LW3,'String')); Wwin3 = str2double(get(handles.Wwin3,'String'));
    Higth_wall3 = str2double(get(handles.LH3,'String'));

    Len_wall4 = str2double(get(handles.LR4,'String'));   Lwin4 = str2double(get(handles.Lwin4,'String'));
    Width_wall4 = str2double(get(handles.LW4,'String')); Wwin4 = str2double(get(handles.Wwin4,'String'));
    Higth_wall4 = str2double(get(handles.LH4,'String'));



    NoRooms = get(handles.No_of_rooms,'Value');
    Hou = ones(NoRooms,3);            win = ones(NoRooms,1);
    Hou1 = zeros(4-NoRooms,3);        win1 = zeros(4-NoRooms,1);
    Hou2 = [Hou; Hou1];               win2 = [win; win1];
    house = [Len_wall1      Width_wall1   Higth_wall1
             Len_wall2      Width_wall2   Higth_wall2
             Len_wall3      Width_wall3   Higth_wall3
             Len_wall4      Width_wall4   Higth_wall4];
    house = house.*Hou2;     
    Area_window  = [Lwin1*Wwin1*(get(handles.noyesWindows1,'Value')-1)
                    Lwin2*Wwin2*(get(handles.noyesWindows2,'Value')-1)
                    Lwin3*Wwin3*(get(handles.noyesWindows3,'Value')-1)
                    Lwin4*Wwin4*(get(handles.noyesWindows4,'Value')-1)].*win2;

    [Rw, Cw, Rc, Ci] = thermal_calculation_param(house,Area_window);

    a = (1)./((1./(2*Rw))+(1./Rc));
    b = (30-23)./a;


    for c = 1:4
        if c<=NoRooms
            Rw(c,1)=  Rw(c,1);
            Cw(c,1)=  Cw(c,1);
            Ci(c,1)=  Ci(c,1);
            Rc(c,1)=  Rc(c,1);
            b(c,1)=  b(c,1);
        else
            Rw(c,1)=  0;
            Cw(c,1)=  0;
            Ci(c,1)=  0;
            Rc(c,1)=  0;
            b(c,1)=  0;
        end
    end

    % [b(1,1)/sum(b) b(2,1)/sum(b) b(3,1)/sum(b) b(4,1)/sum(b)]
    Rw1=Rw(1,1); Rw2=Rw(2,1); Rw3=Rw(3,1); Rw4=Rw(4,1);
    Rc1=Rc(1,1); Rc2=Rc(2,1); Rc3=Rc(3,1); Rc4=Rc(4,1);
    Cw1=Cw(1,1); Cw2=Cw(2,1); Cw3=Cw(3,1); Cw4=Cw(4,1);
    Ci1=Ci(1,1); Ci2=Ci(2,1); Ci3=Ci(3,1); Ci4=Ci(4,1);

    if NoRooms==1
        Room1ones; Room2zero; Room3zero; Room4zero;
        set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(0));
        set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(0));
        set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));
    elseif NoRooms==2
        Room1ones; Room2ones; Room3zero; Room4zero;
        set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(0));
        set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));

    elseif NoRooms==3
        Room1ones; Room2ones; Room3ones; Room4zero;
        set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(0));

    elseif NoRooms==4
        Room1ones; Room2ones; Room3ones; Room4ones;
        set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(21));
        set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(21));
    end
end
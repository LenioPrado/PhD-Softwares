function processing = HouseCalculation(HouseParameters)
    
    Len_wall1 = HouseParameters.LR1;
    Width_wall1 = HouseParameters.LW1; 
    Higth_wall1 = HouseParameters.LH1;
    Lwin1 = HouseParameters.Lwin1;
    Wwin1 = HouseParameters.Wwin1;

    Len_wall2 = HouseParameters.LR2;
    Width_wall2 = HouseParameters.LW2; 
    Higth_wall2 = HouseParameters.LH2;
    Lwin2 = HouseParameters.Lwin2;
    Wwin2 = HouseParameters.Wwin2;

    Len_wall3 = HouseParameters.LR3;
    Width_wall3 = HouseParameters.LW3; 
    Higth_wall3 = HouseParameters.LH3;
    Lwin3 = HouseParameters.Lwin3;
    Wwin3 = HouseParameters.Wwin3;

    Len_wall4 = HouseParameters.LR4;
    Width_wall4 = HouseParameters.LW4; 
    Higth_wall4 = HouseParameters.LH4;
    Lwin4 = HouseParameters.Lwin4;
    Wwin4 = HouseParameters.Wwin4;
    
    NoRooms = HouseParameters.No_of_rooms;
    
    Hou = ones(NoRooms,3);            win = ones(NoRooms,1);
    Hou1 = zeros(4-NoRooms,3);        win1 = zeros(4-NoRooms,1);
    Hou2 = [Hou; Hou1];               win2 = [win; win1];
    house = [Len_wall1      Width_wall1   Higth_wall1
             Len_wall2      Width_wall2   Higth_wall2
             Len_wall3      Width_wall3   Higth_wall3
             Len_wall4      Width_wall4   Higth_wall4];
    house = house.*Hou2;     
    Area_window  = [Lwin1*Wwin1*(HouseParameters.noyesWindows1 -1)
                    Lwin2*Wwin2*(HouseParameters.noyesWindows2 -1)
                    Lwin3*Wwin3*(HouseParameters.noyesWindows3 -1)
                    Lwin4*Wwin4*(HouseParameters.noyesWindows4 -1)].*win2;

    [Rw, Cw, Rc, Ci] = thermal_calculation_param(house,Area_window);

    a = (1)./((1./(2*Rw))+(1./Rc));
    b = (30-23)./a;
    
    for x=1:4
        if(x<=NoRooms)
            setParams(x, Rw(x,1), Rc(x,1), Cw(x,1), Ci(x,1), b);
        else
            Rw(x,1)=  0;
            Cw(x,1)=  0;
            Ci(x,1)=  0;
            Rc(x,1)=  0;
            b(x,1)=  0;
            %setZeroParams(x);
        end
    end
    
    processing.inputsJava = getInputs(HouseParameters);
    
    processing.resultsJava.Rw = Rw;
    processing.resultsJava.Cw = Cw;
    processing.resultsJava.Rc = Rc;
    processing.resultsJava.Ci = Ci;
    processing.resultsJava.b = b;
    
    processing.resultsJava.rooms = getHouseholdResults();
   
    save('resultsJava.mat', 'processing');
end

function setParams(rommNumber, Rw, Rc, Cw, Ci, b)
    path = sprintf('Energy_Cost/House/Room_%d/', rommNumber);

    set_param([path '%Loss'],'Value',num2str(b(rommNumber,1)/sum(b)));
    set_param([path 'Integrator1'],'InitialCondition',num2str(21));

    set_param([path '1st term1'],'Gain',num2str(1/Cw));
    set_param([path '2nd term1'],'Gain',num2str(1/(Rw*Cw)));
    set_param([path '3th term1'],'Gain',num2str(1/(Rw*Cw)));
    set_param([path '4th term1'],'Gain',num2str(2/(Rw*Cw)));

    set_param([path '1st term2'],'Gain',num2str(   1/Ci   ));
    set_param([path '2nd term2'],'Gain',num2str(   1/Ci   ));
    set_param([path '3th term2'],'Gain',num2str(  (1/Ci)*( (1/Rw) + (1/Rc))  ));
    set_param([path '4th term2'],'Gain',num2str( 1/(Rw*Ci) ));
    set_param([path '5th term2'],'Gain',num2str( 1/(Rc*Ci) ));
end

function setZeroParams(rommNumber)
    path = sprintf('Energy_Cost/House/Room_%d/', rommNumber);
    
    set_param([path '%Loss'],'Value',num2str(0));
    set_param([path 'Integrator1'],'InitialCondition',num2str(0));
    
    set_param([path '1st term1'],'Gain',num2str(0));
    set_param([path '2nd term1'],'Gain',num2str(0));
    set_param([path '3th term1'],'Gain',num2str(0));
    set_param([path '4th term1'],'Gain',num2str(0));

    set_param([path '1st term2'],'Gain',num2str(0));
    set_param([path '2nd term2'],'Gain',num2str(0));
    set_param([path '3th term2'],'Gain',num2str(0));
    set_param([path '4th term2'],'Gain',num2str(0));
    set_param([path '5th term2'],'Gain',num2str(0));
end

function result = getInputs(HouseParameters)
    result.NoRooms = HouseParameters.No_of_rooms;    
    for i=1:4        
        room = sprintf('Room_%d', i);       
        result.(room).WallLength = HouseParameters.(['LR' num2str(i)]);
        result.(room).WallWidth = HouseParameters.(['LW' num2str(i)]);
        result.(room).WallHeigth = HouseParameters.(['LH' num2str(i)]);
        result.(room).WindowLength = HouseParameters.(['Lwin' num2str(i)]);
        result.(room).WindowWidth = HouseParameters.(['Wwin' num2str(i)]);
        result.(room).WindowNoYes = HouseParameters.(['noyesWindows' num2str(i)]);       
    end
end
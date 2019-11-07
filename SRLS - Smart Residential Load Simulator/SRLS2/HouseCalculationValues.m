function HouseParameters = HouseCalculationValues(option)

    HouseParameters.No_of_rooms = 3;
    rooms = str2double(HouseParameters.No_of_rooms);
    if(option == 1)
        for c=1:4            
            mult = 1;
            if(c>rooms)
               mult = 0;
            end         
            v = (5*(c-1))*mult;
            HouseParameters.(['LR' num2str(c)]) = num2str(v+1*mult);
            HouseParameters.(['LW' num2str(c)]) = num2str(v+2*mult);
            HouseParameters.(['LH' num2str(c)]) = num2str(v+3*mult);
            HouseParameters.(['Lwin' num2str(c)]) = num2str(v+4*mult);
            HouseParameters.(['Wwin' num2str(c)]) = num2str(v+5*mult);
            HouseParameters.(['noyesWindows' num2str(c)]) = num2str(2*mult);
        end
    elseif(option == 2)
        for i=1:4

            room = sprintf('Room_%d', i);
            path = sprintf('Energy_Cost/House/%s/', room);        

            HouseParameters.(room).('Loss') = get_param([path '%Loss'],'Value');
            HouseParameters.(room).('Integrator1') = get_param([path 'Integrator1'],'InitialCondition');
            HouseParameters.(room).('term1_1st') = get_param([path '1st term1'],'Gain');
            HouseParameters.(room).('term1_2nd') = get_param([path '2nd term1'],'Gain');
            HouseParameters.(room).('term1_3th') = get_param([path '3th term1'],'Gain');
            HouseParameters.(room).('term1_4th') = get_param([path '4th term1'],'Gain');

            HouseParameters.(room).('term2_1st') = get_param([path '1st term2'],'Gain');
            HouseParameters.(room).('term2_2nd') = get_param([path '2nd term2'],'Gain');
            HouseParameters.(room).('term2_3th') = get_param([path '3th term2'],'Gain');
            HouseParameters.(room).('term2_4th') = get_param([path '4th term2'],'Gain');
            HouseParameters.(room).('term2_5th') = get_param([path '5th term2'],'Gain');        
        end 
    elseif(option == 3)
        HouseParameters.('LR1') = (4);
        HouseParameters.('LW1') = (4);
        HouseParameters.('LH1') = (2);
        HouseParameters.('Lwin1') = (1);
        HouseParameters.('Wwin1') = (1);
        HouseParameters.('noyesWindows1') = (2);
        
        HouseParameters.('LR2') = (3);
        HouseParameters.('LW2') = (2);
        HouseParameters.('LH2') = (2.5);
        HouseParameters.('Lwin2') = (1.1);
        HouseParameters.('Wwin2') = (1.2);
        HouseParameters.('noyesWindows2') = (2);
        
        HouseParameters.('LR3') = (2.5);
        HouseParameters.('LW3') = (2.5);
        HouseParameters.('LH3') = (3);
        HouseParameters.('Lwin3') = (1.5);
        HouseParameters.('Wwin3') = (1.6);
        HouseParameters.('noyesWindows3') = (2);
        
        HouseParameters.('LR4') = (3.8);
        HouseParameters.('LW4') = (2.9);
        HouseParameters.('LH4') = (2.5);
        HouseParameters.('Lwin4') = (1.3);
        HouseParameters.('Wwin4') = (1.4);
        HouseParameters.('noyesWindows4') = (2);        
    end
end
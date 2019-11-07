function results = getHouseholdResults()
    for i=1:4        
        room = sprintf('Room_%d', i);
        path = sprintf('Energy_Cost/House/%s/', room);        
        
        results.(room).('Loss') = get_param([path '%Loss'],'Value');
        results.(room).('Integrator1') = get_param([path 'Integrator1'],'InitialCondition');
        results.(room).('term1_1st') = get_param([path '1st term1'],'Gain');
        results.(room).('term1_2nd') = get_param([path '2nd term1'],'Gain');
        results.(room).('term1_3th') = get_param([path '3th term1'],'Gain');
        results.(room).('term1_4th') = get_param([path '4th term1'],'Gain');

        results.(room).('term2_1st') = get_param([path '1st term2'],'Gain');
        results.(room).('term2_2nd') = get_param([path '2nd term2'],'Gain');
        results.(room).('term2_3th') = get_param([path '3th term2'],'Gain');
        results.(room).('term2_4th') = get_param([path '4th term2'],'Gain');
        results.(room).('term2_5th') = get_param([path '5th term2'],'Gain');        
    end
end
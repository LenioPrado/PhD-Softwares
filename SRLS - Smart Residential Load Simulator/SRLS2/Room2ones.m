

set_param('Energy_Cost/House/Room_2/%Loss','Value',num2str(b(2,1)/sum(b)));
set_param('Energy_Cost/House/Room_2/Integrator1','InitialCondition',num2str(21));
set_param('Energy_Cost/House/Room_2/1st term1','Gain',num2str(1/Cw2));
set_param('Energy_Cost/House/Room_2/2nd term1','Gain',num2str(1/(Rw2*Cw2)));
set_param('Energy_Cost/House/Room_2/3th term1','Gain',num2str(1/(Rw2*Cw2)));
set_param('Energy_Cost/House/Room_2/4th term1','Gain',num2str(2/(Rw2*Cw2)));

set_param('Energy_Cost/House/Room_2/1st term2','Gain',num2str(   1/Ci2   ));
set_param('Energy_Cost/House/Room_2/2nd term2','Gain',num2str(   1/Ci2   ));
set_param('Energy_Cost/House/Room_2/3th term2','Gain',num2str(  (1/Ci2)*( (1/Rw2) + (1/Rc2))  ));
set_param('Energy_Cost/House/Room_2/4th term2','Gain',num2str( 1/(Rw2*Ci2) ));
set_param('Energy_Cost/House/Room_2/5th term2','Gain',num2str( 1/(Rc2*Ci2) ));
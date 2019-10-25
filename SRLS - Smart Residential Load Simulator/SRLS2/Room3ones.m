

set_param('Energy_Cost/House/Room_3/%Loss','Value',num2str(b(3,1)/sum(b)));
set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(21));
set_param('Energy_Cost/House/Room_3/1st term1','Gain',num2str(1/Cw3));
set_param('Energy_Cost/House/Room_3/2nd term1','Gain',num2str(1/(Rw3*Cw3)));
set_param('Energy_Cost/House/Room_3/3th term1','Gain',num2str(1/(Rw3*Cw3)));
set_param('Energy_Cost/House/Room_3/4th term1','Gain',num2str(2/(Rw3*Cw3)));

set_param('Energy_Cost/House/Room_3/1st term2','Gain',num2str(   1/Ci3   ));
set_param('Energy_Cost/House/Room_3/2nd term2','Gain',num2str(   1/Ci3   ));
set_param('Energy_Cost/House/Room_3/3th term2','Gain',num2str(  (1/Ci3)*( (1/Rw3) + (1/Rc3))  ));
set_param('Energy_Cost/House/Room_3/4th term2','Gain',num2str( 1/(Rw3*Ci3) ));
set_param('Energy_Cost/House/Room_3/5th term2','Gain',num2str( 1/(Rc3*Ci3) ));
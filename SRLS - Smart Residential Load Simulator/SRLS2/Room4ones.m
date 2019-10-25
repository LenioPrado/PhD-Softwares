

set_param('Energy_Cost/House/Room_4/%Loss','Value',num2str(b(4,1)/sum(b)));
set_param('Energy_Cost/House/Room_4/Integrator1','InitialCondition',num2str(21));
set_param('Energy_Cost/House/Room_4/1st term1','Gain',num2str(1/Cw4));
set_param('Energy_Cost/House/Room_4/2nd term1','Gain',num2str(1/(Rw4*Cw4)));
set_param('Energy_Cost/House/Room_4/3th term1','Gain',num2str(1/(Rw4*Cw4)));
set_param('Energy_Cost/House/Room_4/4th term1','Gain',num2str(2/(Rw4*Cw4)));

set_param('Energy_Cost/House/Room_4/1st term2','Gain',num2str(   1/Ci4   ));
set_param('Energy_Cost/House/Room_4/2nd term2','Gain',num2str(   1/Ci4   ));
set_param('Energy_Cost/House/Room_4/3th term2','Gain',num2str(  (1/Ci4)*( (1/Rw4) + (1/Rc4))  ));
set_param('Energy_Cost/House/Room_4/4th term2','Gain',num2str( 1/(Rw4*Ci4) ));
set_param('Energy_Cost/House/Room_4/5th term2','Gain',num2str( 1/(Rc4*Ci4) ));
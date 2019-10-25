

set_param('Energy_Cost/House/Room_1/%Loss','Value',num2str(b(1,1)/sum(b)));
set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(21));
set_param('Energy_Cost/House/Room_1/1st term1','Gain',num2str(1/Cw1));
set_param('Energy_Cost/House/Room_1/2nd term1','Gain',num2str(1/(Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/3th term1','Gain',num2str(1/(Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/4th term1','Gain',num2str(2/(Rw1*Cw1)));

set_param('Energy_Cost/House/Room_1/1st term2','Gain',num2str(   1/Ci1   ));
set_param('Energy_Cost/House/Room_1/2nd term2','Gain',num2str(   1/Ci1   ));
set_param('Energy_Cost/House/Room_1/3th term2','Gain',num2str(  (1/Ci1)*( (1/Rw1) + (1/Rc1))  ));
set_param('Energy_Cost/House/Room_1/4th term2','Gain',num2str( 1/(Rw1*Ci1) ));
set_param('Energy_Cost/House/Room_1/5th term2','Gain',num2str( 1/(Rc1*Ci1) ));
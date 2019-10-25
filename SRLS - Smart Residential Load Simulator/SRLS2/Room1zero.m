% function [Rw, Cw, Rc, Ci] = Room1zero(Rw,Cw,Ci,Rc,b,NoRooms)

set_param('Energy_Cost/House/Room_1/%Loss','Value',num2str(0));
set_param('Energy_Cost/House/Room_1/Integrator1','InitialCondition',num2str(0));
set_param('Energy_Cost/House/Room_1/1st term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_1/2nd term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_1/3th term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_1/4th term1','Gain',num2str(0));

set_param('Energy_Cost/House/Room_1/1st term2','Gain',num2str(   0   ));
set_param('Energy_Cost/House/Room_1/2nd term2','Gain',num2str(   0   ));
set_param('Energy_Cost/House/Room_1/3th term2','Gain',num2str( 0  ));
set_param('Energy_Cost/House/Room_1/4th term2','Gain',num2str( 0 ));
set_param('Energy_Cost/House/Room_1/5th term2','Gain',num2str( 0 ));
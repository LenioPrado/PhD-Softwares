% function [Rw, Cw, Rc, Ci] = Room1zero(Rw,Cw,Ci,Rc,b,NoRooms)

set_param('Energy_Cost/House/Room_3/%Loss','Value',num2str(0));
set_param('Energy_Cost/House/Room_3/Integrator1','InitialCondition',num2str(0));
set_param('Energy_Cost/House/Room_3/1st term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_3/2nd term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_3/3th term1','Gain',num2str(0));
set_param('Energy_Cost/House/Room_3/4th term1','Gain',num2str(0));

set_param('Energy_Cost/House/Room_3/1st term2','Gain',num2str(   0   ));
set_param('Energy_Cost/House/Room_3/2nd term2','Gain',num2str(   0   ));
set_param('Energy_Cost/House/Room_3/3th term2','Gain',num2str( 0  ));
set_param('Energy_Cost/House/Room_3/4th term2','Gain',num2str( 0 ));
set_param('Energy_Cost/House/Room_3/5th term2','Gain',num2str( 0 ));
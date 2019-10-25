function [Rw, Cw, Rc, Ci] = setParameters(Rw,Cw,Ci,Rc,b,NoRooms)



Rw1=Rw(1,1); Rw2=Rw(2,1); Rw3=Rw(3,1); Rw4=Rw(4,1);
Rc1=Rc(1,1); Rc2=Rc(2,1); Rc3=Rc(3,1); Rc4=Rc(4,1);
Cw1=Cw(1,1); Cw2=Cw(2,1); Cw3=Cw(3,1); Cw4=Cw(4,1);
Ci1=Ci(1,1); Ci2=Ci(2,1); Ci3=Ci(3,1); Ci4=Ci(4,1);



if NoRooms=1
%%
set_param('Energy_Cost/House/Room_1/%Loss','Value',num2str(b(1,1)/sum(b)));
set_param('Energy_Cost/House/Room_1/1st term1','Value',num2str(1/Cw1));
set_param('Energy_Cost/House/Room_1/2nd term1','Value',num2str((1/Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/3th term1','Value',num2str((1/Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/4th term1','Value',num2str((1/Rw1*Cw1)));

set_param('Energy_Cost/House/Room_1/1st term2','Value',num2str(   1/Ci1   ));
set_param('Energy_Cost/House/Room_1/2nd term2','Value',num2str(   1/Ci1   ));
% set_param('Energy_Cost/House/Room_1/3th term 2','Gain',num2str(  (1/Ci1)*( (1/Rw1) + (1/Rc1))  ));
set_param('Energy_Cost/House/Room_1/3th term2','Value',num2str(  (1/Ci1)*( (1/Rw1) + (1/Rc1))  ));
set_param('Energy_Cost/House/Room_1/4th term2','Value',num2str( 1/(Rw1*Ci1) ));
set_param('Energy_Cost/House/Room_1/5th term2','Value',num2str( 1/(Rc1*Ci1) ));

set_param('Energy_Cost/House/Room_1/%Loss','Value',num2str(b(1,1)/sum(b)));
set_param('Energy_Cost/House/Room_1/1st term1','Value',num2str(1/Cw1));
set_param('Energy_Cost/House/Room_1/2nd term1','Value',num2str((1/Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/3th term1','Value',num2str((1/Rw1*Cw1)));
set_param('Energy_Cost/House/Room_1/4th term1','Value',num2str((1/Rw1*Cw1)));

set_param('Energy_Cost/House/Room_1/1st term2','Value',num2str(   1/Ci1   ));
set_param('Energy_Cost/House/Room_1/2nd term2','Value',num2str(   1/Ci1   ));
% set_param('Energy_Cost/House/Room_1/3th term 2','Gain',num2str(  (1/Ci1)*( (1/Rw1) + (1/Rc1))  ));
set_param('Energy_Cost/House/Room_1/3th term2','Value',num2str(  (1/Ci1)*( (1/Rw1) + (1/Rc1))  ));
set_param('Energy_Cost/House/Room_1/4th term2','Value',num2str( 1/(Rw1*Ci1) ));
set_param('Energy_Cost/House/Room_1/5th term2','Value',num2str( 1/(Rc1*Ci1) ));










%%
set_param('Energy_Cost/House/Room_2/%Loss','Value',num2str(b(2,1)/sum(b)));
set_param('Energy_Cost/House/Room_2/1st term1','Value',num2str(Cw2));
set_param('Energy_Cost/House/Room_2/2nd term1','Value',num2str((Rw2*Cw2)));
set_param('Energy_Cost/House/Room_2/3th term1','Value',num2str((Rw2*Cw2)));
set_param('Energy_Cost/House/Room_2/4th term1','Value',num2str((Rw2*Cw2)));

set_param('Energy_Cost/House/Room_2/1st term2','Value',num2str(   Ci2   ));
set_param('Energy_Cost/House/Room_2/2nd term2','Value',num2str(   Ci2   ));
set_param('Energy_Cost/House/Room_2/3th term2','Value',num2str(  (1/Ci2)*( (1/Rw2) + (1/Rc2))  ));
set_param('Energy_Cost/House/Room_2/4th term2','Value',num2str( (Rw2*Ci2) ));
set_param('Energy_Cost/House/Room_2/5th term2','Value',num2str( (Rc2*Ci2) ));


%%
set_param('Energy_Cost/House/Room_3/%Loss','Value',num2str(b(3,1)/sum(b)));
set_param('Energy_Cost/House/Room_3/1st term1','Value',num2str(1/Cw3));
set_param('Energy_Cost/House/Room_3/2nd term1','Value',num2str(1/(Rw3*Cw3)));
set_param('Energy_Cost/House/Room_3/3th term1','Value',num2str(1/(Rw3*Cw3)));
set_param('Energy_Cost/House/Room_3/4th term1','Value',num2str(2/(Rw3*Cw3)));

set_param('Energy_Cost/House/Room_3/1st term2','Value',num2str(   1/Ci3   ));
set_param('Energy_Cost/House/Room_3/2nd term2','Value',num2str(   1/Ci3   ));
set_param('Energy_Cost/House/Room_3/3th term2','Value',num2str(  (1/Ci3)*( (1/Rw3) + (1/Rc3))  ));
set_param('Energy_Cost/House/Room_3/4th term2','Value',num2str( 1/(Rw3*Ci3) ));
set_param('Energy_Cost/House/Room_3/5th term2','Value',num2str( 1/(Rc3*Ci3) ));


%%
set_param('Energy_Cost/House/Room_4/%Loss','Value',num2str(b(4,1)/sum(b)));
set_param('Energy_Cost/House/Room_4/1st term1','Value',num2str(1/Cw4));
set_param('Energy_Cost/House/Room_4/2nd term1','Value',num2str(1/(Rw4*Cw4)));
set_param('Energy_Cost/House/Room_4/3th term1','Value',num2str(1/(Rw4*Cw4)));
set_param('Energy_Cost/House/Room_4/4th term1','Value',num2str(2/(Rw4*Cw4)));

set_param('Energy_Cost/House/Room_4/1st term2','Value',num2str(   1/Ci4   ));
set_param('Energy_Cost/House/Room_4/2nd term2','Value',num2str(   1/Ci4   ));
set_param('Energy_Cost/House/Room_4/3th term2','Value',num2str(  (1/Ci4)*( (1/Rw4) + (1/Rc4))  ));
set_param('Energy_Cost/House/Room_4/4th term2','Value',num2str( 1/(Rw4*Ci4) ));
set_param('Energy_Cost/House/Room_4/5th term2','Value',num2str( 1/(Rc4*Ci4) ));
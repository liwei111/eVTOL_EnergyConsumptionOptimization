%
function Wfuselage=fuselageWeight(mMotors,mBattery,mtow)
%
lbf2N=4.45;
%g
nz=6;
%
Wmotors = 11*mMotors*9.8;%
Wbattery = mBattery*9.8;
Wto=(mtow*9.8-Wmotors-Wbattery)/lbf2N;
%lbf/ft^2
q=115.95;
%ft
Lht=13.5;
%ft
Lfs=22.42;
%ft
dfs=7.67;
%ft^3
Vp=192.17;
%psi=lbf/ft^2
deltaP=8;

%% 
%ft
L1=5.5;
%ft
L2=8.22;
%ft
L3=3.92;
%ft
L4=8.69;
%ft
D=8.22;
%ft
d1=2.4;
%ft
d2=0.7;
%ft^3
Sf=pi*D/4*(1/(3*L1^2)*((4*L1^2+D^2/4)^1.5-D^3/8)-D+4*L2+2*(D+d1)/D*sqrt(L3^2+(D^2-d1^2)/4)+2*(d1+d2)/D*sqrt(L4^2+(d1^2-d2^2)/4));
%% lbf
Wfuselage_lbf=0.052*Sf^1.086*(nz*Wto)^0.177*Lht^-0.051*(Lfs/dfs)^-0.072*q^0.241+11.9*(Vp*deltaP)^0.271;
%N
Wfuselage=Wfuselage_lbf*lbf2N;
end

















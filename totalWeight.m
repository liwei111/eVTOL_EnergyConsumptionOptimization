
%
function [W0,Wwing,Wtail,Wfuselage]=totalWeight(mtow,mMotor,mBattery)
Wwing=wingWeight(mMotor,mBattery,mtow);
Wtail=tailWeight(mMotor,mBattery,mtow);
Wfuselage=fuselageWeight(mMotor,mBattery,mtow);
%(
lbf2N=4.45;
%g
nz=6;
%lbf；mtow,kg
% Wto=mtow*9.8/lbf2N;
Wmotors = 9*mMotor*9.8;
Wbattery = mBattery*9.8;
Wto=(mtow*9.8-Wmotors-Wbattery)/lbf2N;

%% 400*9.8N
Wpayload=3920;


%% 
%Fuselage structure length
Lfs=22.42;
%wingspan
b=38.3;
%
Wcontrol_lbf=0.053*Lfs^1.536*b^0.371*(nz*Wto*1e-4)^0.8;
Wcontrol=Wcontrol_lbf*lbf2N;


%% 
%Length of main landing gear
Lm=4.2;
%
WlangdingGear_lbf=0.054*(nz*Wto)^0.684*(Lm/12)^0.601;
WlangdingGear=WlangdingGear_lbf*lbf2N;

%% 
Wequipment_blf=0.0582*Wto-65;
Wequipment=Wequipment_blf*lbf2N;

%% 
Wavionics=15*9.8;

%% 
Welectric_lbf=12.57*(Wavionics/lbf2N)^0.51;
Welectric=Welectric_lbf*lbf2N;

%% correction factor 0.95
W0=0.95*(Wpayload+Wmotors+Wbattery+Wcontrol+WlangdingGear+Wequipment+Wavionics+Welectric+Wwing+Wtail+Wfuselage);
end











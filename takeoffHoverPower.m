% Estimate takeoffHover performance
function takeoffHoverOutput = takeoffHoverPower(rProp,W0,nMotor_r,PMotor_r)
etaProp=0.8;%
rho=1.225;%kg/m^3
AProp=pi*rProp^2;%
kProp=0.9;%
%
takeoffHoverOutput.Pm=W0*(sqrt(W0/(8*2*rho*AProp*kProp)))/etaProp;
% Max required T/W to handle rotor out w/ manuever margin 
ToverW = 1.7; 
%
takeoffHoverOutput.Pm_max=takeoffHoverOutput.Pm*ToverW;
etaESC=0.85;%
Ct=1.5;%
%
etaMotor=motor_eta_cal(sqrt(W0/(8*Ct*rho*(2*rProp)^4))*60,takeoffHoverOutput.Pm/8,takeoffHoverOutput.Pm_max/8,nMotor_r,PMotor_r*1000);
%
takeoffHoverOutput.Pb=takeoffHoverOutput.Pm/(etaMotor*etaESC);
end
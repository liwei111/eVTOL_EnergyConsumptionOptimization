% Estimate climb performance

function climbOutput = climbPower(takeoffHoverOutput)
Vcb=2;%climb 2m/s
Vth=2.5;%takeoffHover 2.5m/s
%
climbOutput.Pb=takeoffHoverOutput.Pb*(Vcb/(2*Vth)+sqrt((Vcb/(2*Vth))^2+1));
% % Max required T/W to handle rotor out w/ manuever margin  
% %
% climbOutput.Pm_max=takeoffHoverOutput.Pm_max*(Vcb/Vth+sqrt((Vcb/Vth)^2+1));
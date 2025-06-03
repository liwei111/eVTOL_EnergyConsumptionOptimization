% 
% function [E,W0,cruiseOutput,takeoffHoverOutput,climbOutput] =totalEneryConsumption(rProp,V,nMotor_r,PMotor_r,mtow,mMotor,mBattery)
function [E,W0,cruiseOutput,takeoffHoverOutput,climbOutput] =totalEneryConsumption(rProp,V,nMotor_r,PMotor_r,mtow,mMotor,mBattery,range)
[W0,~,~,~]=totalWeight(mtow,mMotor,mBattery);

% Compute cruise time
cruiseTime = sum(range) / V;


%Vertical take-off altitude 15m, cruise altitude 300m, hover 60s
%Compute takeoffhover time
%Assuming a vertical hover phase with an ascent velocity of 2.5m/s
Vth=2.5;
% takeoffHoverTime=15/Vth+60;
takeoffHoverTime=15/Vth+60*numel(range);


%Compute climb time
%Assuming a speed of 2m/s in the climb phase
Vcb=2;
climbTime=300/Vcb;

flightTime=takeoffHoverTime*2+climbTime*2+cruiseTime;

takeoffHoverOutput = takeoffHoverPower(rProp,W0,nMotor_r,PMotor_r);
cruiseOutput= cruisePower(V,W0,rProp,nMotor_r,PMotor_r,takeoffHoverOutput);
climbOutput = climbPower(takeoffHoverOutput);


%“dis_Char.m"，mBattery*1e3/76 real number of Single Cells,W
PLoss_allBattery=0.2558*mBattery*1e3/76;
ELoss_allBattery=PLoss_allBattery*flightTime;
% Compute total energy consumption (kW)
E = ( cruiseOutput.Pb * cruiseTime+3*takeoffHoverOutput.Pb*takeoffHoverTime+climbOutput.Pb*climbTime+ELoss_allBattery)*2.77778e-7;
end

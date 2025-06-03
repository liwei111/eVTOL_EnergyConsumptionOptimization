% Computes Optimization objective and constraints
%
% Inputs :
%  x     
% rProp = x(1);%
% V = x(2);%
% mBattery = x(3);%
% mMotors = x(4);%
% mtow = x(5);%
% PMotor_r = x(6);  %-Motor rated power[W]
% nMotor_r = x(7);%  -Rated motor speed[rev/min]

% Outputs :
%  f - total energy consumption[J]
%  c - nonlinear inequality constraints  
%      - Available energy in the battery > energy required  
%      - Motor power available > motor power required  
%      - Takeoff mass > computed mass   
% function [f,c] = objectiveAndConstraints(x)
function [f,c] = objectiveAndConstraints(x,range)% Unpack design variables
    rProp = x(1);%
        V = x(2);%
 mBattery = x(3);%
   mMotor = x(4);%
     mtow = x(5);%
 PMotor_r = x(6);%-Motor rated power[KW]
 nMotor_r = x(7);%-Rated motor speed[rev/min]
 
% Assumed values
batteryEnergyDensity = 300;
% Expected pack energy density in 3-5 years [Wh/kg]  
% % 


% kW/kg, including controller and other accessories in 3-5 years 6-10kW/kg
motorPowerDensity = 6; 


% Can only use 95% of battery energy in reserve mission  95%
% dischargeDepthReserve = 0.95;

% [E,~,cruiseOutput,takeoffHoverOutput,~] =totalEneryConsumption(rProp,V,nMotor_r,PMotor_r,mtow,mMotor,mBattery);  
[E,~,cruiseOutput,takeoffHoverOutput,~] =totalEneryConsumption(rProp,V,nMotor_r,PMotor_r,mtow,mMotor,mBattery,range);
% weight estimate 
[W0,~,~,~]=totalWeight(mtow,mMotor,mBattery);

%
f = E;


% Constraints  
% Constraint on available energy (E is in KW)
c(1) =1.2*E- mBattery * batteryEnergyDensity/1000 ; 

% Constraint on available motor power (kW)%
c(2) =takeoffHoverOutput.Pm_max/1000/8- mMotor * motorPowerDensity;
% Constraint on MTOW
c(3) = W0 - mtow * 9.8;

c(4)=500*10*0.000155*2.3*9333*2.3-mBattery*batteryEnergyDensity*0.2;%500 flights per year for 10 years

rho=1.225;
Sw=144.9*0.3*0.3;
CL=0.5;
c(5)=sqrt(2*W0/CL/rho/Sw)-V;
c(6)=cruiseOutput.Pm/1000/5-PMotor_r;
end
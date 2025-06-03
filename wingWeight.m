%
function  Wwing=wingWeight(mMotors,mBattery,mtow)
%
lbf2N=4.45;
%ft^2
Sw=144.9;
%
ARw=10.12;
%1/4 ° 
theta=0;
%lbf/ft^2
q=115.95;
%
lambda_w=0.53;
%
t_c_w=0.15;
%g
nz=6;
%
% Wto=mtow*9.8/lbf2N;
Wmotors = 11*mMotors*9.8;%
Wbattery = mBattery*9.8;
Wto=(mtow*9.8-Wmotors-Wbattery)/lbf2N;
%lbf
Wwing_lbf=0.036*Sw^0.758*(ARw/cos(theta).^2)^0.6*q^0.006*lambda_w^0.04*(100*t_c_w/cos(theta).^2)^-0.3*(nz*Wto)^0.49;
%N
Wwing=Wwing_lbf*lbf2N;
end





%
function Wtail=tailWeight(mMotors,mBattery,mtow)
%
lbf2N=4.45;
%
q=115.95;
%
nz=6;
%
Wmotors = 11*mMotors*9.8;%
Wbattery = mBattery*9.8;
Wto=(mtow*9.8-Wmotors-Wbattery)/lbf2N;

%% 
%ft^2
Sht=56.27;
%
ARht=2.95;
%
theta_ht=deg2rad(5);
%
lambda_ht=0.66;
%
t_c_ht=0.1;
%
Wht_lbf=0.016*(nz*Wto)^0.414*q^0.168*Sht^0.896*(100*t_c_ht/cos(theta_ht))^-0.12*(ARht/cos(theta_ht)^2)^0.043*lambda_ht^-0.02;



%% 
%
Svt=16.28;
%
ARvt=1.73;
%1/4
theta_vt=deg2rad(18);
%
lambda_vt=0.5;
%
t_c_vt=0.1;
%lbf
Wvt_lbf=0.073*(nz*Wto)^0.376*q^0.122*Svt^0.873*(100*t_c_vt/cos(theta_vt))^-0.49*(ARvt/cos(theta_vt)^2)^0.357*lambda_vt^-0.032;



%% lbf
Wtail_lbf=Wht_lbf+Wvt_lbf;
%N)
Wtail=Wtail_lbf*lbf2N;
end
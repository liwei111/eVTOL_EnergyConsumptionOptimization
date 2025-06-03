% [Wpayload,Wmotors,Wbattery,Wcontrol,WlangdingGear,Wequipment,Wavionics,Welectric,Wwing,Wtail,Wfuselage]
%%
%%Decomposed bar stacks of maximum takeoff mass for different cruise ranges
subplot(2,2,1)
x1=[3920 849.37 4366 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise range:100km
x2=[3920 1079.7 6943.4 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise range:150km
x3=[3920 1407.7 10742 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise range:200km
y1=[x1/9.8;x2/9.8;x3/9.8];%total mass
E1=[111.387;177.13;274.04];%energy consumption
ranges=100:50:200;
ranges = ranges';%ranges = (10:10:200) * 1e3
 b1=bar(ranges,y1,0.4,'stacked');
 ylim([0,2200])
 xlabel('Range [km]')
 ylabel('Mass [kg]')
%  legend('Payload','Motors','Battery','Control','Langding gear','Equipment','Avionics','Electric','Wing','Tail','Fuselage')
hold on;
%%
%%different cruise heights
subplot(2,2,2)
x2=[3920 1079.7 6943.4 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise range:150km
x4=x2;%cruise height:300m
x5=[3920 1104.3 7582.3 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise height:400m
x6=[3920 1133.4 8267.3 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise height:500m
y2=[x4/9.8;x5/9.8;x6/9.8];
heights=300:100:500;
 heights= heights';
b2=bar(heights,y2,0.4,'stacked');
% xlim([30,770])
ylim([0,2200])
xlabel('Cruise height [m]')
ylabel('Mass [kg]')
% legend('Payload','Motors','Battery','Control','Langding gear','Equipment','Avionics','Electric','Wing','Tail','Fuselage')
hold on;
%%
%%different hover times
subplot(2,2,3)
x2=[3920 1079.7 6943.4 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%cruise range:150km
x7=x2;%hover time:60s
x8=[3920 1109.6 7724.4 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%hover time:90s
x9=[3920 1146.6 8575.3 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%hover time:120s
y3=[x7/9.8;x8/9.8;x9/9.8];
times=60:30:120;
times= times';
b3=bar(times,y3,0.4,'stacked');
% xlim([-20,200])
ylim([0,2200])
xlabel('Hover time [s]')
ylabel('Mass [kg]')
% legend('Payload','Motors','Battery','Control','Langding gear','Equipment','Avionics','Electric','Wing','Tail','Fuselage')
hold on;
set(gcf, 'Position', [100, 100, 500, 700]);
legend({'Payload','Motors','Battery','Control','Langding gear','Equipment','Avionics','Electric','Wing','Tail','Fuselage'},'location','best');
%%
%%Pie chart of maximum takeoff mass decomposition at a cruise range of 150km
%  x2=[3920 1079.7 6943.4 114.83 73.2 175.24 147 332.94 1160 304.52 2447];%150km
%  pie(x2);
%  legend('Payload','Motors','Battery','Control','Langding gear','Equipment','Avionics','Electric','Wing','Tail','Fuselage')

%%
%%Variation of battery output power in each flight phase with different cruise ranges
% subplot(3,1,1)
% x1=[  0,    6,60,    61,  211,  212, 1840,1841,  1991, 1992 , 2052,2058];%100km
% x2=[  0,    6,60,    61,  211,  212, 2594,2595,  2745, 2746 , 2812,2818];%150km
% x3=[  0,    6,60,    61,  211,  212, 3062,3063,  3213, 3214 , 3274,3280];%200km
% 
% y1=[0,322,322,475.3,475.3,149.9,149.9,475.3,475.3,322,322,  0];
% y2=[0,423.3,423.3,624.8,624.8,190.9,190.9,624.8,624.8,423.3,423.3,  0];
% y3=[0,552.7,552.7,790.4,790.4,261.8,261.8,790.4,790.4,552.7,552.7,  0];
% plot(x1,y1,'r-' ,x2,y2,'b-',x3,y3,'g-'); 
% xlabel('Time [s]')
% ylabel('Power [kW]')
% legend('100 km','150 km','200 km'); 
% hold on;
% %
% %different cruise heights
% subplot(3,1,2)
% h1=[  0,    6,60,    61,  211,  212, 2594,2595,  2745, 2746 , 2812,2818];%300m
% h2=[  0,    6,60,    61,  261,  262, 2600,2601,  2801, 2802 , 2862,2868];%400m
% h3=[  0,    6,60,    61,  311,  312, 2604,2605,  2855, 2856 , 2916,2922];%500m
% 
% H1=[0,423.3,423.3,624.8,624.8,190.9,190.9,624.8,624.8,423.3,423.3,  0];
% H2=[0,439.4,439.4,628.3,628.3,203.6,203.6,628.3,628.3,439.4,439.4,  0];
% H3=[0,451.8,451.8,646.1,646.1,217.9,217.9,646.1,646.1,451.8,451.8,  0];
%  plot(h1,H1,'r-' ,h2,y2,'b-',h3,H3,'g-'); 
% xlabel('Time [s]')
% ylabel('Power [kW]')
% legend('300 m','400 m','500 m'); 
% hold on;
% %
% %different hover times
% subplot(3,1,3)
% t1=[  0,    6,60,    61,  211,  212, 2594,2595,  2745, 2746 , 2812,2818];%60s
% t2=[  0,    6,90,    91,  241,  242, 2570,2571,  2721 ,2722,  2782,2788];%90s
% t3=[  0,    6,120,  121,  271,  272, 2544,2545,  2695, 2696 , 2756,2762];%120s
% 
% T1=[0,423.3,423.3,624.8,624.8,190.9,190.9,624.8,624.8,423.3,423.3,  0];
% T2=[0,441.9,441.9,631.9,631.9,206.5,206.5,631.9,631.9,441.9,441.9,  0];
% T3=[0,444.6,444.6,635.8,635.8,225.6,225.6,635.8,635.8,444.6,444.6,  0];
%  plot(t1,T1,'r-' ,t2,T2,'b-',t3,T3,'g-'); 
% xlabel('Time [s]')
% ylabel('Power [kW]')
% legend('60 s','90 s','120 s'); 


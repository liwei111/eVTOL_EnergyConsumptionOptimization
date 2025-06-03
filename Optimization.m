%
function [] = Optimization ()
clear
clc


plotOn = true;
ranges = (100:50:200) * 1e3;% m 
% ranges = 150 * 1e3;

% Reset random number generator for repeatability
rng('default');

% Optimization options
options = optimset('display','notify','Algorithm','interior-point',...
'ScaleProblem','obj-and-constr','MaxIter',5e3,'MaxFunEvals',2e4,'FinDiffType','central');

% Number of random optimization restarts to try since there may be local
% minima 
nRestart = 2;

% Flags indicating that previous range has converged for a given config 
exitflagT = 1; % Tilt-wing

% Function / Objective calls
xLast = []; % Last place computeall was called 
myf = []; % Use for objective at xLast  
myc = []; % Use for nonlinear inequality constraint 


for i = 1:length(ranges)
    
    disp(['Range = ',num2str(ranges(i)/1000),' km']);
    range = ranges(i);



    if i == 1
        x0 = [1, 60, 700, 30, 1500,30,3500];
    else
        x0 = xT;
    end



      lb = [0.3, 30, 200,  5, 800,20,2000];
      ub = [  2, 80, 1100, 20, 2500,60,6000];


    
    if exitflagT > 0 % Don't run if it hasn't converged at the previous speed
        
        [xT,fval,exitflagT,output] = fmincon(...
            @(x) objfun(x,range),...
            x0,[],[],[],[],lb,ub,...
            @(x) confun(x,range),...
            options);
        
        % Run Multistart cases to try again
        for k = 1:nRestart
            [xTmp,fvalTmp,exitflagTmp,outputTmp] = fmincon(...
                @(x) objfun(x,range),...
                lb + rand(size(x0)).*(ub-lb),[],[],[],[],lb,ub,...
                @(x) confun(x,range),...
                options);
            
            % Save if previous solution didn't converge, or if this is a
            % better solution
            if exitflagT < 1 || (fvalTmp < fval && exitflagTmp == 1)
                xT = xTmp;
                fval = fvalTmp;
                exitflagT = exitflagTmp;
                output = outputTmp;
            end
        end
        
        if exitflagT > 0
            
            
        disp('Minimum Energy Consumption eVTOL-aircraft Design');
        disp('************************************************');
        disp([' Total Energy Consumption [kWh]: ',num2str(fval)]);
        disp(['               Rotor Radius [m]: ',num2str(xT(1))]);
        disp(['             Cruise Speed [m/s]: ',num2str(xT(2))]);
        disp(['              Battery Mass [kg]: ',num2str(xT(3))]);
        disp(['                Motor Mass [kg]: ',num2str(xT(4))]);
        disp(['      Maximum Takeoff Mass [kg]: ',num2str(xT(5))]);
        disp(['         Rated Motor Power [kW]: ',num2str(xT(6))]);
        disp(['    Rated Motor Speed [rev/min]: ',num2str(xT(7))]);
        
        
             rProp(i) = xT(1); 
                 V (i)= xT(2); 
          mBattery = xT(3);
            mMotor = xT(4);
              mtow = xT(5);
            PMotor_r=xT(6);
            nMotor_r=xT(7);
%             [~,~,~,~,~] =totalEneryConsumption(rProp,V,nMotor_r,PMotor_r,mtow,mMotor,mBattery);
              [E(i),W0,cruiseOutput(i),takeoffHoverOutput(i),climbOutput(i)] =totalEneryConsumption(rProp(i),V(i),nMotor_r,PMotor_r,mtow,mMotor,mBattery,range);
              [W0,Wwing,Wtail,Wfuselage]=totalWeight(mtow,mMotor,mBattery);
              
        else
            disp('Optimization failed for Tilt-Wing!');
            disp(output);
        end
    end  
end
save('opStudyResults.mat');
% %   if plotOn
%     plotTradeResults();
% end

%%only show eVTOL results
% if plotOn
%     plotTradeResults_eVTOL();
% end

    % Compute objective and constraint values in the same function. Only
    % re-run if the inputs have changed.
    function y = objfun(x,range)
        
        if ~isequal(x,xLast) % Check if computation is necessary
            [myf,myc] = objectiveAndConstraints(x,range);
            xLast = x;
        end
        
        % Now compute objective function
        y = myf;
    end

    function [c,ceq] = confun(x,range)
        
        if ~isequal(x,xLast) % Check if computation is necessary
            [myf,myc] = objectiveAndConstraints(x,range);
            xLast = x;
        end
        
        % Now compute constraint functions
        c = myc; % In this case, the computation is trivial
        ceq = [];
    end
end

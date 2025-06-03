function eta = motor_eta_cal(n,P,P_max,n_r,P_r)
%W,rev/min;

%    eta = [];
%    for i = 1:length(n)
   if n<=n_r
      eta = P./(P+1.064*((n_r*P./n./P_max).^2*191.4373+(n./n_r).^2.*35.6917+(n./n_r).*35.6917+1.11*1e-5*n.^0.7*P_r));
   else
      eta = P./(P+1.064*((P./P_max).^2.*191.4373+(n./n_r).^0.6*35.6917+35.6917+1.11*1e-5.*n.^0.7.*P_r).*1.064);
   end
   
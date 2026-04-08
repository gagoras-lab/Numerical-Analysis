% H synarthsh dixot ylopoiei th me8odo ths dixotomhshs gia thn 
% eyresh ths rizas ths synarthshs f  sto diasthma [xa, xb].
% yota@uth.gr, May 2005


function [xstar, iter] = dixot(f, xa, xb, tol)

hold on; plot([xa, xb], [0 0],'ro'); hold off;
iter = 0;
fa = feval(f, xa);
fb = feval(f, xb);
while (abs(xb-xa) > tol)
   xnew = (xa+xb)/2 
   fnew = feval(f, xnew);
   if sign(fnew) == sign(fb)
      xb = xnew;
      fb = fnew;
   else
      xa = xnew;
      fa = fnew;
   end
   hold on; plot(xnew, 0,'ro'); hold off;
   iter = iter + 1 ; 
   disp('Parathreiste thn grafikh parastash. Pateiste enter na synexisete.');pause
 end

xstar = xnew;



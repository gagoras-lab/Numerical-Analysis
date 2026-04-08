% H synarthsh newtonc ylopoiei th me8odo tou Newton gia thn 
% eyresh ths rizas ths synarthshs f(x) = ekfrash me arxikh timh to x0.
% yota@uth.gr, March 2019, R2018a


function [xstar, iter] = newton(ekfrash, x0, tol, maxiter)

f = inline(ekfrash);
df = inline(diff(ekfrash)) ; 

fid = fopen('newton.dat','w');
fprintf(fid,'Iter        xold              xnew           fxnew\n');
fprintf(    'Iter        xold              xnew           fxnew\n');
hold on; plot(x0, 0,'ro'); hold off;

xold = x0;
fxold = feval(f, xold);
dfxold = feval(df,xold);

if abs(dfxold) <= eps
   fprintf('H paragwgos mhdenizetai sto %f kai h me8odos Newton den mporei na synexisei.\n',xold);
   return;
end

xnew = xold - fxold/dfxold;
fxnew = feval(f, xnew); 

fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',1, xold, xnew, fxnew);
fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',1, xold, xnew, fxnew);
hold on; plot(xnew, 0,'ro'); hold off;

iter = 1;
while (iter < maxiter) & (abs(xold-xnew) > tol)
   xold = xnew;
   fxold = fxnew; 
   dfxold = feval(df, xold);
   if abs(dfxold) > eps
      xnew = xold - fxold/dfxold;
      fxnew = feval(f, xnew);
      fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',iter+1, xold, xnew, fxnew);
      fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',iter+1, xold, xnew, fxnew); 
      hold on; plot(xnew, 0,'ro'); hold off;
   else
      fprintf('H paragwgos mhdenizetai sto %f kai h me8odos Newton den mporei na synexisei.\n',xold);
      xstar = xnew;
      return;
   end
   iter = iter + 1 ;
  pause
 end

xstar = xnew;
fclose(fid);


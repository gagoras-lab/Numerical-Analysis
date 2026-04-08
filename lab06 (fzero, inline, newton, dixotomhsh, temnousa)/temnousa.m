% H synarthsh dixot ylopoiei th me8odo ths temnousas gia thn 
% eyresh ths rizas ths synarthshs f(x) = ekfrash me arxikh timh to x0,x1.
% version 7 tou Matlab
% yota@uth.gr, March 2018, R2017a


function [xstar, iter] = temnousa(ekfrash, x0, x1,tol, maxiter)

fid = fopen('temnousa.dat','w');
fprintf(fid,'Iter        xold              xnew           fxnew\n');
fprintf(    'Iter        xold              xnew           fxnew\n');
hold on; plot([x0, x1], [ 0,0],'ro'); hold off;


f = inline(ekfrash);
xnm1 = x1;
xnm2 = x0;
fnm1 = feval(f,xnm1);
fnm2 = feval(f,xnm2);

if abs(fnm2-fnm1) <= eps
   fprintf('H paragwgos mhdenizetai sto %f kai h me8odos ths Temnousa den mporei na synexisei.\n',xnm1);
   xstar = xnm1; iter = 0;
   return;
end
xnew = xnm1 - fnm1*(xnm2-xnm1)/(fnm2-fnm1);
x = xnew;
fxnew = feval(f,xnew); 
fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',1, xnm1, xnew, fxnew);
fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',1, xnm1, xnew, fxnew);
iter = 1;
while (iter < maxiter) & (abs(xnew-xnm1) > tol)
   xnm2 = xnm1;
   xnm1 = xnew;
   fnm2 = fnm1;
   fnm1 = fxnew; 
   if abs(fnm2-fnm1) > eps
      xnew = xnm1 - fnm1*(xnm2-xnm1)/(fnm2-fnm1);
      x = xnew;
      fxnew = feval(f,xnew);
      fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',iter+1, xnm1, xnew, fxnew);
      fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',iter+1, xnm1, xnew, fxnew); 
      hold on; plot(xnew, 0,'ro'); hold off;     
   else
      fprintf('H paragwgos mhdenizetai sto %f kai h me8odos ths Temnousas den mporei na synexisei.\n',xold);
      xstar = xnew;
      return;
   end
   iter = iter + 1 ;
 end

xstar = xnew;
fclose(fid);


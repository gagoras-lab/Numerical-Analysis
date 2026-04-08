%% H synarthsh ayth ylopoiei thn epanalhptikh me8odo gauss-seidel
%% Kaleite me [sol err it] = gs(a, x0, b, tol, maxiter), opou 
%% a = pinakas, b = deksio melos, 
%% x0 = arxikh proseggish ths lyshs,
%% tol = megisto apodekto sfalma sthn me8odo,  
%% maxiter = megistos ari8mos epanalhpsewn
%% sol = h lysh toy systhmatos
%% err = sfalma ths me8odou
%% iter = plh8os epnalhpsewn pou eginan
%%
%% yota@uth.gr

function [sol, err, it] = gs(a , x0, b, tol, maxiter)

xold = x0;
error = tol + 1;
iter = 0;
d = tril(a);
mat = - triu(a, 1);
%clf
xlabel('iterations');
ylabel('log_{10} of error , ||.||_2');
hold on;
while (iter < maxiter & error > tol)
  xnew = d\(mat*xold + b);
  error = norm(xnew - xold);
  xold = xnew;
  iter = iter + 1;
  fprintf('Sthn %d epanalhpsh to diadoxiko sfalma %f12.8 . \n',...
      iter,error );
  plot([iter],[log10(error)], 'g*');
end
gtext('Gauss-Seidel iterations');
err = error;
it = iter; 
sol = xnew;
end
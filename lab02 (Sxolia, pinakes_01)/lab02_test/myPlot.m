% Ονοματεώνυμο:: Γεράσιμος Αγοράς
% ΑΕΜ:: 02947
% Τμήμα:: 1ο

% Filename - myPlot.m
% function - myPlot(n)
% This function plots functions related to complexity
function [x, y1, y2, y3, y4] = myPlot(n)



x = [1:n];

y1 = log2(x);
y2 = 2.^x;
y3 = x.^2;
y4 = x;


subplot(2,1,1);
plot(x,y1,'',x,y2,'',x,y3,'',x,y4,'');
xlabel('x');
ylabel('y');
legend('y=log_{2}(x) logaritmic','y=2^x exponential','x^2 square','x linear');
legend('Location','northwest');
title('Linear Scales');


subplot(2,1,2);
loglog(x,y1,'',x,y2,'',x,y3,'',x,y4,'');
xlabel('log(x)');
ylabel('log(y)');
legend('y=log_{2}(x) logaritmic','y=2^x exponential','x^2 square','x linear'); 
legend('Location','northwest');
title('Logarithmic Scales');

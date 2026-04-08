%% ECE220 - ARI8MHTIKH ANALYSH
%% Ergatshrio 7
%% SYNEXEIA STHN EISAGWGH STO MATLAB. EISAGWGH STHN PAREMBOLH
%% yota@uth.gr

%% ASKHSH 1
disp('ASKHSH 1'); pause; figure(1); clf; clear all;

% dhmiourgia kombwn parembolhs
xinterp = [0:pi/4: 2*pi]';
yinterp = sin(xinterp);

%dhmioyrgia shmeiwn gia grafikes parastaseis
xplot = linspace(0, 2*pi, 500);
yplot = sin(xplot); % tetagmenes shmeiwn gia grafikh parastash
plot(xplot, yplot, 'k','LineWidth',2); hold on
plot(xinterp, yinterp, 'ok')

pause
% dhmioyrgia polyonymoy parembolhs
M = vander(xinterp);
p = M\yinterp;

y1=polyval(p, xplot);
plot(xplot, y1,'c-.','LineWidth',2)

pause
% parembolh me grammikh spline
yls=interp1(xinterp,yinterp,xplot,'linear');
plot(xplot, yls,'r-','LineWidth',2)

pause
% parembolh me kybikh spline
ycs=interp1(xinterp,yinterp,xplot,'spline');
plot(xplot, ycs,'g-','LineWidth',2)
pause

%%%
%%%%
%% ASKHSH 2
disp('ASKHSH 2'); pause;figure(1); clf; clear all;

x = [-3:0.5:3]';
n = length(x);
y = 1./(1+25*x.^2);

xplot = linspace(-3,3, 601); % tetmhmenes shmeiwn gia grafikh parastash
yplot = 1./(1+25*xplot.^2); % tetagmenes shmeiwn gia grafikh parastash
plot(xplot, yplot, 'k','LineWidth',2); hold on
plot(x,y,'ko')

M = vander(x);
p = M\y;

y1=polyval(p, xplot);
plot(xplot, y1,'c-','LineWidth',2)

pause

xi=-3:.1:3;
y2=interp1(x,y',xplot,'linear');
plot(xplot,y2,'r-','LineWidth',2)
  
pause

y2=interp1(x,y',xplot,'spline');
plot(xplot , y2,'b-','LineWidth',2)



%% ASKHSH 3
%% Xrhsimopoihste thn interp2 gia na kanete parembolh sth synarthsh 2 metablhtwn
%% f(x,y)=z =  3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ... 
%% - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ... 
%% - 1/3*exp(-(x+1).^2 - y.^2) 
%% kai pou einai ylopoihmenh sto Matlab san PEAKS,
%% sta shmeia -3:.5:3. Ypologiste thn parembalousa sta shmeia -3:.125:3.
%% Xrhsimopoihste thn meshgrid gia na ftiaksete ta plegmata gia thn
%% synarthsh kai thn parembalousa.

disp('ASKHSH 3'); pause;figure(1); clf; clear all;
[X,Y]=meshgrid(-3:.5:3);
Z=peaks(X,Y);
[XI,YI]=meshgrid(-3:.125:3);
ZI=interp2(X,Y,Z,XI,YI);
colormap('jet');
mesh(X,Y,Z); hold; mesh(XI,YI,ZI+10);
hold off;
axis([-3 3 -3 3 -5 35])

%% ASKHSH 4
%% Xrhsimopoihste thn interp3 gia na kanete parembolh sth synarthsh 3 metablhtwn
%% pou einai ylopoihmenh sto Matlab san FLOW , se ena plegma apo 20x10x10
%% shmeia. Kante parembolh sta shmeia x=.1:.1:10, y=-3:.1:3, z=-3:.1:3 
%% Xrhsimopoihste thn meshgrid gia na ftiaksete to plegma gia thn
%% parembalousa.
 
pause; figure(2); clf; clear all; disp('ASKHSH 4'); 
[x,y,z,v]=flow(10);
[xi,yi,zi]=meshgrid(.1:.1:10, -3:.1:3, -3:.1:3);
vi=interp3(x,y,z,v,xi,yi,zi);  
slice(xi,yi,zi,vi,[6 9.5],2,[-2 .2])
shading flat
figure(3);
slice(xi,yi,zi,vi,[.1  10],[-3  3],[-3 3])
shading flat





% % % dhmioyrgia shmeiwn Chebychev sto [0, 2pi]
% % xcheb = pi*( 1 + cos( ( (2*[0:10]+1)/(2*11) )*pi )  )';
% % ycheb = sin(xcheb);
% % 
% % % dhmioyrgia polyonymoy parembolhs
% % Mcheb = vander(xcheb);
% % pcheb = M\ycheb;
% % 
% % y2=polyval(pcheb, xplot)
% % plot(xcheb, ycheb, '*k', xplot, -y2, 'g')




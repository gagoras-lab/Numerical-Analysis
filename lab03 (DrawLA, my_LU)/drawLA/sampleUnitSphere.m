function x = sampleUnitSphere(d, n)
% Sample unit sphere
%
% Usage: x = sampleUnitSphere(d, n)
% INPUT:
% d     - {2,3} dimension;
% n     - integer, number of samples.
% OUTPUT:
% x     - d-by-n matrix of sample points.
%         in 2D samples are chosen regularly, i.e., equidistant;
%         in 3D samples are chosen randomly from a uniform distribution.
%
% Examples:
% X = sampleUnitSphere(2,10); figure(1); clf; drawVector(X);
% X = sampleUnitSphere(3,50); figure(1); clf; drawVector(X);
%
% See also: drawVector.

error(nargchk(2,2,nargin));
switch d
    case 2
        phi = 0:2*pi/n:2*pi - 2*pi/n;
        x = [sin(phi); cos(phi)];
    case 3
        xyz = randn(3,n);
        d = sqrt(sum(xyz.^2));
        x = xyz*diag(1./d);
    otherwise
        error('Wrong dimension parameter');
end

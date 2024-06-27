function [pos,dist,slope] = center2(Pa,Pb,Pc)
% CENTER calculates and shows the orthocenter, circumcenter, barycenter and
% incenter of a triangle, given their vertex's coordinates Pa, Pb and Pc
%%case 'incenter'% -->1
    %case 'barycenter' -->2
    %case 'circumcenter' -->3
    %case 'orthocenter' -->4
% Example: center2([0 0.5], [1 0], [1 1])
%
% Made by: Ing. Gustavo Morales, University of Carabobo, Venezuela.
% 09/14/09
% Modified by: Avishek Nandi, Visva-Bharati, Santiniketan.
%
% Init
pos = zeros(3,3);
dist = zeros(1,3);
slope = zeros(1,3);

% Increase Dimention
Pa = [Pa,0];
Pb = [Pb,0];
Pc = [Pc,0];

Pa = Pa(:); Pb = Pb(:); Pc = Pc(:); % Converting to column vectors (if needed)
AB = Pb - Pa; AC = Pc - Pa; BC = Pc - Pb; % Side vectors


%case 'incenter'%
uab = AB./norm(AB); uac = AC./norm(AC); ubc = BC./norm(BC); uba = -uab;
L1 = uab + uac; L2 = uba + ubc; % directors
P21 = Pb - Pa;
P1 = Pa;
ML = [L1 -L2]; % Coefficient Matrix
lambda = ML\P21;  % Solving the linear system
pos(1,:) = P1 + lambda(1)*L1; % Line Equation evaluated at lambda(1)

%case 'centroid'
L1 = (Pb + Pc)/2 -Pa; L2 = (Pa + Pc)/2 - Pb; % directors
P21 = Pb - Pa;
P1 = Pa;
ML = [L1 -L2]; % Coefficient Matrix
lambda = ML\P21;  % Solving the linear system
pos(2,:) = P1 + lambda(1)*L1; % Line Equation evaluated at lambda(1)

%case 'circumcenter'
N = cross(AC,AB);
L1 = cross(AB,N); L2 = cross(BC,N); % directors
P21 = (Pc - Pa)/2;
P1 = (Pa + Pb)/2;
ML = [L1 -L2]; % Coefficient Matrix
lambda = ML\P21;  % Solving the linear system
pos(3,:) = P1 + lambda(1)*L1; % Line Equation evaluated at lambda(1)


% reduce
pos = pos(:,1:2);

% find distance
m = 1;
for i = 1:3
    for j = i+1:3
        x = pos(i,:);
        y = pos(j,:);
        d = sqrt(sum((x-y).^2));
        dist(m) = d;
        
        z = y - x;
        slope(m) = atan(z(1)/z(2));
        m = m + 1;
    end
end
        
        

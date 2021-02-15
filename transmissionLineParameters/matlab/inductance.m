% for calculation of inductace of in single transmission wire per unit length

r = 0.005 % radius of cross-section area of conductor (m^2)
GMR = 0.7788*r % geometric mean radius
meu = 4*pi*10^(-7) % magnetic permebility in non-magnetic material

% distance array
d = 0:0.1:1

% inductance value array at per distance
l = (meu/(2*pi))*log(d/GMR)

% for ploting the graph
figure
plot(d,l)
title('Inductance of single transmission line')
xlable('distance form the wire')
ylable('inductance value in Henry/meter')

% Inductance of Three-Phase Transmission Line in Asymmetrical Arrangement per unit length

% case 1. when all conductor are symmerical, means
% Ia + Ib + Ic = 0
% D = Dac = Dab = Dbc

D = 0.5 % (m^2)

% then inductance of three pahse transmission line per phase per unit length
l = (meu/(2*pi))*log(D/GMR)

% case 2. for transposed three phase transmission line

Dab = 0.6
Dbc = 0.4
Dac = 0.5

GMD = (Dab+Dbc+Dac)^(1/3) % geomertic mean distances

% then inductance of three pahse transmission line per phase per unit length
l = (meu/(2*pi))*log(GMD/GMR)
% for calculation of inductace of in transmission line per unit length

disp('########## WELCOME ##########')
disp('enter the radius of conductor (m^2) ');
% radius of cross-section area of conductor
r = input('>> ');

% conditions
disp('########## Choose an option ##########')
disp('1. For single conductor')
disp('2. For three phase transmission line ')

opt1 = input('>> ');

if opt1 == 1
    disp('Enter the value of distance from the wire')
    d = input('>> ');
    calcInductance(d,r)
else
    disp('########## Choose the option ##########')
    disp('1. For symmetrical arrangement')
    disp('2. For Transposed arrangment')
    
    opt2 = input('>> ');
    
    if opt2 == 2
        Dab = input('Enter the distance between conductor A and conductor B');
        Dbc = input('Enter the distance between conductor B and conductor C');
        Dca = input('Enter the distance between conductor C and conductor A');
        % geometric mean distance
        GMD = (Dab+Dbc+Dca)^(1/3);
        calcInductance(GMD,r)
    else
        D = input('Enter the distance between conductors');
        calcInductance(D,r)
    end
end

% for calculation of inductance
function l = calcInductance(d,r)
    % magnetic permebility in non-magnetic material
    meu = 4*pi*10^(-7);
    % geometric mean radius
    GMR = 0.7788*r;
    % inductance
    l = (meu/(2*pi))*log(d/GMR);
    disp(l)
    % graph
    disp('If you want to plot the graph, then enter the max-limit of distance')
    dMax = input('>> ');
    varD = d:0.1:dMax;
    varL = (meu/(2*pi))*log(varD/GMR);
    plotGraph(varD,varL)
end

% for ploting the graph
function msg = plotGraph(x,y)
    figure
    plot(x,y)
    title('Inductance of transmission line')
    xlabel('distance (m)')
    ylabel('inductance (H/m)')
    msg = 'ploting graph...';
end
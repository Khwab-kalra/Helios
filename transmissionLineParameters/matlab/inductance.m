% for calculation of inductace of in transmission line per unit length

disp('########## WELCOME ##########')
disp('enter the GMR of conductor (m^2) ')
% Geometric mean radius of conductor
GMR = input('>>');
No Of conductors = input("Enter number of conductors");



% conditions
disp('########## Choose an option ##########');
disp('1. For single Phase System');
disp('2. For three phase transmission line ');

opt1 = input('>> ');

if opt1 == 1
    disp('Enter the value of distance from the wire');
    d = input('>> ');
    calcInductance(d,GMR)
else
    disp('########## Choose the option ##########');
    disp('1. For symmetrical arrangement');
    disp('2. For Transposed arrangment');
    
    opt2 = input('>> ')
    
    if opt2 == 2
        Dab = input('Enter the distance between conductor A and conductor B');
        Dbc = input('Enter the distance between conductor B and conductor C');
        Dca = input('Enter the distance between conductor C and conductor A');
        % geometric mean distance
        GMD = (Dab+Dbc+Dca)^(1/3)
        calcInductance(GMD,GMR)
    else
        D = input('Enter the distance between conductors');
        calcInductance(D,GMR)
    end
end

% for calculation of inductance
function l = calcInductance(d,GMR)
    % magnetic permebility in non-magnetic material
    meu = 4*pi*10^(-7)
    calcGMRL()
    % inductance
    l = (meu/(2*pi))*log(d/GMRL)
    disp(l);
    % graph
    disp('If you want to plot the graph, then enter the max-limit of distance');
    dMax = input('>> ');
    varD = d:0.1:dMax;
    varL = (meu/(2*pi))*log(varD/GMRL)
    plotGraph(varD,varL)
end

%function for calculating GMRL in case of more than one conductors
function GMRL = calcGMRL()
    %budling space
    d = input("Enter bundling Space (cm) : ");
    GMRL_temp = ((d^(No Of conductors - 1))*GMR)^(1/No Of conductors)
    if No Of conductors == 4
        GMRL = 1.09 * D_temp
    else
        GMRL = D_temp
        

% for ploting the graph
function msg = plotGraph(x,y)
    figure
    plot(x,y)
    title('Inductance of transmission line')
    xlabel('distance (m)')
    ylabel('inductance (H/m)')
    msg = 'ploting graph...'
end

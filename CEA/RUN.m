clc; clear; close;
% Istanbul Technical University, Faculty of Aeronautics and Astronautics
% 2022-2023 Fall, Jet Propulsion Principles Term Project
% Atakan Ozturk 110180026

% Define Analysis Parameters
of_arr = linspace(0,4,40);
str.P_c = 40; % bar
str.AR_te = 20;
str.MIX = 'AL';
str.MIX_WT = 0;
str.FUEL = 'Magnesium';
str.FUEL_FORMULA = 'MG';
% str.FUEL_ENTHALPY = -698.52; % kj/mol
% str.FUEL_TEMPERATURE = 293; % kg/m3
str.FUEL_WT = 100;
str.OXIDIZER = 'CO2';
% str.OXIDIZER_TEMPERATURE = 293; % kg/m3

% Recorded parameters
Cstar = nan(length(of_arr),1);
Isp_ms = nan(length(of_arr),1);
Ivac_ms = nan(length(of_arr),1);
for iOF = 2 : length(of_arr) % DO LOOP
    % O/F Ratio
    str.of = of_arr(iOF);
    
    % Create Input File
    createInput(str);
    try
        % Run CEA
        runCEA300;
        
        % Read Output Parameters
        Results = readOutput;
    catch
        % Skip the breakpoint
        Results.Cstar.E = NaN;
        Results.Isp.E   = NaN;
        Results.Ivac.E   = NaN;
    end
    
    % Record Results
    Cstar(iOF) = Results.Cstar.E;
    Isp_ms(iOF) = Results.Isp.E;
    Ivac_ms(iOF) = Results.Ivac.E;
end % END DO LOOP

Ivac = Ivac_ms / 9.81; %s
Isp = Isp_ms / 9.81; %s

% Plot Results
run('plotResults');
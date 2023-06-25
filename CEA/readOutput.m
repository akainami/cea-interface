function Results = readOutput
% varargin contains results to be read
filename = ['+Source' filesep 'rocket.out'];
rawdata = textread(filename,'%s','endofline','\n','whitespace',' ');

% Find CHAMBER THROAT EXIT & MOLE FRACTIONS row
FirstRow = true;
LastRow = true;
for iR = 1 : length(rawdata)-2
    if strcmp(rawdata{iR},'CHAMBER') && FirstRow
        if strcmp(rawdata{iR+1},'THROAT')
            if contains(rawdata{iR+2},'EXIT')
                startRow = iR;
                FirstRow = false;
            end
        end
    end
    if strcmp(rawdata{iR},'MOLE') && LastRow
        if contains(rawdata{iR+1},'FRACTIONS')
            endRow = iR;
            LastRow = false;
        end
    end
end
cutdata = {rawdata{startRow:endRow}}';
% Obtain Desired Outputs
for iR = 1 : length(cutdata)
    switch lower(cutdata{iR})
        case 'pinf/p'
            Results.PinfP.C = str2double(cutdata{iR+1});
            Results.PinfP.T = str2double(cutdata{iR+2});
            Results.PinfP.E = str2double(cutdata{iR+3});
        case 'p,'
            Results.P_BAR.C = str2double(cutdata{iR+2});
            Results.P_BAR.T = str2double(cutdata{iR+3});
            Results.P_BAR.E = str2double(cutdata{iR+4});
        case 't,'
            Results.T_K.C = str2double(cutdata{iR+2});
            Results.T_K.T = str2double(cutdata{iR+3});
            Results.T_K.E = str2double(cutdata{iR+4});
        case 'rho,'
            Results.RHO_KGM3.C = str2double(cutdata{iR+3});
            Results.RHO_KGM3.T = str2double(cutdata{iR+5});
            Results.RHO_KGM3.E = str2double(cutdata{iR+7});
        case 'gammas'
            Results.GAMMA.C = str2double(cutdata{iR+1});
            Results.GAMMA.T = str2double(cutdata{iR+2});
            Results.GAMMA.E = str2double(cutdata{iR+3});
        case 'cstar,'
            Results.Cstar.T = str2double(cutdata{iR+2});
            Results.Cstar.E = str2double(cutdata{iR+3});
        case 'cf,'
            Results.Cf.T = str2double(cutdata{iR+1});
            Results.Cf.E = str2double(cutdata{iR+2});
        case 'isp,'
            Results.Isp.T = str2double(cutdata{iR+2});
            Results.Isp.E = str2double(cutdata{iR+3});
        case 'ivac,'
            Results.Ivac.T = str2double(cutdata{iR+2});
            Results.Ivac.E = str2double(cutdata{iR+3});
    end
end
end


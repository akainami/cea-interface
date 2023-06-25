function createInput(str)
filename = '+Source/rocket.inp';
fid = fopen(filename,'wt');
fprintf(fid,'prob ro eq\n');
fprintf(fid,'p,bar = %f \n',string(str.P_c));
try fprintf(fid,'t,k = %f \n',string(str.T_c)); catch; end
fprintf(fid,'supar = %f\n',string(str.AR_te));
fprintf(fid,'o/f = %f \n',string(str.of));
fprintf(fid,'reactants\n');
fprintf(fid,'fuel = %s wt=%f\n',str.MIX,string(str.MIX_WT));
try % Custom Fuel
    str.FUEL_FORMULA;
    fprintf(fid,'fuel = %s %s wt=%f t,k=%f h,kj/mol=%f rho,kg/m3=%f\n',...
        str.FUEL,str.FUEL_FORMULA,...
        string(str.FUEL_WT),string(str.FUEL_TEMPERATURE),...
        string(str.FUEL_ENTHALPY),string(str.FUEL_DENSITY));
catch
    try
        str.FUEL_FORMULA;
        fprintf(fid,'fuel = %s %s wt=%f t,k=%f h,kj/mol=%f\n',...
            str.FUEL,str.FUEL_FORMULA,...
            string(str.F_WT),string(str.FUEL_TEMPERATURE),...
            string(str.FUEL_ENTHALPY));
    catch % Standard Fuel
        try
            str.FUEL_FORMULA;
            fprintf(fid,'fuel = %s %s wt=%f h,kj/mol=%f\n',...
                str.FUEL,str.FUEL_FORMULA,...
                string(str.FUEL_WT),...
                string(str.FUEL_ENTHALPY));
        catch % Standard Fuel
            fprintf(fid,'fuel = %s wt= %f\n',str.FUEL,string(str.FUEL_WT));
        end
    end
end
try % Custom Fuel
    str.OXIDIZER_TEMPERATURE;
    fprintf(fid,'oxid = %s wt=1 t,k=%f\n',...
        str.OXIDIZER,str.OXIDIZER_TEMPERATURE);
catch % Standard Fuel
    fprintf(fid,'oxid = %s wt= 1\n',str.OXIDIZER);
end
fprintf(fid,'output siunits\n');
fprintf(fid,'end');
fclose(fid);
end


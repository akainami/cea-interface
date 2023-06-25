function runCEA300
% pointer.atakan contains the input file name to be runned over cea300.exe
cmd = sprintf('cd "+Source" && cea300.exe < "pointer.atakan"');
system(cmd);
clc;
end


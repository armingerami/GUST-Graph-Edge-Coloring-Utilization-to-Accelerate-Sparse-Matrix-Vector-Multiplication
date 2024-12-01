clc
clear
% names = ["af23560", "bcircuit", "cage12", "nopoly", "offshore", "rajat28", ...
%     "scircuit", "soc-Epinions1", "soc-Slashdot0902", "wiki-Vote","flickr", ...
%     "CollegeMsg", "nemeth22", "mycielskian11", "TSC_OPF_1047", "beacxc", "rajat28", "CAG_mat1916"];
names = ["coPapersCiteseer","crankseg_2", "ML_Laplace","mouse_gene","PFlow_742","Si41Ge41H72", "TSOPF_RS_b2383"];
sizes = zeros([length(names),1]);
for ii = 1:length(names)
names(ii)
namer = append(names(ii),".mat");
namew = append(names(ii),".txt");
load(namer);
a = Problem.A;
sizes(ii) = length(a);
size(a)
a(1,5)


[i,j,v] = find(a);
fileID = fopen(namew,'w');
fprintf(fileID,'%d\t%d\t%f\n',[i,j,v]');
fclose(fileID);
end
sizes

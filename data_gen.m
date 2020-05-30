% generate a table, columns: date, author, file
% 202004190112_JierPeter_GroupN.tex

function data = data_gen
cd(mfilepath);
fnames = cellstr(ls('*.tex'));
N = numel(fnames);
data = cell(N, 3);
for i = 1:N
    fname = fnames{i};
    ind1 = 13;
    data{i, 1} = fname(1:ind1-1); % date
    for j = 5:11
        if fname(end-j) == '_'
            ind2 = numel(fname)-j; break;
        end
    end
    data{i, 2} = fname(ind1+1 : ind2-1);
    data{i, 3} = fname(ind2+1 : end-4);
end

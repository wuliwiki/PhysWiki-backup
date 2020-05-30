% list all entries edited by each author
% data columns: author, entry, hours
function list = author_entry
str = ls('*.tex');
N = size(str, 1);
str = [str(:,14:end), str(:,1:12)];
[~, order] = sort(cellstr(str));
data = data_gen();
data = [data(order,2), data(order,3), data(order,1)];
start = 1; i = 2;
while i <= size(data, 1) + 1
    if i == size(data, 1) + 1 ...
        || ~(strcmp(data{i,1},data{i-1,1}) && strcmp(data{i,2},data{i-1,2})) ...
            && i - start > 2
        data(start+1:i-1,:) = [];
        data{start, 3} = num2str((i-start)/12, '%0.2f'); % time [hour]
        start = start + 1; i = start;
    end
    i = i + 1;
end
str = [char(data(:,1)), char(data(:,2)), char(data(:,3))];
fid = fopen('author_entry.txt','w');
fprintf(fid, 'author    entry  time(h)\n');
fprintf(fid, '========================\n');
for r=1:size(str,1)
    fprintf(fid,'%s\n',str(r,:));
end
fclose(fid);
end

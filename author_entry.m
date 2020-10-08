% list all entries edited by each author
% data columns: author, entry, hours
function author_entry
cd(mfilepath);
% for each author and entry, max # of backup files to omit
num_thresh = 1;
str = ls('*.tex');
str = [str(:,14:end), str(:,1:12)];
[~, order] = sort(cellstr(str));
data = data_gen();
data = [data(order,2), data(order,3), data(order,1)];
start = 1; i = 2;
while i <= size(data, 1) + 1
    if i == size(data, 1) + 1 ...
        || ~(strcmp(data{i,1},data{i-1,1}) && strcmp(data{i,2},data{i-1,2}))
        num = i - start;
        if num >= 1
            if num > num_thresh
                data(start+1:i-1,:) = [];
                data{start, 3} = num2str(num/12, '%0.2f'); % time [hour]
                start = start + 1; i = start;
            else
                data(start:i-1,:) = [];
                i = start;
            end
        end
    end
    i = i + 1;
end
N = size(data, 1);
str = [char(data(:,1)), repmat(' ',N,2), char(data(:,2)), repmat(' ',N,6), char(data(:,3))];
fid = fopen('author_entry.txt','w');
fprintf(fid, 'author      entry        time(h)\n');
fprintf(fid, '================================\n');
for r=1:size(str,1)
    fprintf(fid,'%s\n',str(r,:));
end
fclose(fid);
end

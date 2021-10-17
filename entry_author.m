% list all entries edited by each author
% data columns: author, entry, hours
function entry_author
data = author_entry; clc;
N = size(data, 1);
for i = 1:N
    data{i, 3} = str2num(data{i, 3});
end
% sort by entry
[~, order] = sort(data(:, 2));
data = data(order, :);
% sub-sort by author
start = 1;
for i = 2:N
    if ~strcmp(data{start, 2}, data{i, 2})
        if i - start == 1
            start = i; continue;
        end
        tmp = data(start:i-1,:);
        [~, order] = sort(cell2mat(tmp(:, 3)));
        order = flip(order);
        tmp = tmp(order, :);
        data(start:i-1,:) = tmp;
        start = i;
    end
end
for i = 1:N
    data{i, 3} = num2str(data{i, 3});
end

str = [char(data(:,2)), repmat(' ',N,1), char(data(:,3)), repmat(' ',N,1), char(data(:,1))];
% unicode will not write to file
disp('entry    time(h)    author');
disp('===========================');
disp(str);
end

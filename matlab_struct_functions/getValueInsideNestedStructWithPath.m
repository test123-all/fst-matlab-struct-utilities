%% utf-8

function [output_value, error_flag] = getValueInsideNestedStructWithPath(input_struct, struct_path)
% aber input_struct.ahah.() geht d.h. ich muss bis ganz runter laufen die
% sachen ändern und wieder hoch laufen

% input_struct.(ash.ah.) -> geht nicht
% input_struct.().() -> geht -> muss ich halt viele fälle abdecken

% TODO: Validate the struct path

splitted_struct_path_cellarray = split(struct_path, '.');
% Remove empty cells
new_splitted_struct_path_cellarray = splitted_struct_path_cellarray(~cellfun('isempty', splitted_struct_path_cellarray));

% Nesting
cellarray_length = length(new_splitted_struct_path_cellarray);

% TODO: es muss rekursiv gecheckt werden ob die pfade überhaupt vorhanden sind
nsspca = new_splitted_struct_path_cellarray;

% Check recursively if the fields are present and there is a value that can
% be read out.
[output_flag, non_existent_field] = checkRecursivelyIfStructPathIsExistent(input_struct, struct_path);
if output_flag == 1
    error_flag = 1;
    switch cellarray_length
        case 1
            output_value = input_struct.(nsspca{end});
        case 2
            output_value = input_struct.(nsspca{end-1}).(nsspca{end});
        case 3
            output_value = input_struct.(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 4
            output_value = input_struct.(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 5
            output_value = input_struct.(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 6
            output_value = input_struct.(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 7
            output_value = input_struct.(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 8
            output_value = input_struct.(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 9
            output_value = input_struct.(nsspca{end-8}).(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        case 10
            output_value = input_struct.(nsspca{end-9}).(nsspca{end-8}).(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end});
        otherwise
            % TODO:
            error('test');
    end
elseif output_flag == 0
    % TODO: raise error or just return a error_flag
    error_flag = 0;
    output_value = 0;
    % error("FST_ASAM_XIL_API: You tried to read out the field '", non_existent_field, "' that isn't present".)
end

end

function [output_flag, non_existent_field] = checkRecursivelyIfStructPathIsExistent(input_struct, struct_path)
    splitted_struct_path_cellarray = split(struct_path, '.');
    % Remove empty cells
    new_splitted_struct_path_cellarray = splitted_struct_path_cellarray(~cellfun('isempty', splitted_struct_path_cellarray));

    % Nesting
    cellarray_length = length(new_splitted_struct_path_cellarray);
    
    nsspca = new_splitted_struct_path_cellarray;
    
    tf = isfield(input_struct, nsspca{1});
    if tf == 1 && cellarray_length > 1
        [output_flag, non_existent_field] = checkRecursivelyIfStructPathIsExistent(input_struct.(nsspca{1}), strjoin(nsspca(2:end), '.'));
    elseif tf == 1 && cellarray_length == 1
        % Alles existent
        output_flag = 1;
        non_existent_field = 0;
    elseif tf == 0
        % Irgendwo nicht existent
        % TODO: read out the path and print it which fiield isn't existent
        output_flag = 0;
        non_existent_field = nsspca{1};
    else
        % TODO: error message
        error('FST_ASAM_XIL_API: TODO' )
    end
end

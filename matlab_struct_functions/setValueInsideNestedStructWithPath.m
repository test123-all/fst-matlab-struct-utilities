%% utf-8

function output_struct = setValueInsideNestedStructWithPath(input_struct, struct_path, value)
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

nsspca = new_splitted_struct_path_cellarray;
switch cellarray_length
    case 1
        input_struct.(nsspca{end}) = value;
    case 2
        input_struct.(nsspca{end-1}).(nsspca{end}) = value;
    case 3
        input_struct.(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 4
        input_struct.(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 5
        input_struct.(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 6
        input_struct.(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 7
        input_struct.(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 8
        input_struct.(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 9
        input_struct.(nsspca{end-8}).(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    case 10
        input_struct.(nsspca{end-9}).(nsspca{end-8}).(nsspca{end-7}).(nsspca{end-6}).(nsspca{end-5}).(nsspca{end-4}).(nsspca{end-3}).(nsspca{end-2}).(nsspca{end-1}).(nsspca{end}) = value;
    otherwise
        % TODO:
        error('test');
end

output_struct = input_struct;
end


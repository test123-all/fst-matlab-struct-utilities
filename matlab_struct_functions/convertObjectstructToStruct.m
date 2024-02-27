function converted_output_struct = convertObjectstructToStruct(input_struct)
    input_struct_fieldnames = fieldnames(input_struct);
    for ii = 1:length(input_struct_fieldnames)
        current_field_name = input_struct_fieldnames{ii};
        current_item = input_struct.(current_field_name);
        
        if isobject(current_item)
            % Wenn das Objekt ein Matlab-Objekt ist, konvertieren Sie es zu
            % einer Struktur mit allen öffentlichen Eigenschaften without
            % calling "struct()" on the object
            props = properties(current_item);
            for i = 1:numel(props)
                temp_struct.(current_field_name).(props{i}) = current_item.(props{i});
            end
            converted_output_struct.(current_field_name) = convertObjectstructToStruct(temp_struct.(current_field_name));
        elseif ismember(class(current_item), "struct")
            converted_output_struct.(current_field_name) = convertObjectstructToStruct(current_item);
        elseif ismember(class(current_item), "cell")
            % Wenn das Objekt eine Zelle ist, konvertieren Sie jede Zelle zu einem Struct
            s = cellfun(@convertObjectstructToStruct, input_struct, 'UniformOutput', false);
            converted_output_struct = [s{:}];
        else
            converted_output_struct.(current_field_name) = current_item;
        end
    end
end
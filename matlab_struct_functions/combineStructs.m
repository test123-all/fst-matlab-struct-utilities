%% utf-8

function output_struct = combineStructs(struct1, struct2)
    fields_struct1_cellaray = fieldnames(struct1);
    fields_struct2_cellaray = fieldnames(struct2);
    % TODO: Check if there are double entries and throw an error if there
    % is at least one.
    
    % check if there are fieldnames that are present in both structs. If
    % they need to be compared on a deeper level
    list_of_double_fields = [];
    for ii = 1:1:length(fields_struct1_cellaray)
        for jj = 1:1:length(fields_struct2_cellaray)
            if strcmp(fields_struct1_cellaray{ii}, fields_struct2_cellaray{jj})
                list_of_double_fields = [list_of_double_fields, string(fields_struct1_cellaray{ii})];
                fields_struct1_cellaray{ii} = [];
                fields_struct2_cellaray{jj} = [];
                break
            end
        end
    end
    
    % Remove empty cells
    new_fields_struct1_cellaray = fields_struct1_cellaray(~cellfun('isempty', fields_struct1_cellaray));
    new_fields_struct2_cellaray = fields_struct2_cellaray(~cellfun('isempty', fields_struct2_cellaray));

    % For every field that is present in both structs
    for ii = 1:1:length(list_of_double_fields)
        % Check if both variables are structs
        if isstruct(struct1.(list_of_double_fields(ii))) && isstruct(struct2.(list_of_double_fields(ii)))
            % Call the combine struct function recursively.
            output_struct.(list_of_double_fields(ii)) = combineStructs(struct1.(list_of_double_fields(ii)), struct2.(list_of_double_fields(ii)));
        elseif isequaln(struct1.(list_of_double_fields(ii)), struct2.(list_of_double_fields(ii)))
            % If the same information is present mutliple times just take
            % it without warning
            % TODO: maybe print a warning. That the same data is present in
            % both structs. That facts violates the DRY rule.
            output_struct.(list_of_double_fields(ii)) = struct1.(list_of_double_fields(ii));
        else
            error(append("FST_ASAM_XIL_API: You are trying to combine two structs ", ...
                         "that both have a same fieldname but the data behind those ", ...
                         "fieldnames aren't two structs that could be combined further.", newline, ...
                         newline, ...
                         "The fieldname is '", string(list_of_double_fields(ii)), "' and the data '", ...
                         string(struct1.(list_of_double_fields(ii))), "' and '", string(struct2.(list_of_double_fields(ii))), "'."))
        end
        
    end
    
    % The following code only runs for the labels that don't have
    % duplicates.
    for ii = 1:1:length(new_fields_struct1_cellaray)
        output_struct.(new_fields_struct1_cellaray{ii}) = struct1.(new_fields_struct1_cellaray{ii});
    end
    
    for ii = 1:1:length(new_fields_struct2_cellaray)
        output_struct.(new_fields_struct2_cellaray{ii}) = struct2.(new_fields_struct2_cellaray{ii});
    end
end

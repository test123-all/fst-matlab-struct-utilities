%% Setup
clear

% TODO: the assert Messages are still wrong.
% TODO: Maybe add a second functional test where deeper substructs get
% tested
%% Test 1; Normal functional test
sub_struct1 = struct('substruct1', 1, 'substruct2', 2, 'substruct3', 3);
sub_struct2 = struct('substruct4', 4, 'substruct5', 5);
struct1 = struct('field1', 1, 'field2', sub_struct1, 'field3', 3);
struct2 = struct('field2', sub_struct2, 'field4', 4);

expected_output_sub_struct = struct('substruct1', 1, 'substruct2', 2, 'substruct3', 3, 'substruct4', 4, 'substruct5', 5);
expected_output_struct = struct('field1', 1, 'field2', expected_output_sub_struct, 'field3', 3, 'field4', 4);

output_struct = combineStructs(struct1, struct2);

assert(isequal(output_struct, expected_output_struct), 'Error in first root');

disp('Test 1 Successfully finished!')


%% Test 2; Test where two variables would get overwritten, test if error gets raised
struct1 = struct('field1', 1, 'field2', 2, 'field3', 3);
struct2 = struct('field2', 2, 'field4', 4);

error_flag = 0;
try
    output_struct = combineStructs(struct1, struct2);
catch
    error_flag = 1;
end

assert(error_flag == 1, 'Error in first root');

disp('Test 2 Successfully finished!')
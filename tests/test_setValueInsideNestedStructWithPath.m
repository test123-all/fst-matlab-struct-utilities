%% utf-8

%% Setup
clear

% TODO: the assert Messages are still wrong.
%% Test 1; Normal functional test
sub_struct3 = struct('subsubsubstruct6', 6, 'subsubsubstruct5', 7);
sub_struct2 = struct('subsubstruct4', 4, 'subsubstruct5', sub_struct3);
sub_struct1 = struct('substruct1', 1, 'substruct2', 2, 'substruct3', sub_struct2);

struct1 = struct('field1', 1, 'field2', sub_struct1, 'field3', 3);

output_struct = setValueInsideNestedStructWithPath(struct1, '.field2.substruct3.subsubstruct5.subsubsubstruct6', 7);


sub_struct3.subsubsubstruct6 = 7;
sub_struct2.subsubstruct5 = sub_struct3;
sub_struct1.substruct3 = sub_struct2;

expected_output_struct = struct('field1', 1, 'field2', sub_struct1, 'field3', 3);

assert(isequal(output_struct, expected_output_struct), 'Error in first root');

disp('Test 1 Successfully finished!')


%% Test 2; Normal functional test
struct1 = struct('field1', 1, 'field3', 3);

output_struct = setValueInsideNestedStructWithPath(struct1, '.field2.sub1.subsub1.subsubsub1', 5);

expected_output_struct = struct1;
expected_output_struct.field2.sub1.subsub1.subsubsub1 = 5;

assert(isequal(output_struct, expected_output_struct), 'Error in first root');

disp('Test 2 Successfully finished!')


%% Test 3; Normal functional test
struct1 = struct('field1', 1, 'field3', 3);

test_struct = struct('test_field1', 1, 'testfield2', 2);

output_struct = setValueInsideNestedStructWithPath(struct1, '.field2.sub1', test_struct);


expected_output_struct = struct1;
expected_output_struct.field2.sub1 = test_struct;

assert(isequal(output_struct, expected_output_struct), 'Error in first root');

disp('Test 3 Successfully finished!')




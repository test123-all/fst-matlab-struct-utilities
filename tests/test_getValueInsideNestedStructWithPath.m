%% utf-8

%% Setup
clear

% TODO: the assert Messages are still wrong.
%% Test 1; Normal functional test
struct3 = struct('sub1', 1, 'sub2', 2, 'sub3', 4);
struct2 = struct('test_field1', 1, 'testfield2', struct3);
struct1 = struct('field1', 1, 'field2', struct2, 'field3', 3);

[output_value, error_flag] = getValueInsideNestedStructWithPath(struct1, '.field2.testfield2.sub3');


assert(isequal(output_value, 4), 'Error in first root');

disp('Test 1 Successfully finished!')
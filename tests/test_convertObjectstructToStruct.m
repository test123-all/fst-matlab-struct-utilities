%% Setup
clear

% TODO: the assert Messages are still wrong.
% TODO: Maybe add a second functional test where deeper substructs get
% tested
% ##### TODO: FIXME: This tests need some classes from the hydropusler test
% stand software to function properly.
%% Test 1; Normal functional test
unrecordableConstantImportantParameters_objectstruct.unrecordable_fuelldruecke.fueldruck1 = unrecordableImportantParameterClass(5, '/filling_pressure_1', 'Pressure', 'bar');
unrecordableConstantImportantParameters_objectstruct.unrecordable_fuelldruecke.fueldruck2 = unrecordableImportantParameterClass(6, '/filling_pressure_2', 'Pressure', 'bar');
unrecordableConstantImportantParameters_objectstruct.unrecordable_fuelldruck_1 = unrecordableImportantParameterClass(5, '/filling_pressure_1', 'Pressure', 'bar');

optionalParameters_struct.unrecordableConstantImportantParameters_objectstruct = unrecordableConstantImportantParameters_objectstruct;

unrecordableConstantImportantParameters_struct = convertObjectstructToStruct(optionalParameters_struct.unrecordableConstantImportantParameters_objectstruct);

expected_unrecordableConstantImportantParameters_struct.unrecordable_fuelldruecke.fueldruck1 = ...
            struct('value', 5, ...
                   'relative_HDF5_path', '/filling_pressure_1', ...
                   'physical_quantity_name', 'Pressure', ...
                   'unit', 'bar');

expected_unrecordableConstantImportantParameters_struct.unrecordable_fuelldruecke.fueldruck2 = ...
            struct('value', 6, ...
                   'relative_HDF5_path', '/filling_pressure_2', ...
                   'physical_quantity_name', 'Pressure', ...
                   'unit', 'bar');
               
expected_unrecordableConstantImportantParameters_struct.unrecordable_fuelldruck_1 = ...
            struct('value', 5, ...
                   'relative_HDF5_path', '/filling_pressure_1', ...
                   'physical_quantity_name', 'Pressure', ...
                   'unit', 'bar');
    
assert(isequal(unrecordableConstantImportantParameters_struct, expected_unrecordableConstantImportantParameters_struct), 'Error in first root');

disp('Test 1 Successfully finished!')


%% Test 2; Test where two variables would get overwritten, test if error gets raised
% TODO: Add a more enhanced test
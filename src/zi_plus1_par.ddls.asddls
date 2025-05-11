@ObjectModel.query.implementedBy: 'ABAP:ZCL_MY_INCREMENTER1'
define custom entity ZI_PLUS1_par
with parameters
    p_input_number: char1
{
    key input_number: abap.int8; 
        incremented_number: abap.int8;
}

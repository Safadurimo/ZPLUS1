
@ObjectModel.query.implementedBy: 'ABAP:ZCL_MY_INCREMENTER'
define custom entity ZI_PLUS1
{
    key input_number: abap.int8;
        incremented_number: abap.int8;
}

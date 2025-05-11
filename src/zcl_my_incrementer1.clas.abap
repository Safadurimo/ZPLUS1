CLASS zcl_my_incrementer1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_my_incrementer1 IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    " Zeilentyp und Tabellentyp entsprechend der CDS-Struktur
    TYPES: BEGIN OF ty_plus1,
             input_number       TYPE int8,
             incremented_number TYPE int8,
           END OF ty_plus1.

    TYPES tt_plus1 TYPE STANDARD TABLE OF ty_plus1 WITH EMPTY KEY.

    " The following methods have to be called - otherwise the service using it will throw an error
    io_request->get_paging( ).
    io_request->get_filter( ).
    io_request->get_sort_elements( ).
    "io_request->get_parameters[ 'p_input_number' ].

    DATA(lt_params) = io_request->get_parameters( ).
    READ TABLE lt_params ASSIGNING FIELD-SYMBOL(<ls_param>) WITH KEY parameter_name = 'P_INPUT_NUMBER'.



    " Beispielhafte Ergebnisliste
    DATA(lt_result) = VALUE tt_plus1( ( input_number = <ls_param>-value incremented_number = ( <ls_param>-value + 1 ) ) ).

    " Ergebnis an das RAP-Framework zurückgeben
    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).
  ENDMETHOD.
ENDCLASS.

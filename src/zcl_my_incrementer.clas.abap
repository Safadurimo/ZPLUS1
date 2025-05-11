CLASS zcl_my_incrementer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_my_incrementer IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    " Zeilentyp und Tabellentyp entsprechend der CDS-Struktur
    TYPES: BEGIN OF ty_plus1,
             input_number        TYPE int8,
             incremented_number  TYPE int8,
           END OF ty_plus1.

    TYPES: tt_plus1 TYPE STANDARD TABLE OF ty_plus1 WITH EMPTY KEY.

    " Beispielhafte Ergebnisliste
    DATA(lt_result) = VALUE tt_plus1(
      ( input_number = 1 incremented_number = 2 )
      ( input_number = 5 incremented_number = 6 )
      ( input_number = 10 incremented_number = 11 )
    ).

    " Ergebnis an das RAP-Framework zurückgeben
    io_response->set_data( lt_result ).

  ENDMETHOD.

ENDCLASS.


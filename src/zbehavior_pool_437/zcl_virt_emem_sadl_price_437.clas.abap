CLASS zcl_virt_emem_sadl_price_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_virt_emem_sadl_price_437 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
* Declaration of necessary tables
    DATA lt_original_data TYPE STANDARD TABLE OF zdd_c_customer_travel_437 WITH DEFAULT KEY.
    lt_original_data = CORRESPONDING #( it_original_data ) .

* Iterate through projection records to set values to Virtual Elements
    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
      IF <fs_original_data>-Price IS NOT INITIAL.
        <fs_original_data>-PriceWithTax = <fs_original_data>-Price * '1.15'.
      ENDIF.
    ENDLOOP.

* Update Virtual Elements
    ct_calculated_data = CORRESPONDING #( lt_original_data ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    CASE iv_entity.
      WHEN 'ZDD_C_CUSTOMER_TRAVEL_437' .
        LOOP AT it_requested_calc_elements INTO DATA(ls_requested_calc_elements).
          IF ls_requested_calc_elements EQ 'PriceWithTax'.
            INSERT CONV #( 'PRICE' ) INTO et_requested_orig_elements.
          ENDIF.
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.

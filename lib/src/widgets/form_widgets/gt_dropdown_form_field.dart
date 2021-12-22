import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';

class GtDropdownFormField extends StatelessWidget {
  GtDropdownFormField({
    this.iconData,
    this.items,
    this.dropdownValue,
    this.onChangedhandler,
    this.onSavehandler,
    this.isRequired = false,
    this.label,
    this.textStyle,
    this.dropDownBackGround,
    this.valueTextStyle,
    this.isReadOnly = false,
    this.inputDecoration,
    this.validationHandler,
    this.itemType = GtDropDownFormFieldItemType.MAP,
    this.dropDownFormFieldIsCustom = GtDropDownFormFieldIsCustom.DEFAULT,
    this.itemCustomWidget,
    this.listLookupField,
    this.looupKeyVisibile = false,
  }) : assert((dropDownFormFieldIsCustom == GtDropDownFormFieldIsCustom.CUSTOM && itemCustomWidget != null) || dropDownFormFieldIsCustom == GtDropDownFormFieldIsCustom.DEFAULT),
      assert((itemType == GtDropDownFormFieldItemType.MAP && items is Map<String, dynamic>) || (itemType == GtDropDownFormFieldItemType.LIST && items is List<dynamic> && listLookupField != null));

  final IconData iconData;
  final dynamic items;
  final dynamic dropdownValue;
  final Function(dynamic newValue) onChangedhandler;
  final Function(dynamic newValue) onSavehandler;
  final bool isRequired;
  final String label;
  final TextStyle textStyle;
  final TextStyle valueTextStyle;
  final Color dropDownBackGround;
  final bool isReadOnly;
  final InputDecoration inputDecoration;
  /// Validation function Handler
  final Function(dynamic) validationHandler;
  /// ITEMS DATA TYPE INPUT
  final GtDropDownFormFieldItemType itemType;
  /// IS CUSTOM OR DEFAULT DROPDOWNITEM
  final GtDropDownFormFieldIsCustom dropDownFormFieldIsCustom;
  /// CUSTOM DROPDOWN ITEM FUNCTION
  final DropdownMenuItem Function(dynamic item) itemCustomWidget;
  final Map<String, dynamic> listLookupField;
  final bool looupKeyVisibile;
  @override
  Widget build(BuildContext context) {
    /// Convert the Item data as per Type of Dropdown
    Map<String, dynamic> mapItems = new Map<String, dynamic>();
    List<Map<String, dynamic>> listItems = new List<Map<String, dynamic>>.empty(growable: true);
    if(itemType == GtDropDownFormFieldItemType.MAP){
      mapItems = items as Map<String, dynamic>;
    }else if(itemType == GtDropDownFormFieldItemType.LIST){
      listItems = List.from(items);
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (label != null)
              ? GtText(
                  text: label,
                  textStyle: textStyle,
                )
              : SizedBox(),
          DropdownButtonHideUnderline(
            child:DropdownButtonFormField(
            decoration: inputDecoration,
            value: dropdownValue,
            dropdownColor: dropDownBackGround,
            isExpanded: true,
            icon: GtIcon(icondata: iconData),
            iconSize: 24,
            elevation: 16,
            onChanged: onChangedhandler,
            items: GtDropDownFormFieldItemType.MAP == itemType ? mapItems.entries
                .map(
                  (e) => GtDropDownFormFieldIsCustom.CUSTOM == dropDownFormFieldIsCustom ? itemCustomWidget(e)
                  : DropdownMenuItem<dynamic>(
                    value: e.value,
                    child: GtText(
                      text: e.key,
                      textStyle: valueTextStyle
                    ),
                  ),
                )
                .toList()
                 : listItems.map(
                      (e) => GtDropDownFormFieldIsCustom.CUSTOM == dropDownFormFieldIsCustom ? itemCustomWidget(e)
                : DropdownMenuItem<Map<String, dynamic>>(
                    value: e,
                    child: Column( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: dropdownValue == e ?
                        [
                          GtText(
                            text: e.entries.first.value,
                            textStyle: valueTextStyle
                          ),
                        ]
                       : listLookupField.entries.map((r) => 
                          Row(
                            children: [
                              if(looupKeyVisibile)
                              GtText(
                                text: r.key,
                                textStyle: valueTextStyle
                              ),
                              GtText(
                                text: e[r.value],
                                textStyle: valueTextStyle
                              ),
                            ],
                          ),
                      ).toList(),
                    )
                  ),
                ).toList(),
            onSaved: onSavehandler,
            validator: validationHandler != null ? validationHandler :  (value) {
              if (isRequired == true && (value == null || value.isEmpty)) {
                return 'Please select atleast one option';
              } else {}

              return null;
            },
          ))
        ],
      ),
    );
  }
}

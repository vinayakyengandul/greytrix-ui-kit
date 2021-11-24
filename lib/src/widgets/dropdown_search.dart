import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtDropdownSearch extends StatelessWidget {
  GtDropdownSearch({
     @required this.textEditingController,
     this.inputDecoration,
     this.onChangeHandler,
     this.suffixIcon,
     this.suffixOnPressed,
     this.itemDatawidget,
     this.itemOnTapHandler,
     this.dropDownResult,
     this.fieldLabel = "",
     this.textFieldOnTapHandler,
  });

  final TextEditingController textEditingController;
  /// decoration input search
  final InputDecoration inputDecoration;
  /// On change Handler
  final Function(dynamic) onChangeHandler;
  /// Search Bar Icon
  final Icon suffixIcon;
  /// Search onPressed
  final Function(dynamic) suffixOnPressed;
  /// List item onTap Handler
  final Function(int) itemOnTapHandler;
  /// Custom Widget build
  final Function(int index,dynamic obj) itemDatawidget;
  ///dropdownResult show after serach
  final List<dynamic> dropDownResult;
  /// field label
  final String fieldLabel;
  /// On tap on text field
  final Function textFieldOnTapHandler;

  @override
  Widget build(BuildContext context){
    /// DROP DOWN LIST 
    Widget _buildDropDown(List<dynamic> searchData) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(searchData.length, (index) => 
        itemDatawidget != null ? itemDatawidget(index, searchData[index]) :
        ListTile(
          title: GtText(text:searchData[index].toString()),
          onTap: (){
            if(itemOnTapHandler != null) itemOnTapHandler(index);
          },
         )
      )
    );
    return Column(
        children: [
          GtTextFormField(
            onTapHandler: (){
              if(textFieldOnTapHandler != null) textFieldOnTapHandler();
            },
            fieldLabel: fieldLabel,
            textEditingController: textEditingController,
            inputDecoration: inputDecoration == null ? InputDecoration(
              suffixIcon: IconButton(
                icon: suffixIcon != null ? suffixIcon : Icon(Icons.search),
                onPressed: (){
                  if(suffixOnPressed != null) suffixOnPressed(textEditingController.text);
                },
                ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(21),
              ),
            ) : inputDecoration,
            
            onChangeHandler: (value){
              if(onChangeHandler != null) onChangeHandler(value);
            },
          ),
          Visibility(
            visible: true,
            child: _buildDropDown(dropDownResult)),
        ],
    );
  }

}
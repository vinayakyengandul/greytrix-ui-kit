import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../greytrix_ui_kit.dart';
import "package:collection/collection.dart";

class GtFromDynamic extends StatelessWidget{
  GtFromDynamic({
    this.keyy,
    @required this.title,
    @required this.formSubmitHandler,
    this.rowCount = 2,
    this.fromMapjson,
    this.tag,
    this.submitButtonText = 'Submit',  
    this.formResetHandler,
    this.formFieldOnChangeHandler,
    this.setFieldValues,
    this.getFieldValues,
    this.setFormCheckboxFieldValues,
    this.setselectedLookupDataValues,
    this.setAddLookupFormKey,
    this.fieldValues,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.textStyle,
    this.headerTextStyle,
    this.titleAlignment = Alignment.topLeft,
    this.validationMessage = true,
    this.popupMessageTextStyle,
    this.popupButtonStyle,
    this.isCountShow = false,
  });
  final Key keyy;
  final String tag;
  final int rowCount;
  final Map<String, GtFormField> fromMapjson;
  final String title;
  final String submitButtonText;
  final Function formSubmitHandler;
  final Function formResetHandler;
  final Function(String,dynamic,{bool forsingle,bool forLookupForm,bool fromOnChanged}) formFieldOnChangeHandler;
  final Function(String, dynamic, {bool fromOnChanged, bool forLookupForm}) setFieldValues;
  final Function(String, {bool forLookupForm}) getFieldValues;
  final Function(String,dynamic,bool,{String fieldKey,bool forLookupForm,bool setApiVariables}) setFormCheckboxFieldValues;
  final Function(String, dynamic, {String fieldKey,String valuePath ,bool fromOnChanged,bool ismultiSelect}) setselectedLookupDataValues;
  final Function(String, GlobalKey<FormState>) setAddLookupFormKey;
  final Map<String, dynamic> fieldValues;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle textStyle;
  final TextStyle headerTextStyle;
  final Alignment titleAlignment;
  final bool validationMessage;
  final TextStyle popupMessageTextStyle;
  final ButtonStyle popupButtonStyle;
  final bool isCountShow;
  Widget buildform() {
    dynamic rowsData = {};

    ///PREPARING SPECIFIED ROWS WITH THE EMPTY LIST TO ADD THE FORM WIDGETS TO
    ///THEIR SPECIFIED ROWS FOR BOTH WEB AND MOBILE VIEW
    for (var i = 0; i < rowCount; i++) {
      rowsData[i + 1] = List<Widget>.empty(growable: true);
    }
    var data = [];
    ///GETTING THE FORM WIDGET BASED ON THE FROM_MAP_JSON MAP PASSED FOR THE VIEW
    int count = 0;
    fromMapjson.forEach((key, value) {
      bool isMobilePortrait = false;
      int row = isMobilePortrait ? value.mobileRow : value.row;
      if (row != null) {
        count++;
        rowsData[row].add(
          Common.getFormViewWidget(
            tag,
            value,
            isCountShow ? count.toString() + ". " + key : key,
            formFieldOnChangeHandler: formFieldOnChangeHandler,
            setFormCheckboxFieldValues: setFormCheckboxFieldValues,
            getFieldValues: getFieldValues,
            setFieldValues: setFieldValues,
            setselectedLookupDataValues: setselectedLookupDataValues,
            setAddLookupFormKey: setAddLookupFormKey,
            fieldValues: fieldValues,
            textStyle: textStyle,
            validationMessage: validationMessage
          ),
        );
        data.add({"Row":row,"panelName":value.panelName, "widget": rowsData[row]});
      }
    });
  var newMap = groupBy(data, (obj) => obj['panelName']);
    List<Widget> rowsWidgets = List<Widget>.empty(growable: true);
    List<Widget> rowsWidgets1 = List<Widget>.empty(growable: true);
    List<Widget> rowsStack = List<Widget>.empty(growable: true);
    int rowIndex = 0;
    EdgeInsets _rowPadding = EdgeInsets.all(5.0);
    if(newMap[""] == null && newMap.length > 0){
    newMap.forEach(
        (k, v) => {
          for(int i = 0; i < v.length; i++){
            rowsWidgets1.add(Padding(padding: _rowPadding,
            child: Wrap(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: v[i]["widget"],
            ),
          ),),
          },
          rowsStack.add(Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                padding: EdgeInsets.only(bottom: 10,top: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: rowsWidgets1,
                ),
              ),
              Positioned(
                  left: 40,
                  top: 2,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    color: backgroundColor,
                    child: GtText(text:
                      k,
                      textStyle: headerTextStyle == null ? TextStyle(fontSize: 15,fontWeight: FontWeight.bold) : headerTextStyle,
                    ),
                  )),
            ],
        )),
        rowsWidgets1 = [],
        });
    }
    ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
    ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
    else{
    rowsData.forEach(
      (k, v) => {
        rowsWidgets.add(
          Padding(
            padding: _rowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: v,
            ),
          ),
        ),
        rowIndex++,
      },
    );
    }

    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: keyy,
      child: Column(
        children: newMap[""] == null && newMap.length > 0 ? rowsStack : rowsWidgets,
      ),
      
    );
  }

@override
  Widget build(BuildContext context) {
    return
      Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(15.0),
      child: SingleChildScrollView(child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: titleAlignment,
            child: GtText(
              text: title,
              textStyle: headerTextStyle == null ? TextStyle(fontSize: 15,fontWeight: FontWeight.bold) : headerTextStyle,
            ),
          ),
          Divider(),
          // main content
          buildform(),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Form submit
               ElevatedButton(
                child: GtText(
                  text: submitButtonText,
                ),
                onPressed: () async{ 
                  var data =
                  await formSubmitHandler();
                  if(!data && !validationMessage) showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: GtText(text: "Message",textStyle: popupMessageTextStyle),
                        content: GtText(text: "Required All mandatory Fields..!",textStyle: popupMessageTextStyle,),
                        actions: <Widget>[
                          ElevatedButton(
                            style: popupButtonStyle,
                            onPressed: () => Navigator.of(context).pop(false),
                            child: GtText(text: "Ok",textStyle: popupMessageTextStyle)),
                        ],
                  );});
                },
              ),
              SizedBox(width: 10.0),
              formResetHandler != null ? ElevatedButton(
                child: GtText(
                  text: 'Reset',
                ),
                onPressed: () { formResetHandler();},
              ) : Container(),
            ],
          ),
        ],
      )),
    );
  }
}
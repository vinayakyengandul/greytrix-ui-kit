import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/core_controller.dart';
import '../models/index.dart';
import '../../greytrix_ui_kit.dart';

class GtLookupAddFormView extends GetResponsiveView<CoreController> {
  GtLookupAddFormView({
    @required this.tag,
    @required this.dialogTitle,
    @required this.formKey,
    @required this.fromMapjson,
    @required this.parentFormFieldKey,
    @required this.lookupAddNodeKey,
    @required this.lookupNodeKey,
    @required this.isMultiselect,
    @required this.parentFieldKey,
    @required this.parentValuePath,
    @required this.parentTextEditingController,
    this.rowCount = 4,
    this.submitBtnText = "Submit",
  });

  @override
  final String tag;
  final String dialogTitle;
  final GlobalKey<FormState> formKey;
  final Map<String, GtFormField> fromMapjson;
  final int rowCount;
  final String submitBtnText;
  final String parentFormFieldKey;
  final String lookupAddNodeKey;
  final String lookupNodeKey;
  final bool isMultiselect;
  final String parentFieldKey;
  final String parentValuePath;
  final TextEditingController parentTextEditingController;

  ///BUILDS THE FORM FIELDS WIDGETS FOR THE POPUP FORM
  Widget buildform() {
    dynamic rowsData = {};
    for (var i = 0; i < rowCount; i++) {
      rowsData[i + 1] = List<Widget>.empty(growable: true);
    }

    fromMapjson.forEach((key, value) {
      bool isMobilePortrait = false;
      int row = isMobilePortrait ? value.mobileRow : value.row;

      if (row != null) {
        rowsData[row].add(
          Common.getFormViewWidget(
            tag,
            value,
            key,
            //controller,
            forLookupForm: true,
          ),
        );
      }
    });

    List<Widget> rowsWidgets = List<Widget>.empty(growable: true);
    int rowIndex = 0;
    EdgeInsets _rowPadding = EdgeInsets.only(bottom: 10.0);

    ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
    ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
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
    return Form(
      key: formKey,
      child: Column(
        children: rowsWidgets,
      ),
    );
  }

  @override
  Widget builder() {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(10.0),
      title: new Text(
        'Add $dialogTitle',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 4,
      children: <Widget>[
        Divider(
          thickness: 2.0,
          color: Colors.black.withOpacity(1),
        ),

        ///BUILDING THE FORM WIDGETS
        buildform(),

        ///LOOKUP FORM ACTION BUTTONS
        Row(
          children: [
            ///LOOKUP FORM SUBMIT BUTTON
            Expanded(
              child: RaisedButton(
                child: Text(submitBtnText),
                onPressed: () {
                  // controller.addLookupformSubmitHandler(
                  //   parentFormFieldKey,
                  //   formKey,
                  //   lookupAddNodeKey,
                  // );
                  controller.addLookupformSubmitHandler(
                    parentFormFieldKey,
                    formKey,
                    lookupAddNodeKey,
                    nodeKey: lookupNodeKey,
                    ismultiSelect: isMultiselect,
                    fieldKey: parentFieldKey,
                    valuePath: parentValuePath,
                    textEditingController: parentTextEditingController,
                  );
                  // controller.addLookupformSubmitHandler(
                  //   lookupAddNodeKey: lookupAddNodeKey,
                  //   lookupAddVariableKey: gtFormField.lookupAddVariableKey,
                  //   nodeKey: gtFormField.nodeKey,
                  //   ismultiSelect: gtFormField.isMultiselect,
                  //   fieldKey: gtFormField.fieldKey,
                  //   valuePath: gtFormField.valuePath,
                  //   textEditingController: gtFormField.textEditingController,
                  // );
                }, //controller.formSubmitHandler,
              ),
            ),
            SizedBox(width: 5),

            ///LOOKUP FORM CANCEL BUTTON
            Expanded(
              child: RaisedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

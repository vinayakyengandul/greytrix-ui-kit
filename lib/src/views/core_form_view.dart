import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/core_controller.dart';
import '../../greytrix_ui_kit.dart';

class CoreFormView extends GetResponsiveView<CoreController> {
  CoreFormView({
    this.rowCount = 2,
    this.fromMapjson,
    this.tag,
    this.title,
    this.submitButtonText = 'Submit',
  });

  @override
  final String tag;
  final int rowCount;
  final Map<String, GtFormField> fromMapjson;
  final String title;
  final String submitButtonText;

  Widget buildform() {
    dynamic rowsData = {};

    ///PREPARING SPECIFIED ROWS WITH THE EMPTY LIST TO ADD THE FORM WIDGETS TO
    ///THEIR SPECIFIED ROWS FOR BOTH WEB AND MOBILE VIEW
    for (var i = 0; i < rowCount; i++) {
      rowsData[i + 1] = List<Widget>.empty(growable: true);
    }

    ///GETTING THE FORM WIDGET BASED ON THE FROM_MAP_JSON MAP PASSED FOR THE VIEW
    fromMapjson.forEach((key, value) {
      bool isMobilePortrait = false;
      int row = isMobilePortrait ? value.mobileRow : value.row;

      if (row != null) {
        rowsData[row].add(
          Common.getFormViewWidget(
            tag,
            value,
            key,
            // controller,
          ),
        );
      }
    });

    List<Widget> rowsWidgets = List<Widget>.empty(growable: true);
    int rowIndex = 0;
    EdgeInsets _rowPadding = EdgeInsets.all(5.0);

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
      key: controller.formKey,
      child: Column(
        children: rowsWidgets,
      ),
    );
  }

  @override
  Widget builder() {
    return
        // InkWell(
        //   child:
        Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GtText(
              text: title,
              //texttype: TextformatType.headline3,
            ),
          ),

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
                  //texttype: TextformatType.bodyText1,
                ),
                onPressed: controller.formSubmitHandler,
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                child: GtText(
                  text: 'Reset',
                  //texttype: TextformatType.bodyText1,
                ),
                onPressed: controller.formResetHandler,
              ),
            ],
          ),
        ],
      ),
    );
    // ,
    //   onTap: () => {FocusScope.of(Get.context).unfocus()},
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../greytrix_ui_kit.dart';

class GtTagTextField extends StatelessWidget {
  GtTagTextField({
    @required this.onDeleted,
    @required this.suggestionsCallback,
    @required this.onSuggestionSelected,
    @required this.textEditingController,
    @required this.lookupFields,
    this.addNewHandler,
    this.onSavedHander,
    this.allowMultiselection = false,
    this.looupKeyVisibile = false,
    this.selectedTaglist,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.isRequired = false,
    @required this.fieldLabel,
    this.focusNode,
    this.suggestionsBoxController,
    this.displayInFieldLabel = false,
    this.labelfontsize,
    this.textColor,
    this.addButtonOption = false,
    this.customWidgetPanel,
    this.valueTextStyle,
    this.validationHandler,
  });

  final String fieldLabel;
  final List<dynamic> selectedTaglist;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool allowMultiselection;
  final bool looupKeyVisibile;
  final TextEditingController textEditingController;
  final Function(dynamic val) onDeleted;
  final Function(dynamic suggestion, bool isMultiselect) onSuggestionSelected;
  final Function(dynamic pattern) suggestionsCallback;
  final Map<String, String> lookupFields;
  final Function(dynamic dynamic) addNewHandler;
  final Function(dynamic onSavedVal) onSavedHander;
  final bool isRequired;
  final FocusNode focusNode;
  final SuggestionsBoxController suggestionsBoxController;
  final bool displayInFieldLabel;
  final Color textColor;

  /// ADDED TO GENERIC UI  WIDGETS
  final double labelfontsize;

  //ADD button option 
  final bool addButtonOption;
  //Custom Widget for panel item
  final Function(dynamic obj) customWidgetPanel;
  // FILED TEXT VALUE STYLE
  final TextStyle valueTextStyle;
  /// Validation function Handler
  final Function(dynamic) validationHandler;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///FORM FIELD LABEL
            if (fieldLabel != null && displayInFieldLabel == false)
              GtText(
                text: fieldLabel,
                // texttype: TextformatType.bodyText2,
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                    fontStyle: FontStyle.normal,
                    color: textColor),
              ),

            ///SUGGESTION FIELD
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                style: valueTextStyle,
                focusNode: focusNode,
                decoration: InputDecoration(
                  ///LABEL INSIDE INPUT
                  labelText: displayInFieldLabel && fieldLabel != null
                      ? '$fieldLabel'
                      : null,
                  labelStyle: displayInFieldLabel && fieldLabel != null
                      ? TextStyle(
                          color: textColor,
                          fontSize: labelfontsize,
                        )
                      : null,
                  prefix: Container(
                    child: Wrap(
                      children: [
                        if (selectedTaglist.isNotEmpty)
                          ...selectedTaglist
                              .map(
                                (data) => InputChip(
                                  key: new GlobalKey<FormState>(),
                                  label: GtText(
                                    text:
                                        '${data[lookupFields.entries.first.value]}',
                                    // texttype: TextformatType.bodyText2,
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.25,
                                        fontStyle: FontStyle.normal,
                                        color: textColor),
                                  ),
                                  selected: false,
                                  onDeleted: () => onDeleted(data),
                                ),
                              )
                              .toList()
                      ],
                    ),
                  ),
                ),
                controller: textEditingController,
              ),
              loadingBuilder: (context) => SizedBox(
                height: 3.0,
                child: LinearProgressIndicator(),
              ),
              onSaved: (onSavedVal) {
                if (onSavedHander != null) onSavedHander(onSavedVal);
              },
              validator:  validationHandler != null ? validationHandler :  (val) {
                if (isRequired == true && (val == null || val.isEmpty)) {
                  return 'Please select the value from ${fieldLabel != null ? fieldLabel : ""} suggestions';
                }
                return null;
              },
              itemBuilder: (context, suggestion) {
                ///HERE CHECKING IF THE TYPE IS JSON MAP THEN ONLY SHOWING THE DATS TO THE SUGGESTION OTHERWISE SHOWING THE ADDNEW OPTION
                //return ('${suggestion.runtimeType}' == '_JsonMap' || "minified:Qi" == '${suggestion.runtimeType}')
                return (suggestion is Map<String, dynamic>)
                    ? (selectedTaglist.contains(suggestion))
                        ? Container()
                        : customWidgetPanel == null ?ListTile(
                            title: Column( 
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: lookupFields.entries
                                  .map((e) => Row(
                                        children: [
                                          if (looupKeyVisibile) ...[
                                            GtText(
                                              text: '${e.key} :',
                                              //   texttype: TextformatType.bodyText2,
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                  fontStyle: FontStyle.normal,
                                                  color: textColor),
                                            ),
                                          ],
                                          GtText(
                                            text: suggestion[e.value],
                                            //   texttype: TextformatType.bodyText2,
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.25,
                                                fontStyle: FontStyle.normal,
                                                color: textColor),
                                          ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ) : customWidgetPanel(suggestion)
                    : addNewHandler == null
                        ? Container()
                        : ListTile(
                            onTap: () => addNewHandler(suggestion),
                            title: GtText(
                              text: '$suggestion',
                              //  texttype: TextformatType.bodyText2,
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.25,
                                  fontStyle: FontStyle.normal,
                                  color: textColor),
                            ),
                            trailing: GTChip(
                              avatar: GtIcon(icondata: Icons.add_circle),
                              label: 'Add New',
                              backgroundColor: Colors.green,
                              //textFormatType: TextformatType.bodyText2,
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.25,
                                  fontStyle: FontStyle.normal,
                                  color: textColor),
                            ),
                          );
              },
              onSuggestionSelected: (suggestion) {
                onSuggestionSelected(suggestion, allowMultiselection);
                textEditingController.text = " ";
              },
              suggestionsCallback: (pattern) async {
                return suggestionsCallback(pattern.toString().trim());
              },
              suggestionsBoxDecoration: SuggestionsBoxDecoration(),
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              noItemsFoundBuilder: addButtonOption ? (context) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GtIcon(icondata: Icons.add),
                      GtText(
                        text: 'Add',
                        // texttype: TextformatType.bodyText2,
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            fontStyle: FontStyle.normal,
                            color: textColor),
                      ),
                    ],
                  ),
                );
              } : null,
            ),
          ],
        )
    );
  }
}

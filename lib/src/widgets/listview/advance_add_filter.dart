import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'advance_filter_control.dart';

class AddAdvanceFilter extends StatelessWidget {
  final List<dynamic> fields;
  final TextEditingController valueTextController;
  final dynamic filter;
  final Function(int index) onDelete;
  final Function(dynamic value, int index, bool isField) onTap;
  final Function(int index) addfilters;
  final int filterindex;
  final List<dynamic> selectedOperators;
  AddAdvanceFilter({
    @required this.fields,
    @required this.onDelete,
    @required this.onTap,
    this.filter,
    this.filterindex,
    this.valueTextController,
    this.addfilters,
    this.selectedOperators,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> builditems(dynamic list) {
      List<DropdownMenuItem> items = [];
      var data = fields.firstWhere((k) => k.value == filter['fieldName'],
          orElse: () => null);
      list.forEach((element) {
        items.add(DropdownMenuItem(
            child: GtText(
              text: '${element.keys.first}',
            ),
            value: '${element.values.first}',
            onTap: () {
              if (onTap != null)
                onTap({
                  'fieldName': filter['fieldName'],
                  'fieldValue': data.options != null
                      ? data.options[0].values.elementAt(0)
                      : '',
                  'operator': list,
                  'selectedOperator': '${element.values.first}',
                  'index': filterindex,
                  'added': true,
                  'controller': valueTextController,
                  'isNastedFilter': filter['isNastedFilter'],
                  'filterNasted': filter['filterNasted'],
                  'selectedOperatorName': '${element.keys.first}',
                  'label': filter['label'],
                }, filterindex, false);
            }));
      });
      return items;
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (MediaQuery.of(context).size.width < 450)
              ? Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Wrap(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 30,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  onChanged: (value) {},
                                  value: filter['fieldName'],
                                  items: [
                                    ...fields.map(
                                      (e) => DropdownMenuItem(
                                        child: GtText(
                                          text: e.label,
                                        ),
                                        value: e.value,
                                        onTap: () {
                                          if (onTap != null)
                                            onTap({
                                              'fieldName': e.value,
                                              'fieldValue': e.options != null
                                                  ? e.options[0].values
                                                      .elementAt(0)
                                                  : '',
                                              'operator': filter["operator"],
                                              'selectedOperator':
                                                  filter["selectedOperator"],
                                              'index': filterindex,
                                              'added': true,
                                              'controller': valueTextController,
                                              'isNastedFilter':
                                                  e.isNastedFilter,
                                              'filterNasted':
                                                  e.isNastedFilter ? Common().setNastedFilterValue(e.value, {}) : {},
                                              'label': e.label,
                                              'selectedOperatorName' : filter["selectedOperatorName"]
                                            }, filterindex, true);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: DropdownButton<dynamic>(
                                  onChanged: (value) {},
                                  underline: SizedBox(),
                                  value: filter["selectedOperator"],
                                  items: builditems(filter["operator"])))),
                      SizedBox(
                        width: 10,
                      ),
                      AdvanceFilterMakeControl(
                          filterOperetor: filter["operator"],
                          field: fields.firstWhere(
                              (k) => k.value == filter['fieldName'],
                              orElse: () => null),
                          controlValue: filter,
                          onControlValueChanged: onTap,
                          index: filterindex,
                          valuetextController: valueTextController,
                          width: MediaQuery.of(Get.context).size.width)
                    ],
                  ),
                )
              : Container(
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 30,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  onChanged: (value) {},
                                  value: filter['fieldName'],
                                  items: [
                                    ...fields.map(
                                      (e) => DropdownMenuItem(
                                        child: GtText(
                                          text: e.label,
                                        ),
                                        value: e.value,
                                        onTap: () {
                                          if (onTap != null)
                                            onTap({
                                              'fieldName': e.value,
                                              'fieldValue': e.options != null
                                                  ? e.options[0].values
                                                      .elementAt(0)
                                                  : '',
                                              'operator': filter["operator"],
                                              'selectedOperator':
                                                  filter["selectedOperator"],
                                              'index': filterindex,
                                              'added': true,
                                              'controller': valueTextController,
                                              'isNastedFilter':
                                                  e.isNastedFilter,
                                              'filterNasted':
                                                  e.isNastedFilter ? Common().setNastedFilterValue(e.value, {}) : {},
                                              'label': e.label,
                                              'selectedOperatorName':  filter["selectedOperatorName"],
                                            }, filterindex, true);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 30,
                        child: Container(
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: DropdownButton<dynamic>(
                              underline: SizedBox(),
                              onChanged: (value) {},
                              value: filter["selectedOperator"],
                              items: builditems(filter["operator"])),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      AdvanceFilterMakeControl(
                          filterOperetor: filter["operator"],
                          field: fields.firstWhere(
                              (k) => k.value == filter['fieldName'],
                              orElse: () => null),
                          controlValue: filter,
                          onControlValueChanged: onTap,
                          index: filterindex,
                          valuetextController: valueTextController,
                          width: MediaQuery.of(context).size.width / 5)
                    ],
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                if (addfilters != null) addfilters(filterindex);
              },
              child: GtIcon(icondata: Icons.done_outline_rounded, size: 16)),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                if (onDelete != null) onDelete(filterindex);
              },
              child: GtIcon(icondata: Icons.close_sharp, size: 16)),
        ],
      ),
      // ),
    );
  }
}

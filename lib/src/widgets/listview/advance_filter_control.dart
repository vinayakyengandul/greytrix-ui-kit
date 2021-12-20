import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/models/advance_filter_class.dart';

class AdvanceFilterMakeControl extends StatelessWidget {
  final dynamic field;
  final dynamic controlValue;
  final int index;
  final Function onControlValueChanged;
  TextEditingController valuetextController;
  final double width;
  final List<dynamic> filterOperetor;
  AdvanceFilterMakeControl({
    @required this.field,
    @required this.controlValue,
    this.index,
    this.onControlValueChanged,
    this.valuetextController,
    this.width,
    this.filterOperetor,
  });

  List<DropdownMenuItem> builditems() {
    List<DropdownMenuItem> items = [];
    var data = field.options;

    var list = data as List;

    list.forEach((element) {
      items.add(DropdownMenuItem(
          child: GtText(
            text: '${element.keys.elementAt(0)}',
          ),
          value: '${element.values.elementAt(0)}',
          onTap: () {
            if (onControlValueChanged != null)
              onControlValueChanged({
                'fieldName': controlValue['fieldName'],
                'fieldValue': '${element.values.elementAt(0)}',
                'operator': element,
                'selectedOperator': controlValue["selectedOperator"],
                'index': index,
                'added': true,
                'controller': valuetextController,
              }, index, false);
          }));
    });

    return items;
  }

  @override
  Widget build(BuildContext context) {
    Widget control;
    switch (field.type) {
      case GtAdvanceFilterFieldOperatorType.SELECT:
        {
          control = SizedBox(
            height: 30.0,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: DropdownButton<dynamic>(
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (value) {},
                  value: controlValue['fieldValue'],
                  items: builditems()),
            ),
          );
        }
        break;

      case GtAdvanceFilterFieldOperatorType.STRING:
        {
          control = SizedBox(
            height: 30,
            child: Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              width: width,
              child: GtTextFormField(
                maxLines: 1,
                textEditingController: valuetextController,
                textInputType: TextInputType.text,
              ),
            ),
          );
        }
        break;

      case GtAdvanceFilterFieldOperatorType.NUMERIC:
        {
          control = SizedBox(
            height: 30,
            child: Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              width: width,
              child: GtTextFormField(
                maxLines: 1,
                textEditingController: valuetextController,
                textInputType: TextInputType.number,
              ),
            ),
          );
        }
        break;

      default:
        control = Container();
        break;
    }

    return control;
  }
}


// Widget makeControl({
//   @required dynamic field,
//   @required dynamic controlvalue,
//   int index,
//   Function onControlValueChanged,
//   TextEditingController valuetextController,
//   double width,
//   @required filterOperetor,
// }) {
//   Widget control;

//   List<DropdownMenuItem> builditems() {
//     List<DropdownMenuItem> items = [];
//     var data = field.options;

//     var list = data as List;

//     list.forEach((element) {
//       items.add(DropdownMenuItem(
//           child: GtText(
//             text: '${element.keys.elementAt(0)}',
//           ),
//           value: '${element.values.elementAt(0)}',
//           onTap: () {
//             if (onControlValueChanged != null)
//               onControlValueChanged({
//                 'fieldName': controlvalue['fieldName'],
//                 'fieldValue': '${element.values.elementAt(0)}',
//                 'operator': element,
//                 'selectedOperator': controlvalue["selectedOperator"],
//                 'index': index,
//                 'added': true,
//                 'controller': valuetextController,
//               }, index);
//           }));
//     });

//     return items;
//   }

//   switch (field.type) {
//     case GtAdvanceFilterFieldOperatorType.SELECT:
//       {
//         control = SizedBox(
//           height: 30.0,
//           width: width,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: new BorderRadius.circular(10.0),
//             ),
//             child: DropdownButton<dynamic>(
//                 isExpanded: true,
//                 underline: SizedBox(),
//                 onChanged: (value) {},
//                 value: controlvalue['fieldValue'],
//                 items: builditems()),
//           ),
//         );
//       }
//       break;

//     case GtAdvanceFilterFieldOperatorType.STRING:
//       {
//         control = SizedBox(
//           height: 30,
//           child: Container(
//             padding: EdgeInsets.all(3.0),
//             decoration: BoxDecoration(
//               borderRadius: new BorderRadius.circular(10.0),
//             ),
//             width: width,
//             child: GtTextFormField(
//               maxLines: 1,
//               textEditingController: valuetextController,
//               textInputType: TextInputType.text,
//             ),
//           ),
//         );
//       }
//       break;

//     case GtAdvanceFilterFieldOperatorType.NUMERIC:
//       {
//         control = SizedBox(
//           height: 30,
//           child: Container(
//             padding: EdgeInsets.all(3.0),
//             decoration: BoxDecoration(
//               borderRadius: new BorderRadius.circular(10.0),
//             ),
//             width: width,
//             child: GtTextFormField(
//               maxLines: 1,
//               textEditingController: valuetextController,
//               textInputType: TextInputType.number,
//             ),
//           ),
//         );
//       }
//       break;

//     default:
//       control = Container();
//       break;
//   }

//   return control;
// }

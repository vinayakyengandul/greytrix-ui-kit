import 'package:greytrix_ui_kit/src/models/pdf_body_class.dart';
import 'package:greytrix_ui_kit/src/models/pdf_data.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../greytrix_ui_kit.dart';

class BodyListFields {
  List<pw.Widget> getListBodyField(PdfData pdfData) {
    List<pw.Widget> widgets;
    widgets = [];
    dynamic rowsData = {};
    if (pdfData.pdfBody != null &&
        pdfData.pdfBody.maxRow > 0 &&
        pdfData.pdfBody.pdfBodyFields != null) {
      for (var i = 0; i < pdfData.pdfBody.maxRow; i++) {
        // rowsData[i + 1] = List<pw.Widget>.empty(growable: true);
        rowsData[i + 1] = {
          "isSpanningWidget": false,
          "widgets": List<pw.Widget>.empty(growable: true)
        };
      }
      pdfData.pdfBody.pdfBodyFields.forEach((element) {
        if (element.valuePath != null) {
          dynamic nodeValue = Common.getValue(pdfData.data, element.valuePath);
          int row = element.row;
          if (row != null) {
            ///HERE IF PDF BODY FIELD IS HAVING THE SPANNING WIDGET THEN SETTING
            ///DEFAULT ROWS DATA WITH SPANNING_WIDGET AS TRUE TO USE IT FURTHER
            if (element.isSpanningWidget == true) {
              rowsData[row]["isSpanningWidget"] = true;
              rowsData[row]["widgets"].add(
                getBodyWidget(pdfData, nodeValue, element.fieldType, element),
              );
            } else {
              ///HERE IS WIDGET IS NOT SPANNING WIDGET THEN CONTINUING NORMAL WIDGET BUILDING FLOW
              rowsData[row]["widgets"].add(
                getBodyWidget(pdfData, nodeValue, element.fieldType, element),
              );
            }
          }
        }
      });
      rowsData.forEach((k, v) => {
            ///NEWLY ADDED TO HANDLE THE SPANNING WIDGETS CHECK (TABLE WIDGETS TO CONTINUE ON DIFFERENT PAGES )
            ///IF THE BODY FIELD IS THE SPANNING WIDGET THEN ADDING WIDGET WITHOUT PARENT
            /// ROW WIDGET
            if (v["isSpanningWidget"] == true)
              {
                widgets.addAll(v["widgets"]),
              }
            else
              {
                /// NORMAL WIDGETS COMBINING ON BASIS OF ROWS
                widgets.add(
                  pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      children: v["widgets"]),
                ),
              }
          });
    } else {
      return [pw.Container()];
    }
    return widgets;
  }

  ///IT RETURNS THE PDF BODY FIELD WIDGET BASED ON TYPE
  pw.Widget getBodyWidget(
    PdfData pdfData,
    dynamic value,
    GTBodyFieldType bodyType,
    PdfBodyField element,
  ) {
    switch (bodyType) {
      case GTBodyFieldType.ICON:
        return pw.Container(
            height: element.height,
            padding: element.padding,
            alignment: element.alignment,
            child: pw.Icon(pw.IconData(0xe037)));
        break;

      case GTBodyFieldType.TITLE:
        return pw.Container(
          decoration: element.decoration,
          height: element.height,
          padding: element.padding,
          alignment: element.alignment,
          child: pw.Text(
            value,
            style: element.valueTextStyle ??
                pw.TextStyle(
                  color: pdfData.baseColor,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
          ),
        );
        break;
      case GTBodyFieldType.SUBTITLE:
        List<pw.Widget> arryList = [
          if (element.displayKey == true)
            pw.Text(
              element.key,
              style: element.keyTextStyle ??
                  pw.TextStyle(
                    color: pdfData.baseColor,
                    fontSize: 15,
                  ),
            ),
          pw.Text(
            value,
            style: element.valueTextStyle ??
                pw.TextStyle(
                  color: pdfData.baseColor,
                  fontSize: 15,
                ),
          ),
        ];
        return pw.Container(
            decoration: element.decoration,
            height: element.height,
            padding: element.padding,
            alignment: element.alignment,
            child: element.bodyFieldKeyValueFormat ==
                    GtBodyFieldKeyValueFormat.COLUMN
                ? pw.Column(
                    mainAxisAlignment: element.mainAxisAlignment,
                    crossAxisAlignment: element.crossAxisAlignment,
                    children: arryList)
                : pw.Row(
                    mainAxisAlignment: element.mainAxisAlignment,
                    crossAxisAlignment: element.crossAxisAlignment,
                    children: arryList));
        break;

      case GTBodyFieldType.TABLE:
        var tableData = pw.Table.fromTextArray(
          border: null,
          cellAlignment: element.tableCellAlignment,
          headerDecoration: element.tableBodyDecoration,
          headerHeight: element.tableBodyHeight,
          cellHeight: element.tableCellHeight,
          cellAlignments: element.tableCellAlignments,
          headerStyle: element.tableBodyStyle,
          cellStyle: element.tableCellStyle,
          rowDecoration: element.tableRowDecoration,
          cellDecoration: element.cellDecoration,
          headers: element.pdfTable.keys.toList(),
          data: List<List<String>>.generate(
            value.length,
            (row) => List<String>.generate(
              element.pdfTable.keys.length,
              (col) {
                String keyreturn = element
                    .pdfTable[element.pdfTable.keys.elementAt(col)].valuePath
                    .toString();
                if (element.pdfTable[element.pdfTable.keys.elementAt(col)]
                        .pdfTableColumnType ==
                    GtPdfTableColumnType.CURRENCY) {
                  return element.pdfTable[element.pdfTable.keys.elementAt(col)]
                          .defualtCurrency +
                      value[row][keyreturn].toString();
                } else {
                  return value[row][keyreturn].toString();
                }
              },
            ),
          ),
        );

        ///HERE IF THE FIELD IS SPANNING WIDGET THEN RETURNING THE WIDGET AS IT IS WITHOUT EXPANDED WIDGET AS PARENT
        ///THIS CHANGE ADDED DUE TO PDF ISSUE IF ONE CELL CONTENT IS TOO LARGE AND NOT ABLE TO FIT ON ONE PDF PAGE
        if (element.isSpanningWidget == true)
          return tableData;
        else {
          return pw.Expanded(child: tableData);
        }
        //   tableData
        // : pw.Expanded(child: tableData );

        break;

      case GTBodyFieldType.LINE:
        return pw.Expanded(
            child: pw.Container(
          height: element.height,
          padding: element.padding,
          alignment: element.alignment,
          decoration: element.lineDecoration,
        ));
        break;
      default:
        return pw.Container();
    }
  }
}

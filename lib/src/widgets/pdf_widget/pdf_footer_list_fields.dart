import 'package:flutter/services.dart';
import 'package:greytrix_ui_kit/src/models/pdf_footer_class.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../greytrix_ui_kit.dart';

class FooterListFields {
  List<pw.Widget> getListFooterField(PdfData pdfData) {
    List<pw.Widget> widgets;
    widgets = [];
    dynamic rowsData = {};
    if (pdfData.pdfFooter != null && pdfData.pdfFooter.maxRow > 0 && pdfData.pdfBody.pdfBodyFields != null) {
      for (var i = 0; i < pdfData.pdfFooter.maxRow; i++) {
        rowsData[i + 1] = List<pw.Widget>.empty(growable: true);
      }
      pdfData.pdfFooter.pdfFooterFields.forEach((element) {
        if (element.valuePath != null) {
          dynamic nodeValue = Common.getValue(pdfData.data, element.valuePath);
          int row = element.row;
          if (row != null) {
            rowsData[row].add(getFooterWidget(
                pdfData, nodeValue, element.fieldType, element));
          }
        }
      });
      rowsData.forEach((k, v) => {
            widgets.add(pw.Row(mainAxisSize: pw.MainAxisSize.min, children: v))
          });
    }
    else {
      return [pw.Container()];
    }
    return widgets;
  }

  pw.Widget getFooterWidget(
    PdfData pdfData,
    dynamic value,
    GTFooterFieldType footerType,
    PdfFooterField element,
  ) {
    switch (footerType) {
      case GTFooterFieldType.TITLE:
        return pw.Expanded(
            child: pw.Container(
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
        ));
        break;
      case GTFooterFieldType.SUBTITLE:
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
        return pw.Expanded(
            child: pw.Container(
                height: element.height,
                padding: element.padding,
                alignment: element.alignment,
                child: element.footerFieldKeyValueFormat ==
                        GtFooterFieldKeyValueFormat.COLUMN
                    ? pw.Column(
                        mainAxisAlignment: element.mainAxisAlignment,
                        crossAxisAlignment: element.crossAxisAlignment,
                        children: arryList)
                    : pw.Row(
                        mainAxisAlignment: element.mainAxisAlignment,
                        crossAxisAlignment: element.crossAxisAlignment,
                        children: arryList)));
        break;

      case GTFooterFieldType.TABLE:
        return pw.Expanded(
            child: pw.Table.fromTextArray(
          border: null,
          cellAlignment: element.tableCellAlignment,
          headerDecoration: element.tableHeaderDecoration,
          headerHeight: element.tableHeaderHeight,
          cellHeight: element.tableCellHeight,
          cellAlignments: element.tableCellAlignments,
          headerStyle: element.tableHeaderStyle,
          cellStyle: element.tableCellStyle,
          rowDecoration: element.tableRowDecoration,
          headers: element.pdfTable.keys.toList(),
          data: List<List<String>>.generate(
            value.length,
            (row) => List<String>.generate(
              element.pdfTable.keys.length,
              (col) {
                String keyreturn = element
                    .pdfTable[element.pdfTable.keys.elementAt(col)].valuePath
                    .toString();
                return value[row][keyreturn].toString();
              },
            ),
          ),
        ));

        break;

      case GTFooterFieldType.LINE:
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

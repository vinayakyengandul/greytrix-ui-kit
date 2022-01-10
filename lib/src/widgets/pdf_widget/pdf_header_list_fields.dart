import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greytrix_ui_kit/src/models/pdf_data.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../greytrix_ui_kit.dart';

class HeaderListFields {
  List<pw.Widget> getListHeaderField(
    PdfData pdfData,
  ) {
    List<pw.Widget> widgets;
    widgets = [];
    dynamic rowsData = {};
    if (pdfData.pdfHeader != null && pdfData.pdfHeader.maxRow > 0 && pdfData.pdfHeader.pdfHeaderFields != null) {
      for (var i = 0; i < pdfData.pdfHeader.maxRow; i++) {
        rowsData[i + 1] = List<pw.Widget>.empty(growable: true);
      }
      pdfData.pdfHeader.pdfHeaderFields.forEach((element) {
        if (element.valuePath != null) {
          dynamic nodeValue = Common.getValue(pdfData.data, element.valuePath);
          int row = element.row;
          if (row != null) {
            rowsData[row].add(getHeaderWidget(
              pdfData,
              nodeValue,
              element.fieldType,
              element,
            ));
          }
        }
      });
      rowsData.forEach((k, v) => {
            widgets.add(pw.Row(mainAxisSize: pw.MainAxisSize.min, children: v))
          });
    }
    else{
      return [pw.Container()];
    }
    return widgets;
  }

  pw.Widget getHeaderWidget(
    PdfData pdfData,
    dynamic value,
    GTHeaderFieldType headerType,
    PdfHeaderField element,
  ) {
    String _logo;

    switch (headerType) {
      case GTHeaderFieldType.ICON:
        return pw.Expanded(
            child: pw.Container(
                height: element.height,
                padding: element.padding,
                alignment: element.alignment,
                child: pw.Icon(pw.IconData(value))));
        break;

      case GTHeaderFieldType.IMAGE:
        return pw.Expanded(
            child: pw.Container(
          height: element.height,
          padding: element.padding,
          alignment: element.alignment,
          child: element.imageProvider != null
              ? pw.Image(element.imageProvider)
              : pw.PdfLogo(),
        ));
        break;

      case GTHeaderFieldType.TITLE:
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
      case GTHeaderFieldType.SUBTITLE:
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
                child: element.headerFieldKeyValueFormat ==
                        GtHeaderFieldKeyValueFormat.COLUMN
                    ? pw.Column(
                        mainAxisAlignment: element.mainAxisAlignment,
                        crossAxisAlignment: element.crossAxisAlignment,
                        children: arryList)
                    : pw.Row(
                        mainAxisAlignment: element.mainAxisAlignment,
                        crossAxisAlignment: element.crossAxisAlignment,
                        children: arryList)));
        break;

      case GTHeaderFieldType.TABLE:
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

      case GTHeaderFieldType.LINE:
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

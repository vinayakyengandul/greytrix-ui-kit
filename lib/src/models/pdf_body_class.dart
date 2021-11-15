import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import '../../greytrix_ui_kit.dart';

class PdfBody{
  PdfBody({
    this.maxRow,
    this.maxColumn,
    this.pdfBodyFields,
  });
  final int maxRow;
  final int maxColumn;
  final List<PdfBodyField> pdfBodyFields;
}

class PdfBodyField{
  PdfBodyField({
    this.row,
    this.column,
    this.valuePath,
    this.defaultValue,
    this.fieldType = GTBodyFieldType.TITLE,
    this.padding,
    this.height,
    this.alignment,
    this.pdfTable,
    this.valueTextStyle,
    this.keyTextStyle,
    this.displayKey = false,
    this.tableCellAlignment = pw.Alignment.center,
    this.tableBodyDecoration = const pw.BoxDecoration(
      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
      color:  PdfColors.teal
    ),
    this.tableBodyHeight = 25,
    this.tableCellHeight = 20,
    this.tableCellAlignments = const {
      0: pw.Alignment.center,
      1: pw.Alignment.center,
      2: pw.Alignment.center,
      3: pw.Alignment.center,
      4: pw.Alignment.center,
    },
    this.tableBodyStyle = const pw.TextStyle(fontSize: 10,),
    this.tableCellStyle = const pw.TextStyle(fontSize: 10,),
    this.tableRowDecoration = const pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(
                    color:  PdfColors.blueGrey900,
                    width: .5,
                  ),
                ),
              ),
    this.lineDecoration = const pw.BoxDecoration(
          border: pw.Border(top: pw.BorderSide(
            )),
        ),
        this.cellDecoration,
  });

  final int row;
  final int column;
  final String valuePath;
  final String defaultValue;
  final GTBodyFieldType fieldType;
  final pw.EdgeInsets padding;
  final double height;
  final pw.Alignment alignment;
  final Map<String, PdfTable> pdfTable;
  final pw.TextStyle valueTextStyle;
  final pw.TextStyle keyTextStyle;
  final bool displayKey;
  /// TABLE UI INPUTS
  final pw.Alignment tableCellAlignment;
  final pw.BoxDecoration tableBodyDecoration;
  final double tableBodyHeight;
  final double tableCellHeight;
  final Map<int, pw.Alignment> tableCellAlignments;
  final pw.TextStyle tableBodyStyle;
  final pw.TextStyle tableCellStyle;
  final pw.BoxDecoration tableRowDecoration;
  final pw.BoxDecoration lineDecoration;
  final OnCellDecoration cellDecoration;
}
enum GTBodyFieldType { ICON, TITLE, SUBTITLE, TABLE, LINE }
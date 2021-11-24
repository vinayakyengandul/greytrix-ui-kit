import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../greytrix_ui_kit.dart';
import 'pdf_body_class.dart';
import 'pdf_footer_class.dart';

class PdfData {
  PdfData({
    @required this.baseColor,
    @required this.accentColor,
    this.pdfHeader,
    this.pdfFooter,
    @required this.data,
    @required this.pdfBody,
    this.pageMargin
  });
  final PdfColor baseColor;
  final PdfColor accentColor;
  final PdfHeader pdfHeader;
  final PdfFooter pdfFooter;
  final PdfBody pdfBody;
  final dynamic data;
  final pw.EdgeInsets pageMargin;
}

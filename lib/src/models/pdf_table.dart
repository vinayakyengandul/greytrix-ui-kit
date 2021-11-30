import 'package:pdf/widgets.dart' as pw;
class PdfTable{
  PdfTable({
      this.valuePath,
      this.padding,
      this.height,
      this.alignment,
      this.pdfTableColumnType = GtPdfTableColumnType.STRING,
      this.defualtCurrency = "",
    });

  final String valuePath;
  final pw.EdgeInsets padding;
  final double height;
  final pw.Alignment alignment;
  final GtPdfTableColumnType pdfTableColumnType;
  final String defualtCurrency;
  
}

enum GtPdfTableColumnType {STRING, CURRENCY}
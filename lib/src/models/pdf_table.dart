import 'package:pdf/widgets.dart' as pw;
class PdfTable{
  PdfTable({
      this.valuePath,
      this.padding,
      this.height,
      this.alignment
    });

  final String valuePath;
  final pw.EdgeInsets padding;
  final double height;
  final pw.Alignment alignment;
  
}
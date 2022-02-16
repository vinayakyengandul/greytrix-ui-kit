import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../greytrix_ui_kit.dart';
import 'pdf_body_list_fields.dart';
import 'pdf_footer_list_fields.dart';
import 'pdf_header_list_fields.dart';

class GtPdfWidget extends StatelessWidget {
  GtPdfWidget({
    Key key,
    this.maxPageWidth,
    @required this.pdfData,
    this.onShared,
    this.actions,
    this.useActions = false,
    this.allowPrinting = true,
    this.allowSharing = true,
    this.canChangeOrientation = false,
    this.canChangePageFormat = false,
    this.canDebug = false,
    this.loadingWidget,
    this.pdfPreviewPageDecoration,
    this.pdfFileName,
    this.pages,
    this.padding,
    this.scrollViewDecoration,
    this.previewPageMargin,
    this.onError,
    this.onPrintError,
    this.onPrinted,
    this.dynamicLayout = true,
    this.shouldRepaint = false,
    this.initialPageFormat,
    this.pageFormats = _defaultPageFormats,
    this.shareActionExtraBody,
    this.shareActionExtraSubject,
    this.shareActionExtraEmails,
    this.maxPages = 1000,
  }) : super(key: key);

  static const _defaultPageFormats = <String, PdfPageFormat>{
    'A4': PdfPageFormat.a4,
    'Letter': PdfPageFormat.letter,
  };

  /// Maximum width of the pdf document on screen
  final double maxPageWidth;

  /// For Preparing PDf Preview in data.
  final PdfData pdfData;

  /// Called if the user shares the pdf document
  final Function(BuildContext, PdfData) onShared;

  /// Additionnal actions to add to the widget
  final List<PdfPreviewAction> actions;

  /// Allow disable actions
  final bool useActions;

  /// Add a button to print the pdf document
  final bool allowPrinting;

  /// Add a button to share the pdf document
  final bool allowSharing;

  /// Add a switch to change the page orientation
  final bool canChangeOrientation;

  /// Add a drop-down menu to choose the page format
  final bool canChangePageFormat;

  /// Add a switch to show debug view
  final bool canDebug;

  /// Custom loading widget to use that is shown while PDF is being generated.
  /// If null, a [CircularProgressIndicator] is used instead.
  final Widget loadingWidget;

  /// Decoration of _PdfPreviewPage
  final Decoration pdfPreviewPageDecoration;

  /// Name of the PDF when sharing. It must include the extension.
  final String pdfFileName;

  ///Pages to display. Default will display all the pages.
  final List<int> pages;

  /// padding for the pdf_preview widget
  final EdgeInsets padding;

  ///Decoration of scrollView
  final Decoration scrollViewDecoration;

  ///margin for the document preview page
  ///defaults to [EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 12)],
  final EdgeInsets previewPageMargin;

  ///Widget to display if the PDF document cannot be displayed
  final Widget Function(BuildContext, Object) onError;

  ///Called if an error creating the Pdf occured
  final Function(BuildContext, dynamic) onPrintError;

  ///Called if the user prints the pdf document
  final Function(BuildContext) onPrinted;

  ///Request page re-layout to match the printer paper and margins. Mitigate an issue with iOS and macOS print dialog that prevent any channel message while opened.
  final bool dynamicLayout;

  ///Force repainting the PDF document
  final bool shouldRepaint;

  ///Pdf page format asked for the first display
  final PdfPageFormat initialPageFormat;

  ///List of page formats the user can choose
  final Map<String, PdfPageFormat> pageFormats;

  ///extra text to share with Pdf document
  final String shareActionExtraBody;

  ///email subject when email application is selected from the share dialog
  final String shareActionExtraSubject;

  ///list of email addresses which will be filled automatically if the email application is selected from the share dialog. This will work only for Android platform.
  final List<String> shareActionExtraEmails;

  // THE MAXIMUM NUMBER OF PAGES ALLOWED BEFORE RAISING AN ERROR
  final int maxPages;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      key: key,
      shareActionExtraEmails: shareActionExtraEmails,
      shareActionExtraSubject: shareActionExtraSubject,
      shareActionExtraBody: shareActionExtraBody,
      pageFormats: pageFormats,
      initialPageFormat: initialPageFormat,
      shouldRepaint: shouldRepaint,
      dynamicLayout: dynamicLayout,
      onPrinted: onPrinted,
      onPrintError: onPrintError,
      onError: onError,
      previewPageMargin: previewPageMargin,
      scrollViewDecoration: scrollViewDecoration,
      padding: padding,
      onShared: (context) {
        if (onShared != null) onShared(context, pdfData);
      },
      pdfFileName: pdfFileName,
      pages: pages,
      canDebug: canDebug,
      canChangePageFormat: canChangePageFormat,
      canChangeOrientation: canChangeOrientation,
      allowPrinting: allowPrinting,
      allowSharing: allowSharing,
      maxPageWidth: maxPageWidth,
      loadingWidget: loadingWidget,
      pdfPreviewPageDecoration: pdfPreviewPageDecoration,
      build: (format) async {
        return buildPdf(format);
      },
      useActions: useActions,
      actions: actions,
    );
  }

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    // Create a PDF document.
    final doc = pw.Document();

    // Add page to the PDF
    doc.addPage(
      pw.MultiPage(
          // theme: pw.ThemeData.withFont(
          //   base: pw.Font.ttf(PdfGoogleFonts.robotoRegular())
          // ),
          maxPages: maxPages,
          pageTheme: _buildTheme(
            pageFormat,
            await PdfGoogleFonts.openSansRegular(),
            await PdfGoogleFonts.openSansBold(),
            await PdfGoogleFonts.openSansItalic(),
          ),
          header: _buildHeader,
          footer: _buildFooter,
          build: (context) => BodyListFields().getListBodyField(pdfData)
          // [
          //   _buildBody(context)
          // ],
          ),
    );

    // Return the PDF file content
    return doc.save();
  }

  /// --- Build HEADER

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [...HeaderListFields().getListHeaderField(pdfData)],
    );
  }

  /// --- Build FOOTER
  ///
  pw.Widget _buildFooter(pw.Context context) {
    return pw.Column(
      children: [...FooterListFields().getListFooterField(pdfData)],
    );
  }

  /// --- Build FOOTER
  ///
  pw.Widget _buildBody(pw.Context context) {
    return pw.Column(children: [...BodyListFields().getListBodyField(pdfData)]);
  }

  /// --- Build THEME
  ///
  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      margin: pdfData.pageMargin,
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:project_b/utils/pdf_view_agrument_class.dart';

class CustomPdfViewer extends StatefulWidget {
  const CustomPdfViewer({super.key});

  @override
  State<CustomPdfViewer> createState() => _CustomPdfViewerState();
}

class _CustomPdfViewerState extends State<CustomPdfViewer> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PdfViewArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.fileName),
      ),
      body: PDFView(filePath: args.path),
    );
  }
}

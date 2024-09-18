import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({super.key});
  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Image to PDF'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text("select image(s) : ${images.length.toString()}"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: pickImages,
              child: const Text('select images'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: images.isNotEmpty ? createPdf : null,
              child: const Text('create pdf'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: images.isNotEmpty ? clearImg : null,
              child: const Text('clear selected images'),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.file(File(images[index].path));
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImages() async {
    try {
      final pickedImages = await picker.pickMultiImage();
      setState(() {
        images = [...images, ...pickedImages];
      });
    } catch (e) {
      log('Error picking images: $e');
    }
  }

  Future<void> createPdf() async {
    final pdf = pw.Document();

    for (var imageFile in images) {
      final image = pw.MemoryImage(
        File(imageFile.path).readAsBytesSync(),
      );
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.FullPage(ignoreMargins: true, child: pw.Image(image, fit: pw.BoxFit.fill));
          },
        ),
      );
    }

    final outputDir = await getApplicationDocumentsDirectory();
    final pdfFile = File('${outputDir.path}/project_b_${DateTime.now().millisecondsSinceEpoch}.pdf');
    await pdfFile.writeAsBytes(await pdf.save());
  }

  void clearImg() {
    setState(() {
      images = [];
    });
  }
}

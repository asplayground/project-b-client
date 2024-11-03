import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';

class DocScanner extends StatefulWidget {
  const DocScanner({super.key});

  @override
  State<DocScanner> createState() => _DocScannerState();
}

class _DocScannerState extends State<DocScanner> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final imagesPath = await CunningDocumentScanner.getPictures();
          print("test");
        },
        child: Container(
          color: Colors.amber,
        ));
  }
}

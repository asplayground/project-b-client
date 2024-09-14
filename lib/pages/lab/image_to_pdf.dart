import 'package:flutter/material.dart';

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({super.key});

  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: false,
        title: const Text("Test module 1"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [Text("Test")],
        ),
      ),
    );
  }
}

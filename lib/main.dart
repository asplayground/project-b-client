import 'package:flutter/material.dart';
import 'package:project_b/pages/custom_pdf_viewer.dart';
import 'package:project_b/pages/home.dart';
import 'package:project_b/pages/lab/doc_scanner.dart';
import 'package:project_b/pages/lab/image_to_pdf.dart';
import 'package:project_b/pages/lab/in_app_file_explorer.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/dev/imageToPdf': (context) => const ImageToPdf(),
        '/dev/fileExplorer': (context) => const InAppFileExplorer(),
        '/pdfView': (context) => const CustomPdfViewer(),
        '/home': (context) => const HomeScreen(),
        '/scanner': (context) => const DocScanner()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final String title = "Project B";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: false,
          title: Text(title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/dev/imageToPdf");
                  },
                  child: const Text("Test module 1 (image to multi page pdf)")),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/dev/fileExplorer");
                  },
                  child: const Text("Test module 2 (in app file explorer)")),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text("Home screen")),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/scanner");
                  },
                  child: const Text("Test module 3 (scanner)")),
            ],
          ),
        ));
  }
}

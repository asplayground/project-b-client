import 'package:flutter/material.dart';
import 'package:project_b/pages/lab/image_to_pdf.dart';

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
      routes: {'/': (context) => const MyHomePage(), '/dev/imageToPdf': (context) => ImageToPdf()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final String _title = "Project B";
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
          title: Text(_title),
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
            ],
          ),
        ));
  }
}

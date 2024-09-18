import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class InAppFileExplorer extends StatefulWidget {
  const InAppFileExplorer({super.key});

  @override
  State<InAppFileExplorer> createState() => _InAppFileExplorerState();
}

class _InAppFileExplorerState extends State<InAppFileExplorer> {
  var fileNames = [];

  void listFileNames() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> entities = directory.listSync();
    final List<Map<String, String>> tempFileNames = [];

    for (final entity in entities) {
      var tempFileName = entity.uri.pathSegments.last;
      if (entity is File && tempFileName.split(".")[1].toLowerCase() == "pdf") {
        tempFileNames.add({"name": tempFileName, "path": entity.path});
      }
    }

    setState(() {
      fileNames = tempFileNames;
    });
  }

  @override
  void initState() {
    listFileNames();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In App File Explorer'),
      ),
      body: ListView.builder(
        itemCount: fileNames.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(color: Colors.blue[50]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fileNames[index]["name"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                        onTap: () {
                          Share.shareXFiles([XFile(fileNames[index]["path"])]);
                        },
                        child: const Icon(Icons.share))
                  ],
                ),
                Text(fileNames[index]["path"], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
              ],
            ),
          );
        },
      ),
    );
  }
}

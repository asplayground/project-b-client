import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff088395),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                title: const Text(
                  "Project B",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                expandedHeight: 200,
                pinned: true,
                backgroundColor: const Color(0xff37B7C3),
                flexibleSpace: Container(color: const Color(0xff37B7C3))),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Container(margin: EdgeInsets.only(top: index == 0 ? 16 : 0), child: FileItem());
                },
                childCount: 20,
              ),
            ),
          ],
        ));
  }
}

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: const BoxDecoration(color: Color(0xffF6F6F5), borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          const Icon(
            Icons.photo_outlined,
            size: 64,
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "File name qowijepwoqijedpoiqwjedpoiqwjeoiqwjeioqwjeoijqwe",
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "1/1/2024 | 12 pages",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.file_download_outlined),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.ios_share_outlined),
        ],
      ),
    );
  }
}

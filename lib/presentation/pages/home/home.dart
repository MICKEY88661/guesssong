import 'package:flutter/material.dart';

import '../music/music.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late final PageController pageCtrl;

  @override
  void initState() {
    pageCtrl = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('-gueSSSong-'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageCtrl,
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          children: const [
            // LyricPage(),
            MusicPage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     const String url =
      //         'https://fs-preview.kfs.io/201307/0twvYuwqmT0x0mpLw_FUBtFAQnzkfdWeKlkkrtwLN8CDky3dVmo=?__gda__=1676449983_d2d6c88aa939c27010f657665dc077ce';

      //     final duration = await player.setUrl(url);
      //     await player.play();
      //   },
      //   child: Text('test'),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentPage,
      //   onTap: (index) {
      //     pageCtrl.jumpToPage(index);
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.lyrics), label: 'Lyric'),
      //     BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music')
      //   ],
      // ),
    );
  }
}

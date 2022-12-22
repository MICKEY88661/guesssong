import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guesssong/presentation/blocs/lyric/lyric_ctrl.dart';

import '../../components/speaker.dart';

class LyricPage extends ConsumerWidget {
  const LyricPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(lyricCtrlProvider.notifier).getLyric();
          },
          child: Text('get'),
        ),
        Expanded(
          child: ref.watch(lyricCtrlProvider).lyric.when(
            data: (lyric) {
              return LyricWall(lyric);
            },
            error: (error, stackTrace) {
              return Text("error : $error");
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LyricWall extends StatefulWidget {
  final String lyric;
  const LyricWall(this.lyric, {super.key});

  @override
  State<LyricWall> createState() => _LyricWallState();
}

class _LyricWallState extends State<LyricWall> {
  late final ScrollController scrollCtrl;
  late final Speaker speaker;
  @override
  void initState() {
    scrollCtrl = ScrollController();
    speaker = Speaker();
    super.initState();
  }

  @override
  void dispose() {
    scrollCtrl.dispose();
    speaker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              speaker.speak('widget.lyric');
            },
            child: Text('speak'),
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            widget.lyric,
            style: TextStyle(fontSize: 30),
          ),
        ),
        // SingleChildScrollView(
        //   controller: scrollCtrl,
        //   child:
        // ),
      ],
    );
  }
}

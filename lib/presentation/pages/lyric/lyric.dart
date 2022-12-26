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
        TextField(
          onChanged: (value) {
            ref.read(lyricCtrlProvider.notifier).typed(value);
          },
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(lyricCtrlProvider.notifier).getLyric();
          },
          child: Text('get'),
        ),
        Expanded(
          child: ref.watch(lyricCtrlProvider).lyric.when(
            data: (lyric) {
              String a =
                  "Information Technology (IT). Information Technology (IT) refers to all aspects of managing and processing information using computers and computer networks. Because computers are vital to information management in all organizations and companies, most organizations have dedicated computer personnel referred to as IT departments. IT departments generally deal with computer, telecommunications, network and other related technologies and services to provide employees with the resources necessary to reach their organizations' goals. Information Technology is one of the fastest-growing career fields in the world today. IT skills are essential in all industries and are necessary in many different job roles. Introduction to IT Business and Careers.";
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
  int speakingStart = 0;
  int speakingEnd = 0;

  @override
  void initState() {
    scrollCtrl = ScrollController();
    speaker = Speaker(progressHandler);
    super.initState();
  }

  void progressHandler(String text, int s, int e, String word) {
    speakingStart = s;
    speakingEnd = s + word.length;

    setState(() {});
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
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  speaker.speak(widget.lyric);
                },
                child: Text('speak'),
              ),
              ElevatedButton(
                onPressed: () {
                  speaker.flutterTts.pause();
                },
                child: Text('pause'),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.lyric.substring(0, speakingStart),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextSpan(
                  text: widget.lyric.substring(speakingStart, speakingEnd),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                TextSpan(
                  text:
                      widget.lyric.substring(speakingEnd, widget.lyric.length),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/entities/song_list_entity.dart';
import '../../blocs/music/music_ctrl.dart';
import '../../components/video_player.dart';

part 'song_list.dart';

class MusicPage extends ConsumerStatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends ConsumerState<MusicPage>
    with AutomaticKeepAliveClientMixin {
  late final AudioPlayer player;
  late final TextEditingController controller;
  int currentStep = 0;

  @override
  void initState() {
    player = AudioPlayer();
    controller = TextEditingController();
    super.initState();
  }

  void onStepTapped(int index) {
    if (index < 0) return;
    if (index > 2) return;

    setState(() {
      currentStep = index;
    });
  }

  @override
  void dispose() {
    player.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Guess by \nMUSIC',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'Guess the song by its music',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Stepper(
            currentStep: currentStep,
            onStepTapped: onStepTapped,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      switch (details.currentStep) {
                        case 0:
                          controller.clear();
                          break;
                        case 1:
                          ref.read(musicCtrlProvider.notifier).quizSelected('');
                          break;
                        case 2:
                          break;
                        default:
                      }
                      onStepTapped(--currentStep);
                    },
                    child: const Text('cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      switch (details.currentStep) {
                        case 0:
                          ref
                              .read(musicCtrlProvider.notifier)
                              .searchQuestionBase();
                          break;
                        case 1:
                          ref.read(musicCtrlProvider.notifier).getQuiz();
                          break;
                        case 2:
                          break;
                        default:
                      }
                      onStepTapped(++currentStep);
                    },
                    child: const Text('next'),
                  )
                ],
              );
            },
            steps: [
              // 1
              Step(
                title: const Text('Search for queston base'),
                subtitle:
                    const Text('by singer, album, year or other keywords'),
                content: TextField(
                  controller: controller,
                  onChanged: (value) {
                    ref
                        .read(musicCtrlProvider.notifier)
                        .searchKeywordTyped(value);
                  },
                  onSubmitted: (value) {
                    ref.read(musicCtrlProvider.notifier).searchQuestionBase();
                  },
                ),
              ),
              // 2
              Step(
                title: const Text('Choose a queston base'),
                subtitle: const Text('source from KKBOX\'s song lists'),
                content: SizedBox(
                  height: 200.0,
                  child: ref.watch(musicCtrlProvider).songLists.when(
                    data: (songList) {
                      return SongList(songList);
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
              ),
              // 3
              Step(
                  title: const Text('Guess!'),
                  subtitle: const Text('we will play the preview music'),
                  content: ref.watch(musicCtrlProvider).quiz.when(
                    data: (quiz) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                            onPressed: () {},
                            child: const Icon(
                              Icons.skip_previous_outlined,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () async {
                              try {
                                if (player.playing) {
                                  player.pause();
                                  return;
                                }

                                final previewUrl = await ref
                                    .read(musicCtrlProvider.notifier)
                                    .getMusicPreview();
                                await player.setUrl(previewUrl);
                                player.play();
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const Icon(
                              Icons.play_circle,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {},
                            child: const Icon(
                              Icons.skip_next_outlined,
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Text("error : $error");
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

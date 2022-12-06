import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/entities/song_list_entity.dart';
import '../../blocs/music/music_ctrl.dart';

part 'song_list.dart';

class MusicPage extends ConsumerStatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends ConsumerState<MusicPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final AudioPlayer player;
  late final TextEditingController controller;
  late AnimationController animationCtrl;
  late Animation<double> imageOpacity;

  int currentStep = 0;
  bool isShowHint = false;
  bool isShowAns = false;

  @override
  void initState() {
    player = AudioPlayer();
    controller = TextEditingController();
    animationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    imageOpacity = Tween<double>(begin: 0, end: 1).animate(animationCtrl);

    super.initState();
  }

  void showHint(bool show) {
    show ? animationCtrl.forward() : animationCtrl.reset();
    setState(() {
      isShowHint = show;
    });
  }

  void showAnswer(bool show) {
    setState(() {
      isShowAns = show;
    });
  }

  void onStepTapped(int index) {
    if (index < 0) return;
    if (index > 2) return;
    if (currentStep != 2) {
      showHint(false);
      showAnswer(false);
    }
    setState(() {
      currentStep = index;
    });
  }

  Future<void> playNext() async {
    final previewUrl =
        await ref.read(musicCtrlProvider.notifier).getMusicPreview();
    await player.setUrl(previewUrl);
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    controller.dispose();
    animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guess by MUSIC',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Guess the song by its music',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Stepper(
            physics: const ClampingScrollPhysics(),
            currentStep: currentStep,
            onStepTapped: onStepTapped,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              // TODO prettier
              switch (details.currentStep) {
                // step 1
                case 0:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.clear();
                        },
                        child: const Text('cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(musicCtrlProvider.notifier)
                              .searchQuestionBase();
                          onStepTapped(++currentStep);
                        },
                        child: const Text('next'),
                      )
                    ],
                  );
                // step 2
                case 1:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          ref.read(musicCtrlProvider.notifier).quizSelected('');
                          onStepTapped(--currentStep);
                        },
                        child: const Text('cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          ref.read(musicCtrlProvider.notifier).getQuiz();
                          onStepTapped(++currentStep);
                        },
                        child: const Text('next'),
                      )
                    ],
                  );
                // step 3
                case 2:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          showHint(!isShowHint);
                        },
                        child: const Text('hint'),
                      ),
                      TextButton(
                        onPressed: () {
                          showAnswer(!isShowAns);
                        },
                        child: const Text('Answer'),
                      )
                    ],
                  );
                default:
                  return const SizedBox();
              }
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
                      if (songList.isEmpty) {
                        return const Text('no data');
                      }
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
                subtitle: const Text('tap to play the preview music'),
                content: ref.watch(musicCtrlProvider).quiz.when(
                  data: (quiz) {
                    final currentTrack =
                        ref.watch(musicCtrlProvider).currentTrack;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // player control btn
                        Row(
                          children: [
                            StreamBuilder(
                              stream: player.playerStateStream,
                              builder: (context, playerStatus) {
                                bool isPlaying = false;
                                if (playerStatus.data != null) {
                                  isPlaying = playerStatus.data!.playing &&
                                      playerStatus.data!.processingState !=
                                          ProcessingState.completed;
                                }
                                return FloatingActionButton(
                                  onPressed: () async {
                                    if (playerStatus.data!.processingState ==
                                        ProcessingState.idle) {
                                      playNext();
                                      return;
                                    }
                                    isPlaying ? player.pause() : player.play();
                                  },
                                  child: Icon(
                                    isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                  ),
                                );
                              },
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                player.pause();
                                player.seek(Duration.zero);
                                player.play();
                              },
                              child: const Icon(
                                Icons.replay,
                              ),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                showHint(false);
                                showAnswer(false);
                                playNext();
                              },
                              child: const Icon(
                                Icons.skip_next_outlined,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        // quiz info
                        Text(
                          quiz.title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          quiz.description,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const Divider(),
                        // hint
                        Image.network(
                          currentTrack?.album.imageUrl ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                          opacity: imageOpacity,
                        ),
                        AnimatedOpacity(
                          opacity: isShowHint ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Artist: ${currentTrack?.artist.name}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'Album: ${currentTrack?.album.name}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        // answer
                        AnimatedOpacity(
                          opacity: isShowAns ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Text('Song: ${currentTrack?.name}'),
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
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

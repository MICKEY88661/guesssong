import 'package:flutter/material.dart';

import '../../components/stepper_ctrl_btn.dart';
import '../../components/video_player.dart';

class LyricPage extends StatefulWidget {
  const LyricPage({super.key});

  @override
  State<LyricPage> createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  int currentStep = 0;

  void onStepTapped(int index) {
    setState(() {
      currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Guess by LYRIC',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'Guess the song by its lyric',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Stepper(
            currentStep: currentStep,
            onStepTapped: onStepTapped,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return const StepperControlButton();
            },
            steps: [
              const Step(
                title: Text('Search for queston base'),
                subtitle: Text('by singer, album, year or other keywords'),
                content: TextField(),
              ),
              Step(
                title: const Text('Choose a queston base'),
                subtitle: const Text('source from KKBOX\'s song lists'),
                content: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox.square(
                          dimension: 200.0,
                          child: Text('$index'),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Step(
                title: Text('Guess!'),
                subtitle: Text('robot will read the lyrics'),
                content: VideoPlayer(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

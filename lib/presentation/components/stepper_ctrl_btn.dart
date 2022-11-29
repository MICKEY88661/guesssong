import 'package:flutter/material.dart';

// TODO
class StepperControlButton extends StatefulWidget {
  const StepperControlButton({super.key});

  @override
  State<StepperControlButton> createState() => _StepperControlButtonState();
}

class _StepperControlButtonState extends State<StepperControlButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: Text('cancel')),
        TextButton(onPressed: () {}, child: Text('next'))
      ],
    );
  }
}

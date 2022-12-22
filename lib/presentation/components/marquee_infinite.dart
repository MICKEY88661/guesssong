import 'dart:async';

import 'package:flutter/material.dart';

// 無限跑馬燈
class MarqueeInfinite extends StatefulWidget {
  final String content;
  const MarqueeInfinite(this.content, {super.key});

  @override
  State<MarqueeInfinite> createState() => _MarqueeInfiniteState();
}

class _MarqueeInfiniteState extends State<MarqueeInfinite> {
  late final ScrollController scrollCtrl;
  late final Timer timer;
  final duration = const Duration(seconds: 1);
  final scrollOffset = 300.0;

  @override
  void initState() {
    scrollCtrl = ScrollController();
    timer = Timer.periodic(duration, (timer) {
      scrollCtrl.animateTo(
        timer.tick * scrollOffset,
        duration: duration,
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: Opacity(
            opacity: 0.0,
            child: Text(
              widget.content,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 170,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
        const SizedBox(width: double.infinity),
        Positioned.fill(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            controller: scrollCtrl,
            itemBuilder: (c, i) {
              return Text(
                widget.content,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 170,
                  overflow: TextOverflow.visible,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

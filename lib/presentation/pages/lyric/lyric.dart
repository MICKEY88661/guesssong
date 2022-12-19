import 'dart:async';

import 'package:flutter/material.dart';

class LyricPage extends StatelessWidget {
  const LyricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: MarqueeOnce('12345'),
        ),
        SliverToBoxAdapter(
          child: MarqueeInfinite('12111'),
        ),
        SliverToBoxAdapter(
          child: MarqueeOnce('12345'),
        ),
      ],
    );
  }
}

// 一次跑馬燈
class MarqueeOnce extends StatefulWidget {
  final String content;
  const MarqueeOnce(this.content, {super.key});

  @override
  State<MarqueeOnce> createState() => _MarqueeOnceState();
}

class _MarqueeOnceState extends State<MarqueeOnce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(-1, 0.0),
    ).animate(_controller);

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return FractionalTranslation(
          translation: _animation.value,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Text(
              widget.content,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 170,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        );
      },
    );
  }
}

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

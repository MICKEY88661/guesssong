import 'package:flutter/material.dart';

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
      end: Offset(-1.1, 0.0),
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

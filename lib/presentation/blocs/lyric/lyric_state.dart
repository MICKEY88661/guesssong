import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LyricState extends Equatable {
  final AsyncValue<String> lyric;

  const LyricState({
    required this.lyric,
  });

  LyricState copywith({
    AsyncValue<String>? lyric,
  }) {
    return LyricState(
      lyric: lyric ?? this.lyric,
    );
  }

  @override
  List<Object?> get props => [lyric];
}

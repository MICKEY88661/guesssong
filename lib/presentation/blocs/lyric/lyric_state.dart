import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LyricState extends Equatable {
  final String? songName;
  final AsyncValue<String> lyric;

  const LyricState({
    this.songName,
    required this.lyric,
  });

  LyricState copywith({
    AsyncValue<String>? lyric,
    String? songName,
  }) {
    return LyricState(
      lyric: lyric ?? this.lyric,
      songName: songName ?? this.songName,
    );
  }

  @override
  List<Object?> get props => [lyric, songName];
}

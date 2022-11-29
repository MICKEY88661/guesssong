import 'package:guesssong/presentation/blocs/lyric/lyric_state.dart';
import 'package:riverpod/riverpod.dart';

final lyricCtrlProvider = StateNotifierProvider((ref) {
  const state = LyricState();
  return LyricController(state);
});

// TODO
class LyricController extends StateNotifier<LyricState> {
  LyricController(super.state);
}

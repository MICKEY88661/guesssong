import '../../data/models/quiz.dart';
import 'track_entity.dart';

class QuizEntity {
  final String id;
  final String sourceUrl;
  final String title;
  final String description;
  final List<TrackEntity> tracks;

  QuizEntity({
    required this.id,
    required this.sourceUrl,
    required this.title,
    required this.description,
    required this.tracks,
  });

  factory QuizEntity.fromModel(QuizModel model) {
    List<TrackEntity> tracks = [];
    for (var track in model.tracks!.data!) {
      tracks.add(TrackEntity.formModel(track));
    }

    return QuizEntity(
      id: model.id ?? '',
      sourceUrl: model.url ?? '',
      title: model.title ?? '',
      description: model.description ?? '',
      tracks: tracks,
    );
  }
}

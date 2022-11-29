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

  // TODO do mapping
  factory QuizEntity.fromModel() {
    return QuizEntity(
      id: '',
      sourceUrl: '',
      title: '',
      description: '',
      tracks: [],
    );
  }
}

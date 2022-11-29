class SongListEntity {
  final String id;
  final String imageUrl;
  final String title;

  SongListEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
  // TODO do mapping
  factory SongListEntity.fromModel() {
    return SongListEntity(
      id: '',
      imageUrl: '',
      title: '',
    );
  }
}

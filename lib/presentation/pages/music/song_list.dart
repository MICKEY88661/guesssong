part of 'music.dart';

class SongList extends ConsumerStatefulWidget {
  final List<SongListEntity> songLists;
  const SongList(
    this.songLists, {
    super.key,
  });

  @override
  ConsumerState<SongList> createState() => _SongListState();
}

class _SongListState extends ConsumerState<SongList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.songLists.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final songList = widget.songLists[index];
        return InkWell(
          onTap: () {
            ref.read(musicCtrlProvider.notifier).quizSelected(songList.id);
          },
          child: SizedBox.square(
            dimension: 200.0,
            child: Container(
              color:
                  ref.watch(musicCtrlProvider).selectedSongListId == songList.id
                      ? Theme.of(context).colorScheme.secondary
                      : null,
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.network(songList.imageUrl),
                  Container(
                    color: Theme.of(context).cardColor,
                    child: Text(
                      songList.title,
                      style: Theme.of(context).textTheme.overline,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

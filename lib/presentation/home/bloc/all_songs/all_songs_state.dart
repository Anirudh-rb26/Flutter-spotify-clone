import 'package:spotifyclone/domain/entities/song/song.dart';

abstract class AllSongsState {}

class AllSongsLoading extends AllSongsState {}

class AllSongsLoaded extends AllSongsState {
  final List<SongEntity> songs;
  AllSongsLoaded({required this.songs});
}

class AllSongsLoadFailure extends AllSongsState {}

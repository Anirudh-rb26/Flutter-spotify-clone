import 'package:spotifyclone/domain/entities/song/song.dart';

abstract class RecentSongsState {}

class RecentSongsLoading extends RecentSongsState {}

class RecentSongsLoaded extends RecentSongsState {
  final List<SongEntity> songs;

  RecentSongsLoaded({required this.songs});
}

class RecentSongsLoadFailure extends RecentSongsState {}

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotifyclone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotifyclone/presentation/home/bloc/recent_songs/recent_songs_state.dart';
import 'package:spotifyclone/service_locator.dart';

class RecentSongsCubit extends Cubit<RecentSongsState> {
  RecentSongsCubit() : super(RecentSongsLoading());

  Future<void> getRecentSongs() async {
    var returnedSongs = await serviceLocator<GetNewSongUsecase>().call();
    returnedSongs.fold(
      (left) => emit(RecentSongsLoadFailure()),
      (data) => emit(RecentSongsLoaded(songs: data)),
    );
  }
}

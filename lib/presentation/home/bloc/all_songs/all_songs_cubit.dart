import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/song/get_all_songs_usecase.dart';
import 'package:spotifyclone/presentation/home/bloc/all_songs/all_songs_state.dart';
import 'package:spotifyclone/service_locator.dart';

class AllSongsCubit extends Cubit<AllSongsState> {
  AllSongsCubit() : super(AllSongsLoading());

  Future<void> getAllSongsList() async {
    var returnedSongs = await serviceLocator<GetAllSongsUsecase>().call();

    returnedSongs.fold(
      (left) => emit(AllSongsLoadFailure()),
      (data) => emit(AllSongsLoaded(songs: data)),
    );
  }
}

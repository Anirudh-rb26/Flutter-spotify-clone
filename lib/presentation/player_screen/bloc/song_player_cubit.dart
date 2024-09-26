import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotifyclone/presentation/player_screen/bloc/song_player_state.dart';

class PlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songDurationPosition = Duration.zero;

  PlayerCubit() : super(SongPlayerStateLoading()) {
    audioPlayer.positionStream.listen((position) {
      songDurationPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerStateLoaded());
  }

  Future<void> loadSong(String url) async {
    print("url: ${url}");
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerStateLoaded());
    } catch (e) {
      emit(SongPlayerStateFailure());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }

    emit(SongPlayerStateLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}

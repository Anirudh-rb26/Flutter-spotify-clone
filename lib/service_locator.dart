import 'package:get_it/get_it.dart';
import 'package:spotifyclone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotifyclone/data/repository/song/song_repository_impl.dart';
import 'package:spotifyclone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotifyclone/data/sources/song/song_firestore_service.dart';
import 'package:spotifyclone/domain/repositories/auth/auth_repository.dart';
import 'package:spotifyclone/domain/repositories/song/song_repository.dart';
import 'package:spotifyclone/domain/usecases/auth/login_usecase.dart';
import 'package:spotifyclone/domain/usecases/auth/register_usecase.dart';
import 'package:spotifyclone/domain/usecases/song/get_all_songs_usecase.dart';
import 'package:spotifyclone/domain/usecases/song/get_new_song_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());
  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());

  serviceLocator.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  serviceLocator.registerSingleton<SongRepository>(SongRepositoryImpl());

  serviceLocator.registerSingleton<GetNewSongUsecase>(GetNewSongUsecase());
  serviceLocator.registerSingleton<GetAllSongsUsecase>(GetAllSongsUsecase());
}

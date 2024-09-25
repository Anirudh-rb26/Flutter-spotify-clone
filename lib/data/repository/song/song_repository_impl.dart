import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/sources/song/song_firestore_service.dart';
import 'package:spotifyclone/domain/repositories/song/song_repository.dart';
import 'package:spotifyclone/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await serviceLocator<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getAllSongs() async {
    return await serviceLocator<SongFirebaseService>().getAllSongs();
  }
}

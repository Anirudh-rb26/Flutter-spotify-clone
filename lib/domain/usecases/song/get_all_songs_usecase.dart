import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/domain/repositories/song/song_repository.dart';
import 'package:spotifyclone/service_locator.dart';

class GetAllSongsUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<SongRepository>().getAllSongs();
  }
}

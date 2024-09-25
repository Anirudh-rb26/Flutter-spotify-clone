import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artists;
  num? duration;
  Timestamp? releaseDate;

  SongModel({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artists = data['artists'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artists!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}

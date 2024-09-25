import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/core/configs/constants/urls.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';

class SongPlayerScreen extends StatelessWidget {
  final SongEntity song;

  const SongPlayerScreen({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: const Text(
          "Now Playing",
          style: TextStyle(fontSize: 18),
        ),
        playerMoreOption: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.ellipsis_vertical),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        child: Column(
          children: [
            _songCover(context),
            const SizedBox(height: 20),
            _songDetails(song),
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(AppUrls.urlFirestorage + song.title + AppUrls.mediaAlt),
        ),
      ),
    );
  }

  Widget _songDetails(SongEntity song) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(fontSize: 22),
              // textAlign: TextAlign.start,
            ),
            Text(
              song.artist,
              style: const TextStyle(fontSize: 16),
              // textAlign: TextAlign.start,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.heart,
            size: 30,
          ),
        )
      ],
    );
  }
}

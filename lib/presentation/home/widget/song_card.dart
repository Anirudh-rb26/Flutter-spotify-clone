import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';
import 'package:spotifyclone/common/widgets/button/small_play_button.dart';
import 'package:spotifyclone/core/configs/constants/urls.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/presentation/home/bloc/recent_songs/recent_songs_cubit.dart';
import 'package:spotifyclone/presentation/home/bloc/recent_songs/recent_songs_state.dart';
import 'package:spotifyclone/presentation/player_screen/pages/song_player_screen.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecentSongsCubit()..getRecentSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<RecentSongsCubit, RecentSongsState>(
          builder: (context, state) {
            if (state is RecentSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: AppColors.primary),
              );
            }
            if (state is RecentSongsLoaded) {
              return _cards(state.songs);
            }
            if (state is RecentSongsLoadFailure) {
              return Container(
                alignment: Alignment.center,
                child: Text("Error try again later."),
              );
            }
            return Container(); // Default case
          },
        ),
      ),
    );
  }

  Widget _cards(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => SongPlayerScreen(song: songs[index])),
            );
          },
          child: SizedBox(
            width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AlbumCover Image & PlayButton
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(AppUrls.urlImagesFirestorage + songs[index].title + AppUrls.imageMediaAlt),
                        fit: BoxFit.cover,
                      ),
                    ),

                    // PLayButton
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey),
                        child: const SmallPlayButton(),
                      ),
                    ),
                  ),
                ),

                // Gap
                const SizedBox(height: 8),

                // SongTitle Name
                Text(
                  songs[index].title,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // SongArtist Name
                Text(
                  songs[index].artist,
                  style: const TextStyle(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemCount: songs.length,
    );
  }
}

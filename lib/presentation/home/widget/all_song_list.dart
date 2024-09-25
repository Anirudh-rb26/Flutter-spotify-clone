import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';
import 'package:spotifyclone/common/widgets/button/small_play_button.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/presentation/home/bloc/all_songs/all_songs_cubit.dart';
import 'package:spotifyclone/presentation/home/bloc/all_songs/all_songs_state.dart';
import 'package:spotifyclone/presentation/player_screen/pages/song_player_screen.dart';

class AllSongList extends StatelessWidget {
  const AllSongList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllSongsCubit()..getAllSongsList(),
      child: BlocBuilder<AllSongsCubit, AllSongsState>(builder: (context, state) {
        if (state is AllSongsLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          );
        }

        if (state is AllSongsLoaded) {
          return Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Recomended Text
                  Text(
                    "Recomended",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  // SeeMore Text
                  Text(
                    "See More",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),
                  ),
                ],
              ),

              // Gap
              const SizedBox(height: 20),

              // List of Recomended Songs
              _allSongs(state.songs),
            ],
          );
        }

        return Container();
      }),
    );
  }

  Widget _allSongs(List<SongEntity> songs) {
    return ListView.separated(
      itemCount: songs.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => SongPlayerScreen(song: songs[index])),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Leading PlayIcon
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode ? AppColors.darkGrey : const Color(0XFFE6E6E6),
                    ),
                    child: const SmallPlayButton(),
                  ),

                  // Gap
                  const SizedBox(width: 20),

                  // SongTitle & SongArtist
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SongName
                      Text(
                        songs[index].title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16),
                      ),

                      // SongArtists
                      Text(
                        songs[index].artist,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // SongDuration and FavouriteButton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SongDuration Text
                  Text(songs[index].duration.toString().replaceAll('.', ':')),

                  // Gap
                  const SizedBox(width: 10),

                  // LikeButton
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/core/configs/constants/urls.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/presentation/player_screen/bloc/song_player_cubit.dart';
import 'package:spotifyclone/presentation/player_screen/bloc/song_player_state.dart';

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
      body: BlocProvider(
        create: (_) => PlayerCubit()..loadSong(AppUrls.urlAudioFirestorage + song.title + AppUrls.audioMediaAlt),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 20),
              _songDetails(song),
              const SizedBox(height: 20),
              _songControl(context),
            ],
          ),
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
          image: NetworkImage(AppUrls.urlImagesFirestorage + song.title + AppUrls.imageMediaAlt),
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
            // SongName Text
            Text(
              song.title,
              style: const TextStyle(fontSize: 22),
            ),

            // SongArtists Text
            Text(
              song.artist,
              style: const TextStyle(fontSize: 16),
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

  Widget _songControl(BuildContext context) {
    return BlocBuilder<PlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerStateLoading) {
          return const CupertinoActivityIndicator(color: AppColors.primary);
        }
        if (state is SongPlayerStateLoaded) {
          return Column(
            children: [
              // SongSeeker Slider
              Slider(
                min: 0.0,
                max: context.read<PlayerCubit>().songDuration.inSeconds.toDouble(),
                value: context.read<PlayerCubit>().songDurationPosition.inSeconds.toDouble(),
                onChanged: (value) {},
              ),

              // Gap
              const SizedBox(height: 20),

              // Durations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(context.read<PlayerCubit>().songDurationPosition)),
                  Text(formatDuration(context.read<PlayerCubit>().songDuration)),
                ],
              ),

              // SongControl Buttons
              GestureDetector(
                onTap: () => context.read<PlayerCubit>().playOrPauseSong(),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(
                    child: Icon(
                      context.read<PlayerCubit>().audioPlayer.playing ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

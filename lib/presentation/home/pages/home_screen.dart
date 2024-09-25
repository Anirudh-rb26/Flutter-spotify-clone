import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/home/widget/all_song_list.dart';
import 'package:spotifyclone/presentation/home/widget/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: SvgPicture.asset(AppVectors.vectorAppLogo, height: 40, width: 40),
        hideNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Featured Artist Card
              _homeFeatureCard(),

              // Tab Bar
              _tabs(),

              // Tab Views
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    SongCard(),
                    Center(child: Text("Comming Soon")),
                    Center(child: Text("Comming Soon")),
                    Center(child: Text("Comming Soon")),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Recomendations SongList
              const AllSongList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeFeatureCard() {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            // Featured Artist Card
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.vectorHomeCard),
            ),

            // Featured Artist Image
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Image.asset(AppImages.homeArtistImage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.center,
      // indicatorSize: ,
      tabs: const [
        Text(
          'Recent',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Your Mix',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Podcast',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}

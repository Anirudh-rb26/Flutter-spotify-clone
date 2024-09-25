import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/common/widgets/button/primary_button.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/presentation/introduction_screens/choose_theme.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BackgroundImage
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.getStartedBackgroundImage),
              ),
            ),
          ),

          // ScreenTint
          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          // Applogo, TextDescriptions, GetStarted Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            child: Column(
              children: [
                // AppLogo
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.vectorAppLogo),
                ),

                const Spacer(),

                // TextDescription Title
                const Text(
                  "Enjoy Listening to Music",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 20),

                // TextDescription Description
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 20),

                // Primary ElevatedButton
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => const ChooseThemeScreen()),
                    );
                  },
                  buttonTitle: "Get Started",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

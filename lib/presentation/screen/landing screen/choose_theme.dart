import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/widgets/button/primary_button.dart';
import 'package:spotifyclone/core/assets/app_assets/app_images.dart';
import 'package:spotifyclone/core/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({super.key});

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  bool isLightMode = true;

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
                image: AssetImage(AppImages.chooseModeBackgroundImage),
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

                // ChooseMode Section
                // ChooseMode Title
                const Text(
                  "Choose Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 40),

                // ChooseMode Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LightMode Button
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLightMode = true;
                            });
                          },

                          // IconButton
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: isLightMode ? ImageFilter.blur(sigmaX: 50, sigmaY: 50) : ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: 80,
                                width: 80,
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),

                                // IconButton Icon
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(AppVectors.vectorSun),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // IconButton Text
                        Text(
                          "Light Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: isLightMode ? Colors.white : AppColors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 40),

                    // DarkMode Button
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLightMode = false;
                            });
                          },

                          // IconButton
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: isLightMode ? ImageFilter.blur(sigmaX: 5, sigmaY: 5) : ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                              child: Container(
                                height: 80,
                                width: 80,
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),

                                // ButtonIcon
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(AppVectors.vectorMoon),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // IconButton Text
                        Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: isLightMode ? AppColors.grey : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Primary ElevatedButton
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ChooseThemeScreen()),
                    );
                  },
                  buttonTitle: "Start Listening",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

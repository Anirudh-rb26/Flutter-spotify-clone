import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/common/widgets/button/primary_button.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/auth_screens/register_screen.dart';
import 'package:spotifyclone/presentation/auth_screens/login_screen.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Stack(
        children: [
          // TopRight Pattern
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.vectorTopPattern),
          ),

          // BottomRight Pattern
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.vectorBottomPattern),
          ),

          // BottomLeft Artist Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBackgroundImage),
          ),

          // AppLogo, DescriptionText, Login & Register Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  SvgPicture.asset(AppVectors.vectorAppLogo),

                  const SizedBox(height: 55),

                  // DescriptionText Title
                  const Text(
                    "Enjoy Listening to Music \nOnly On Spotify",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // DescriptionText Subtitle
                  Text(
                    "Spotify is a proprietary Swedish audio streaming platform and media service provider.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Login & RegisterButton
                  Row(
                    children: [
                      // Login Button
                      Expanded(
                        flex: 1,
                        child: PrimaryButton(
                          onPressed: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
                          },
                          buttonTitle: "Log In",
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Register Button
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

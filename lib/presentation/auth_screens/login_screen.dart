import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/common/widgets/button/primary_button.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/data/model/auth/login_user_request.dart';
import 'package:spotifyclone/domain/usecases/auth/login_usecase.dart';
import 'package:spotifyclone/presentation/auth_screens/register_screen.dart';
import 'package:spotifyclone/presentation/home/pages/home_screen.dart';
import 'package:spotifyclone/service_locator.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: SvgPicture.asset(AppVectors.vectorAppLogo, height: 35),
      ),
      bottomNavigationBar: _signinText(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            children: [
              _logInText(),
              const SizedBox(height: 50),
              _emailTextFeild(_emailController),
              const SizedBox(height: 20),
              _passwordTextFeild(_passwordController),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () async {
                  var result = await serviceLocator<LoginUsecase>().call(
                    params: LoginUserRequest(
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString(),
                    ),
                  );

                  result.fold(
                    (left) {
                      var snackbar = SnackBar(
                        content: Text(left, style: const TextStyle(color: Colors.white)),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (right) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                  );
                },
                buttonTitle: "Log In",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logInText() {
    return const Text(
      "Log In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _emailTextFeild(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordTextFeild(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Normal Text
          const Text(
            "Don't have an Account?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Clickable Text
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => RegisterScreen()));
            },
            child: const Text(
              "Create an Account",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

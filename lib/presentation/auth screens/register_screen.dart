import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/common/widgets/appbar/appbar.dart';
import 'package:spotifyclone/common/widgets/button/primary_button.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/data/model/auth/create_user_request.dart';
import 'package:spotifyclone/domain/usecases/auth/register_usecase.dart';
import 'package:spotifyclone/presentation/auth%20screens/login_screen.dart';
import 'package:spotifyclone/presentation/home/pages/home_screen.dart';
import 'package:spotifyclone/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 50),
              _nameTextFeild(_nameController),
              const SizedBox(height: 20),
              _emailTextFeild(_emailController),
              const SizedBox(height: 20),
              _passwordTextFeild(_passwordController),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () async {
                  var result = await serviceLocator<RegisterUsecase>().call(
                    params: CreateUserRequest(
                      userName: _nameController.text.toString(),
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
                buttonTitle: "Create your Account",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _nameTextFeild(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(hintText: "Full Name"),
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
            "Already have an account?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Clickable Text
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

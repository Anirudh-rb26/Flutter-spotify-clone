import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        buttonTitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

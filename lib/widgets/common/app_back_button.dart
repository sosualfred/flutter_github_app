import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        innerAppNavKey.currentState!.pop();
      },
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        height: 36,
        width: 36,
        child: const Icon(
          Iconsax.arrow_left_2,
          color: primaryColor,
          size: 24,
        ),
      ),
    );
  }
}

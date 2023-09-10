import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:ms_undraw/ms_undraw.dart';

class AppPlaceholder extends StatelessWidget {
  const AppPlaceholder({
    super.key,
    this.title,
    required this.illustration,
  });

  final Widget? title;
  final UnDrawIllustration illustration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: title != null,
          child: title ?? const SizedBox(),
        ),
        Visibility(
          visible: title != null,
          child: const SizedBox(
            height: 17,
          ),
        ),
        Container(
          width: 260,
          height: 260,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: UnDraw(
            color: primaryColor,
            illustration: illustration,
            errorWidget: const Icon(
              Icons.error_outline,
              color: primaryColor,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

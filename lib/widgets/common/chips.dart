import 'package:flutter/material.dart';
import 'package:flutter_github_app/widgets/common/label.dart';

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    required this.labels,
    required this.color,
  });

  final List<String> labels;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: labels
          .map(
            (label) => Label(
              label: label,
              color: color,
            ),
          )
          .toList(),
    );
  }
}

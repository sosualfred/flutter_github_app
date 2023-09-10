import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';

class ResultsCount extends StatelessWidget {
  const ResultsCount({
    super.key,
    required this.searchTerm,
    required this.resultsCount,
  });

  final String searchTerm;
  final int resultsCount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Showing',
        children: [
          TextSpan(
            text: ' $resultsCount results',
            style: const TextStyle(color: grey800),
          ),
          const TextSpan(
            text: ' for',
          ),
          TextSpan(
            text: ' $searchTerm',
            style: const TextStyle(color: grey800),
          ),
        ],
        style: const TextStyle(fontSize: 16, color: grey400),
      ),
    );
  }
}

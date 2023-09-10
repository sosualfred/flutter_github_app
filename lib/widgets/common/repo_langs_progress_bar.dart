import 'package:flutter/material.dart';
import 'package:flutter_github_app/models/repo_language.dart';
import 'package:flutter_github_app/utils/formatters.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class RepoLangsProgressBar extends StatelessWidget {
  const RepoLangsProgressBar({
    super.key,
    required this.languages,
  });

  final List<RepoLanguage> languages;

  @override
  Widget build(BuildContext context) {
    int totalValue = languages.fold(
      0,
      (accValue, language) => accValue + language.value,
    );

    List<Segment> segments = languages
        .map(
          (language) => Segment(
            value: language.value,
            color: hexToColor(language.color),
            label: Text(language.name),
            valueLabel: Text(
              "${(language.value / totalValue * 100).toStringAsFixed(1)}%",
            ),
          ),
        )
        .toList();

    return PrimerProgressBar(
      segments: segments,
      maxTotalValue: totalValue,
      legendStyle: const SegmentedBarLegendStyle(
        maxLines: 5,
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
      ),
      barStyle: const SegmentedBarStyle(
        padding: EdgeInsets.all(0),
        size: 12,
      ),
      legendItemBuilder: (segment) {
        return LegendItem(
          segment: segment,
          style: LegendItemStyle(
            labelStyle: TextStyle(
              color: segment.color,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
          ),
        );
      },
      legendEllipsisBuilder: (truncatedItemCount) {
        final othersTotal = segments
            .skip(
              segments.length - truncatedItemCount,
            )
            .fold(
              0,
              (accValue, segment) => accValue + segment.value,
            );
        final valueLabel = (othersTotal / totalValue * 100).toStringAsFixed(1);
        return LegendItem(
          segment: Segment(
            value: othersTotal,
            color: Colors.grey,
            label: const Text("Other"),
            valueLabel: Text("$valueLabel%"),
          ),
        );
      },
    );
  }
}

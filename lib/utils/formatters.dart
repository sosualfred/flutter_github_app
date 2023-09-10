import 'package:intl/intl.dart';

String formatNumberToCompact(int number) {
  NumberFormat numberFormat = NumberFormat.compact();
  return numberFormat.format(number).toLowerCase();
}

List<String> generateRepoLangs({
  required List repos,
  limit = 5,
}) {
  List<String> languages = [];

  for (Map repo in repos) {
    repo['node']['languages']['edges'].forEach(
      (lang) {
        languages.add(lang['node']['name']);
      },
    );
  }

  return languages.toSet().toList().take(limit).toList();
}

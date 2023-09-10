import 'package:flutter/material.dart';
import 'package:flutter_github_app/models/repo_language.dart';
import 'package:intl/intl.dart';

String formatNumberToCompact(int number) {
  NumberFormat numberFormat = NumberFormat.compact();
  return numberFormat.format(number).toLowerCase();
}

List<String> generateUserLangsStrings({
  required List repos,
  limit = 5,
}) {
  List<String> languages = [];

  for (Map repo in repos) {
    repo['node']?['languages']?['edges'].forEach(
      (lang) {
        if (lang['node']?['name'] == null) {
          return;
        }
        languages.add(lang['node']?['name']);
      },
    );
  }

  return languages.toSet().toList().take(limit).toList();
}

List<String> generateLangStrings({
  required List langs,
  limit = 5,
}) {
  List<String> languages = [];

  for (Map lang in langs) {
    if (lang['node']?['name'] == null) {
      continue;
    }
    languages.add(lang['node']?['name']);
  }

  return languages.toSet().toList().take(limit).toList();
}

List<RepoLanguage> generateRepoLangs({
  required List langs,
}) {
  List<RepoLanguage> languages = [];

  for (Map lang in langs) {
    languages.add(
      RepoLanguage(
        name: lang['node']?['name'] ?? 'n/a',
        color: lang['node']?['color'] ?? '#808080',
        value: lang['size'] ?? 0,
      ),
    );
  }

  return languages.toSet().toList();
}

/// Formats a date string to dd/MM/yyyy format.
String formatDate(String? date) {
  if (date == null) {
    return '---';
  }

  DateTime dateTime = DateTime.parse(date);
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

/// Formats a data string to MMM dd, yyyy format.
String formatDateToLong(String? date) {
  if (date == null) {
    return '---';
  }

  DateTime dateTime = DateTime.parse(date);
  return DateFormat('MMM dd, yyyy').format(dateTime);
}

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }
  return string[0].toUpperCase() + string.substring(1).toLowerCase();
}

/// Convert html color hex code to Color object.
/// Example: #ffffff -> Color(0xffffffff)
Color hexToColor(String hex) {
  if (hex.length != 7 || !hex.startsWith('#')) {
    return Colors.grey;
  }
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

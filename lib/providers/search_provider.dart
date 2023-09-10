import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchTermProvider = StateNotifierProvider<SearchProvider, String>((ref) {
  return SearchProvider();
});

class SearchProvider extends StateNotifier<String> {
  SearchProvider() : super('');

  void setSearchTerm(String searchTerm) {
    state = searchTerm;
  }
}

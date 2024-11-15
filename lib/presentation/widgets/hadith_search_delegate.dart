import 'package:flutter/material.dart';

import '../../core/strings/app_strings.dart';
import 'hadith_search_content.dart';

class HadithSearchDelegate extends SearchDelegate {
  HadithSearchDelegate() : super(searchFieldLabel: AppStrings.searchByHadith);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
        onPressed: () {
          query = '';
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: transitionAnimation,
              ),
      ) : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return HadithSearchContent(searchQuery: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return HadithSearchContent(searchQuery: query);
  }
}
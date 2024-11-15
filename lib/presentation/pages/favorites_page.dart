import 'package:flutter/material.dart';
import 'package:hadiths/presentation/lists/favorite_hadiths_list.dart';

import '../../core/strings/app_strings.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.favorites),
      ),
      body: const FavoriteHadithsList()
    );
  }
}

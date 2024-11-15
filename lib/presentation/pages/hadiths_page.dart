import 'package:flutter/material.dart';
import 'package:hadiths/presentation/lists/main_hadiths_list.dart';
import 'package:hadiths/presentation/widgets/hadith_search_delegate.dart';

import '../../core/strings/app_strings.dart';

class HadithsPage extends StatelessWidget {
  const HadithsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appName),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: HadithSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const MainHadithsList());
  }
}

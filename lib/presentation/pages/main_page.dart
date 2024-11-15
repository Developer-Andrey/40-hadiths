import 'package:flutter/material.dart';
import 'package:hadiths/core/routes/route_names.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/strings/app_strings.dart';
import '../state/main_bottom_bar_state.dart';
import 'favorites_page.dart';
import 'hadiths_page.dart';
import 'settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _mainPages = <Widget>[
    const HadithsPage(),
    const FavoritesPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final mainBottomBarState = Provider.of<MainBottomBarState>(context);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: _mainPages[mainBottomBarState.getIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: appColors.secondary,
        unselectedItemColor: appColors.secondary,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.format_list_bulleted_outlined),
            title: const Text(
              AppStrings.hadiths,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.bookmark_border),
            title: const Text(
              AppStrings.favorites,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text(
              AppStrings.settings,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
        ],
        currentIndex: mainBottomBarState.getIndex,
        onTap: (int index) {
          mainBottomBarState.setIndex = index;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.inversePrimary,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.addHadithPage);
        },
      ),
    );
  }
}

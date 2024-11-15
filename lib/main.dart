import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/state/hadith_data_state.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/main_bottom_bar_state.dart';
import 'presentation/state/settings_state.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainBottomBarState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithDataState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}

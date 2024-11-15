import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadiths/presentation/state/settings_state.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/style/app_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.settings),
      ),
      body: Padding(
        padding: AppStyles.mainPaddingHorizontal,
        child: Consumer<SettingsState>(
          builder: (BuildContext context, settings, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                const Text(
                  AppStrings.theme,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  groupValue: settings.getThemeIndex,
                  children: const <int, Widget>{
                    1: Text(AppStrings.light),
                    2: Text(AppStrings.dark),
                    3: Text(AppStrings.adaptive),
                  },
                  onValueChanged: (int? themeIndex) {
                    settings.setThemeIndex = themeIndex!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.textSize,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  groupValue: settings.getTextSize,
                  children: const <int, Widget>{
                    0: Text(AppStrings.normal),
                    1: Text(AppStrings.medium),
                    2: Text(AppStrings.large),
                  },
                  onValueChanged: (int? themeIndex) {
                    settings.setTextSize = themeIndex!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.display,
                  style: TextStyle(fontSize: 20),
                ),
                SwitchListTile(
                  title: const Text(AppStrings.alwaysOn),
                  value: settings.getAlwaysOn,
                  onChanged: (bool onChanged) {
                    settings.setAlwaysOn = onChanged;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

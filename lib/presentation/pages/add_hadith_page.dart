import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/style/app_styles.dart';
import '../../data/state/hadith_data_state.dart';

class AddHadithPage extends StatefulWidget {
  const AddHadithPage({super.key});

  @override
  State<AddHadithPage> createState() => _AddHadithPageState();
}

class _AddHadithPageState extends State<AddHadithPage> {
  final _hadithNumberController = TextEditingController();
  final _hadithTitleController = TextEditingController();
  final _hadithArabicController = TextEditingController();
  final _hadithTranslationController = TextEditingController();

  @override
  void dispose() {
    _hadithNumberController.dispose();
    _hadithTitleController.dispose();
    _hadithArabicController.dispose();
    _hadithTranslationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.addHadith),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _hadithNumberController,
              autofocus: true,
              decoration: const InputDecoration(hintText: AppStrings.enterNumberHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithTitleController,
              decoration: const InputDecoration(hintText: AppStrings.enterTitleHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithArabicController,
              decoration: const InputDecoration(hintText: AppStrings.enterArabicHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithTranslationController,
              decoration: const InputDecoration(hintText: AppStrings.enterTranslationHadith),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                final mapHadith = <String, dynamic> {
                  'hadith_number': _hadithNumberController.text.trim(),
                  'hadith_title': _hadithTitleController.text.trim(),
                  'hadith_arabic': _hadithArabicController.text.trim(),
                  'hadith_translation': _hadithTranslationController.text.trim(),
                  'name_audio': 'nameAudio',
                  'favorite_state': 0,
                };
                if (_hadithNumberController.text.isNotEmpty && _hadithTitleController.text.isNotEmpty && _hadithArabicController.text.isNotEmpty && _hadithTranslationController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: appColors.secondary,
                      content: const Text(
                        AppStrings.added,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                  Provider.of<HadithDataState>(context, listen: false).addHadith(mapHadith: mapHadith);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Text(AppStrings.add),
            ),
          ],
        ),
      ),
    );
  }
}

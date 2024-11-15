import 'package:flutter/material.dart';
import 'package:hadiths/domain/entities/hadith_entity.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/style/app_styles.dart';
import '../../data/state/hadith_data_state.dart';

class ChangeHadithPage extends StatefulWidget {
  const ChangeHadithPage({
    super.key,
    required this.hadithModel,
  });

  final HadithEntity hadithModel;

  @override
  State<ChangeHadithPage> createState() => _ChangeHadithPageState();
}

class _ChangeHadithPageState extends State<ChangeHadithPage> {
  late final TextEditingController _hadithNumberController;
  late final TextEditingController _hadithTitleController;
  late final TextEditingController _hadithArabicController;
  late final TextEditingController _hadithTranslationController;

  @override
  void initState() {
    _hadithNumberController = TextEditingController(text: widget.hadithModel.hadithNumber);
    _hadithTitleController = TextEditingController(text: widget.hadithModel.hadithTitle);
    _hadithArabicController = TextEditingController(text: widget.hadithModel.hadithArabic);
    _hadithTranslationController = TextEditingController(text: widget.hadithModel.hadithTranslation);
    super.initState();
  }

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
        title: Text(widget.hadithModel.hadithNumber),
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
              maxLines: 3,
              decoration: const InputDecoration(hintText: AppStrings.enterTitleHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithArabicController,
              maxLines: 25,
              style: const TextStyle(fontFamily: 'Uthmanic'),
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(hintText: AppStrings.enterArabicHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithTranslationController,
              maxLines: 25,
              decoration: const InputDecoration(hintText: AppStrings.enterTranslationHadith),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                final mapHadith = <String, dynamic>{
                  'hadith_number': _hadithNumberController.text.trim(),
                  'hadith_title': _hadithTitleController.text.trim(),
                  'hadith_arabic': _hadithArabicController.text.trim(),
                  'hadith_translation': _hadithTranslationController.text.trim(),
                  'name_audio': 'nameAudio',
                  'favorite_state': 0,
                };
                bool checkIsEmpty = _hadithNumberController.text.isNotEmpty && _hadithTitleController.text.isNotEmpty && _hadithArabicController.text.isNotEmpty && _hadithTranslationController.text.isNotEmpty;
                bool checkIseEquality = _hadithNumberController.text != widget.hadithModel.hadithNumber || _hadithTitleController.text != widget.hadithModel.hadithTitle || _hadithArabicController.text != widget.hadithModel.hadithArabic || _hadithTranslationController.text != widget.hadithModel.hadithTranslation;
                if (checkIsEmpty && checkIseEquality) {
                  Navigator.of(context).pop();
                  Provider.of<HadithDataState>(context, listen: false).changeHadith(hadithId: widget.hadithModel.id, mapHadith: mapHadith);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: appColors.secondary,
                      content: const Text(
                        AppStrings.changed,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Text(AppStrings.change),
            ),
          ],
        ),
      ),
    );
  }
}

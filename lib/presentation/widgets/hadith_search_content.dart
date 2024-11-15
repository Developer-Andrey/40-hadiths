import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../data/state/hadith_data_state.dart';
import '../../domain/entities/hadith_entity.dart';
import '../items/hadith_item.dart';
import 'error_text_data.dart';
import 'text_data.dart';

class HadithSearchContent extends StatefulWidget {
  const HadithSearchContent({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  State<HadithSearchContent> createState() => _HadithSearchContentState();
}

class _HadithSearchContentState extends State<HadithSearchContent> {
  List<HadithEntity> _hadiths = [];
  List<HadithEntity> _recentHadiths = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context).fetchAllHadiths(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _hadiths = snapshot.data!;
          _recentHadiths = widget.searchQuery.isEmpty
              ? _hadiths
              : _hadiths.where((element) =>
                      element.hadithNumber
                          .toLowerCase()
                          .contains(widget.searchQuery.toLowerCase()) ||
                      element.hadithTitle
                          .toLowerCase()
                          .contains(widget.searchQuery.toLowerCase()))
                  .toList();
          if (_recentHadiths.isEmpty && widget.searchQuery.isNotEmpty) {
            return const TextData(text: AppStrings.searchIsEmpty);
          } else {
            return Scrollbar(
              child: ListView.builder(
                itemCount: _recentHadiths.length,
                itemBuilder: (context, index) {
                  final HadithEntity hadithModel = _recentHadiths[index];
                  return HadithItem(
                    hadithModel: hadithModel,
                    index: index,
                  );
                },
              ),
            );
          }
        } else if (snapshot.hasError) {
          return ErrorTextData(errorText: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

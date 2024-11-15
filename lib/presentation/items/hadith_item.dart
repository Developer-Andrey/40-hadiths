import 'package:flutter/material.dart';
import 'package:hadiths/core/style/app_styles.dart';
import 'package:hadiths/data/models/arguments/hadith_model_args.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_names.dart';
import '../../core/strings/app_strings.dart';
import '../../data/models/arguments/hadith_args.dart';
import '../../data/state/hadith_data_state.dart';
import '../../domain/entities/hadith_entity.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({
    super.key,
    required this.hadithModel,
    required this.index,
  });

  final HadithEntity hadithModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color oddColor = appColors.primary.withOpacity(0.05);
    final Color evenColor = appColors.primary.withOpacity(0.10);
    return ListTile(
      tileColor: index.isOdd ? oddColor : evenColor,
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.hadithDetailPage,
          arguments: HadithArgs(hadithId: hadithModel.id),
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => Padding(
            padding: AppStyles.mainPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RouteNames.changeHadithPage,
                      arguments: HadithModelArgs(hadithModel: hadithModel),
                    );
                  },
                  child: const Text(AppStrings.change),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<HadithDataState>(context, listen: false).removedHadith(hadithId: hadithModel.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 350),
                        backgroundColor: appColors.secondary,
                        content: const Text(
                          AppStrings.removed,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                  child: const Text(AppStrings.remove),
                ),
              ],
            ),
          ),
        );
      },
      title: Text(
        hadithModel.hadithNumber,
        style: TextStyle(
          color: appColors.secondary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        hadithModel.hadithTitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Provider.of<HadithDataState>(context, listen: false).fetchAddRemoveFavorite(
            hadithId: hadithModel.id,
            favoriteState: hadithModel.favoriteState == 0 ? 1 : 0,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 350),
              backgroundColor: appColors.secondary,
              content: Text(
                hadithModel.favoriteState == 1
                    ? AppStrings.removedFromFavorite
                    : AppStrings.addedToFavorite,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
        icon: hadithModel.favoriteState == 0
            ? const Icon(Icons.bookmark_border)
            : const Icon(Icons.bookmark),
      ),
    );
  }
}

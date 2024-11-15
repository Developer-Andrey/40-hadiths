import 'package:flutter/material.dart';

import '../../domain/entities/hadith_entity.dart';
import '../../domain/usecases/hadiths_use_case.dart';
import '../repositories/hadiths_data_repository.dart';

class HadithDataState extends ChangeNotifier {
  final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());

  Future<List<HadithEntity>> fetchAllHadiths() async {
    return await _hadithUseCase.fetchAllHadiths();
  }

  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    return await _hadithUseCase.fetchHadithById(hadithId: hadithId);
  }

  Future<List<HadithEntity>> fetchFavoriteHadiths() async {
    return await _hadithUseCase.fetchFavoriteHadiths();
  }

  Future<void> fetchAddRemoveFavorite({required int hadithId, required int favoriteState}) async {
    await _hadithUseCase.fetchAddRemoveHadith(hadithId: hadithId, favoriteState: favoriteState);
    notifyListeners();
  }

  Future<int> fetchFavoriteState({required int hadithId}) async {
    final int favoriteState = await _hadithUseCase.fetchFavoriteState(hadithId: hadithId);
    return favoriteState;
  }

  Future<void> addHadith({required Map<String, Object?> mapHadith}) async {
    _hadithUseCase.fetchAddHadith(mapHadith: mapHadith);
    notifyListeners();
  }

  Future<void> changeHadith({required int hadithId, required Map<String, Object?> mapHadith}) async {
    _hadithUseCase.fetchChangeHadith(hadithId: hadithId, mapHadith: mapHadith);
    notifyListeners();
  }

  Future<void> removedHadith({required int hadithId}) async {
    _hadithUseCase.fetchRemoveHadith(hadithId: hadithId);
    notifyListeners();
  }
}
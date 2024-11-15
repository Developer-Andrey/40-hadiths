import '../entities/hadith_entity.dart';
import '../repositories/hadiths_repository.dart';

class HadithUseCase {
  final HadithRepository _hadithRepository;

  HadithUseCase(this._hadithRepository);

  Future<List<HadithEntity>> fetchAllHadiths() async {
    try {
      final List<HadithEntity> getAllHadiths = await _hadithRepository.getAllHadiths();
      return getAllHadiths;
    } catch (e) {
      throw Exception('Ошибка при получении всех хадисов:\n\n$e');
    }
  }

  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    try {
      final HadithEntity getHadithById = await _hadithRepository.getHadithById(hadithId: hadithId);
      return getHadithById;
    } catch (e) {
      throw Exception('Ошибка при получении хадиса по id:\n\n$e');
    }
  }

  Future<List<HadithEntity>> fetchFavoriteHadiths() async {
    try {
      final List<HadithEntity> getFavoriteHadiths = await _hadithRepository.getAllFavoriteHadiths();
      return getFavoriteHadiths;
    } catch (e) {
      throw Exception('Ошибка при получении избранных хадисов:\n\n$e');
    }
  }

  Future<void> fetchAddRemoveHadith({required int hadithId, required int favoriteState}) async {
    try {
      return await _hadithRepository.addRemoveFavorite(hadithId: hadithId, favoriteState: favoriteState);
    } catch (e) {
      throw Exception('Ошибка при добавлении/удалении хадиса из избранного:\n\n$e');
    }
  }

  Future<int> fetchFavoriteState({required int hadithId}) async {
    try {
      return await _hadithRepository.getFavoriteState(hadithId: hadithId);
    } catch (e) {
      throw Exception('Ошибка при получении избранного:\n\n$e');
    }
  }

  Future<void> fetchAddHadith({required Map<String, dynamic> mapHadith}) async {
    try {
      return await _hadithRepository.addHadith(mapHadith: mapHadith);
    } catch (e) {
      throw Exception('Ошибка при добавлении хадиса:\n\n$e');
    }
  }

  Future<void> fetchChangeHadith({required int hadithId, required Map<String, dynamic> mapHadith}) async {
    try {
      return await _hadithRepository.changeHadith(hadithId: hadithId, mapHadith: mapHadith);
    } catch (e) {
      throw Exception('Ошибка при изменении хадиса:\n\n$e');
    }
  }

  Future<void> fetchRemoveHadith({required int hadithId}) async {
    try {
      return await _hadithRepository.removedHadith(hadithId: hadithId);
    } catch (e) {
      throw Exception('Ошибка при удалении хадиса:\n\n$e');
    }
  }
}

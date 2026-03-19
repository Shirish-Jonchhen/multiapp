import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDatasource {
  Future<Set<int>> getFavoriteIds();
  Future<void> addFavorite(int id);
  Future<void> removeFavorite(int id);
}

@LazySingleton(as: ProductLocalDatasource)
class ProductLocalDatasourceImpl implements ProductLocalDatasource {
  static const _favKey = 'favorite_product_ids';

  @override
  Future<Set<int>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_favKey) ?? [];
    return list.map(int.parse).toSet();
  }

  @override
  Future<void> addFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favKey) ?? [];
    if (!current.contains(id.toString())) {
      current.add(id.toString());
      await prefs.setStringList(_favKey, current);
    }
  }

  @override
  Future<void> removeFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favKey) ?? [];
    current.remove(id.toString());
    await prefs.setStringList(_favKey, current);
  }
}

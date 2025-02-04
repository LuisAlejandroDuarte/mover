import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';

class StorageImpl<T> extends Storage<T> {
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  StorageImpl(
    super.key, {
    required this.fromJson,
    required this.toJson,
  });

  @override
  Future<T?> get() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    }

    return null;
  }

  @override
  Future<void> save(T entity) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(toJson(entity));
    await prefs.setString(key, jsonString);
  }

  @override
  Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<void> saveList(List<T?>? list) async {
    final prefs = await SharedPreferences.getInstance();
    list ??= [];
    // Convertimos cada objeto de la lista a JSON, ignorando valores nulos
    List<String> jsonList = list
        .where((item) => item != null)
        .map((item) => json.encode(toJson(item!)))
        .toList();

    // Guardamos la lista de strings en SharedPreferences
    await prefs.setStringList(key, jsonList);
  }

  @override
  Future<List<T?>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(key);

    if (jsonList != null) {
      // Convertimos cada JSON string en un objeto de tipo T
      List<T?> list = jsonList.map((jsonString) {
        if (jsonString.isNotEmpty) {
          return fromJson(json.decode(jsonString));
        }
        return null;
      }).toList();

      return list;
    }

    return <T?>[]; // Retorna una lista vacía de T si no hay datos
  }
}

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
      return fromJson(jsonMap); // Usar el decoder
    }

    return null;
  }

  @override
  Future<void> save(T entity) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(toJson(entity)); // Usar la función toJson
    await prefs.setString(key, jsonString);
  }

  @override
  Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

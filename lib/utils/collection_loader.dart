import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/collection.dart';

Future<List<Collection>> loadCollections() async {
  final String jsonString =
      await rootBundle.loadString('data/collections.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Collection.fromJson(json)).toList();
}

Future<Collection?> loadCollection(String collectionId) async {
  final collections = await loadCollections();
  for (var collection in collections) {
    if (collection.id == collectionId) {
      return collection;
    }
  }
  return null;
}

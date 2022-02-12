import 'dart:io';

import '/model/pray_category.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

class DBHelper {
  Database? _database;
  final String databaseName = 'abnet.db';
  Future<void> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, databaseName);
    bool dbExists = await File(dbPath).exists();
    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }
    _database = await openDatabase(dbPath);
  }

  Future<List<PrayCategory>> getPrayCategories() async {
    if (_database == null) {
      await initDB();
    }

    // rawQuery with Left Join over 2 Tables
    String query = 'SELECT id,'
         ' name, ' 
        ' nibab_id, ' 
        ' title,' 
        ' category_id,' 
        ' content,' 
        ' voice_path' 
        ' FROM category' 
        ' LEFT JOIN nibab ON category_id = id ORDER BY nibab_id';
    List<Map<String, dynamic>>? result = await _database?.rawQuery(query);

    // new Map groupBy collection_id

    var newMap = groupBy(result!, (item) {
      Map<String, dynamic> item2 = item as Map<String, dynamic>;
      return item2['id'];
    });

// create new Map
    List<Map<String, dynamic>> newMap2 = [];
    newMap.forEach((f, values) {
      // add new Map the same as your Model
      newMap2.add({
        "id": f,
        "name": values[0]
            ["name"], // use first value in list it is always the same
        "items":
            values // all values from the item Table +Collection Fields but they are nut used
      });
    });
    // toList function to your List Model
    List<PrayCategory> categories =
        newMap2.map((i) => PrayCategory.fromJson(i)).toList();

    return categories;

    // var  response = await _database?.query("category");
    // return response!.map((e) => PrayCategory.fromJson(e)).toList();
  }
}

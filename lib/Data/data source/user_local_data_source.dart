import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../../data/data%20source/user_data_table.dart';
import '../../data/models/carousel.dart';
import '../models/results.dart';
import '../../data/data%20source/db_client.dart';

class UserLocalDataSource {
  DBClient _dbClient;

  UserLocalDataSource() {
    _dbClient = DBClient();
  }

  Future<Carousel> getUserData({int limit = 5}) async {
    Database database = await _dbClient.database;
    List<Map<String, dynamic>> mapVlaues =
        await database.query(UserDataTable.TABLE_NAME, limit: limit);
    List<Results> results = {mapVlaues ?? []}.isNotEmpty
        ? mapVlaues
            .map((it) =>
                UserDataTable.resultsFromMapValues(it)..isFavourite = true)
            .toList()
        : [];
    return Carousel(results: results);
  }

  Future<Carousel> getUserDataById(String id) async {
    Database database = await _dbClient.database;
    List<Map<String, dynamic>> mapValues = await database.query(
      UserDataTable.TABLE_NAME,
      where: '${UserDataTable.ID} = ?',
      whereArgs: [id],
    );
    Results results = UserDataTable.resultsFromMapValues(mapValues.first);
    return Carousel(results: [results]);
  }

  Future<bool> removeUserById(String id) async {
    Database database = await _dbClient.database;
    bool success = await database.delete(
          UserDataTable.TABLE_NAME,
          where: '${UserDataTable.ID} = ?',
          whereArgs: [id],
        ) >
        0;
    return success;
  }

  Future<bool> saveUser(Results results) async {
    Database databse = await _dbClient.database;
    bool success = await databse.insert(
          UserDataTable.TABLE_NAME,
          {
            UserDataTable.ID: results.id,
            UserDataTable.RESULTS_JSON: results.toJsonString(),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        ) >
        0;
    return success;
  }
}

// class UserLocalDataSource {
//   DBClient _dbClient;

//   UserLocalDataSource() {
//     _dbClient = DBClient();
//   }

//   Future<Carousel> getUserData({int limit = 5}) async {
//     var database = await _dbClient.database;
//     List<Map<String, dynamic>> mapValues =
//         await database.query(UserDataTable.TABLE_NAME, limit: limit);
//     List<Results> results = {mapValues ?? []}.isNotEmpty
//         ? mapValues
//             .map((it) =>
//                 UserDataTable.resultsFromMapValues(it)..isFavourite = true)
//             .toList()
//         : [];
//     return Carousel(results: results);
//   }

//   Future<Carousel> getUserDataById(String id) async {
//     var database = await _dbClient.database;
//     List<Map<String, dynamic>> mapValues = await database.query(
//       UserDataTable.TABLE_NAME,
//       where: '${UserDataTable.ID} = ?',
//       whereArgs: [id],
//     );
//     Results result = UserDataTable.resultsFromMapValues(mapValues.first);
//     return Carousel(results: [result]);
//   }

//   Future<bool> removeUserById(String id) async {
//     var database = await _dbClient.database;
//     bool success = await database.delete(
//           UserDataTable.TABLE_NAME,
//           where: '${UserDataTable.ID} = ?',
//           whereArgs: [id],
//         ) >
//         0;
//     return success;
//   }

//   Future<bool> saveUser(Results results) async {
//     var database = await _dbClient.database;
//     bool success = await database.insert(
//           UserDataTable.TABLE_NAME,
//           {
//             UserDataTable.ID: results.id,
//             UserDataTable.RESULTS_JSON: results.toJsonString(),
//           },
//           conflictAlgorithm: ConflictAlgorithm.replace,
//         ) >
//         0;
//     return success;
//   }
// }

// //part of hhtp client
// /*
//  * singleton class init db and has methods which will give pointers to open database object
//  * Data source will use this instance to write and read operations

//  */

// class UserLocalDataSource {
//   Database db;

//   //databse client
//   UserLocalDataSource() {
//     init();
//   }

//   void init() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentDirectory.path, 'Items.db');
//     db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (newdb, version) {
//         newdb.execute("""
//           CREATE TABLE Items
//           id INTEGER PRIMARY KEY
//           name TEXT
//           location TEXT
//           email TEXT
//           login TEXT
//           dob INTEGER
//           phone INTEGER
//           picture
//           """);
//       },
//     );
//   }

//   Future fetchItems(int id) async {
//     final map = await db.query(
//       'Items',
//       where: 'id?',
//       whereArgs: [id],
//     );
//     if (map.length > 0) {
//       return Results.fromJson(map.first);
//     }
//   }

//   Future addItems(Results results) {
//     return db.insert(
//       'Items',
//       results.toJson(),
//     );
//   }

//   Future clearItems() {
//     return db.delete('Items');
//   }
// }

// // no global wrong dont do it repo constructor

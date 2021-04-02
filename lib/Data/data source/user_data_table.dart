import 'dart:convert';

import '../../data/models/results.dart';

class UserDataTable {
  static const TABLE_NAME = "user_data_table";

  /// column names
  static const String ID = "id";
  static const String RESULTS_JSON = "userDataJson";
  static const String CREATE =
      "CREATE TABLE $TABLE_NAME ( $ID  TEXT PRIMARY KEY NOT NULL,"
      " $RESULTS_JSON TEXT); ";

  static Results resultsFromMapValues(Map<String, dynamic> map) {
    String data = map[RESULTS_JSON];
    return Results.fromJson(json.decode(data));
  }
}

// import 'package:sqflite/sqflite.dart';

// import '../../data/models/results.dart';
// import '../../data/models/carousel.dart';
// import '../../data/data%20source/db_client.dart';

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
//                 UserDataTable.resultsFromMapValues(it)..isFavorite = true)
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

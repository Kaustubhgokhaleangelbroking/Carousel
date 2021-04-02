// import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/data%20source/user_data_table.dart';

class DBClient {
  static const String DATABASE_NAME = "tinder.db";
  static const int DATABASE_VERSION = 1;

  DBClient._internal();

  static Database _database;

  static final DBClient _instance = DBClient._internal();

  factory DBClient() => _instance;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), DATABASE_NAME);
    var db = await openDatabase(
      path,
      version: DATABASE_VERSION,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return db;
  }

  Future<void> onCreate(Database db, int version) async =>
      await db.execute(UserDataTable.CREATE);

  void onUpgrade(Database db, int oldVersion, int newVersion) {}
}

/*
  final id;

  DbSingleton({this.id});
  * db client db instance fetch will be done by local data search
  DbProvider dbProvider = DbProvider();

  Future getData() {
    return dbProvider.sources[1].getUserData();
  }

  Future fetchItem(int id) async {
    Results results;

    // ignore: unused_local_variable
    var source;
    for (source in dbProvider.sources) {
      results = dbProvider.sources[0].fetchItem(id);
      if (results != null) {
        break;
      }
    }

    for (var cache in dbProvider.caches) {
      if (cache != dbProvider.sources) {
        cache.addItem(results);
      }
    }
    return results;
  }

  clearCache() async {
    for (var cache in dbProvider.caches) {
      await cache.clear();
    }
  }
  */

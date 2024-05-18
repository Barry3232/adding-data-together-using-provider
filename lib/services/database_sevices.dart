import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DataBaseServices {


  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(_dbFullPath(dbPath),
        onCreate: _createDb, version: 1
    );
  }

  static String _dbFullPath(String dbPath) {
    return path.join(dbPath, 'word.db');
  }

  static _createDb(Database db, int key) async {
    return db.execute('CREATE TABLE words_db(word Text)');
  }

  static Future<void> insert(String table,Map<String, dynamic> word) async{
    final db = await DataBaseServices.database();

    db.insert(
      table,
      word,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DataBaseServices.database();
    return db.query(table);
  }


  // static Future<void> deleteData(String table, String id) async {
  //   final db = await DBService.database();
  //   db.delete(table, where: 'id = ?', whereArgs: [id]);
  // }

  }



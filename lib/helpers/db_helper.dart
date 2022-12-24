import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath =
        await sql.getDatabasesPath(); //await beacuse it return future.
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT , image TEXT)');
    },
        version:
            1); //our path + db. in the first time if it not finding the db it will create one.
    await sqlDb.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}

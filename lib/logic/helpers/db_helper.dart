import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper{
  static Future<sql.Database> database() async{
    final dbpath= await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbpath,"tasks.db"),
      onCreate: (db,version){
        return db.execute(
          'CREATE TABLE tasks(id INTERGER PRIMARY KEY AUTOINCREMENT NOT NULL , task_name TEXT, is_done BOOL , '
        );
      },
      version: 1,
    );
    
  }
}
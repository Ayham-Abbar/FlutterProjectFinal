import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  static Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  static intialDb() async {
    String datapath = await getDatabasesPath();
    String path = join(datapath, 'eaxm.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    print('intialDb....................');
    return mydb;
  }

  static _onUpgrade(Database db, int oldversion, int newversion) async {
    await db.execute("ALTER TABLE orders ADD COLUMN kk TEXT");

    print("onUpgrade");
  }

  static _onCreate(Database db, int version) async {
    // Batch batch = db.batch();

    await db.execute('''
    CREATE TABLE "orders"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
    "User" TEXT,
    "total_price" TEXT,
    "count" TEXT

    )
    ''');
    //   await batch.commit();
    print("create");
  }

  static readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  static insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print('insert data......................');
    return response;
  }

  static updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  static deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

}

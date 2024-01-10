import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/detail_class.dart';

class Helper {
  Helper._();

  static final Helper helper = Helper._();
  static Database? db;
  String tableName = "plant";
  String colId = "id";
  String colName = "name";
  String colPrice = "price";
  String colDescription = "description";
  String colImage = "image";

  //create database
  Future<Database?> initDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'flutter.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int i) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT,$colPrice INTEGER, $colDescription INTEGER,role TEXT,$colImage BLOB);";
      await db.execute(query);
    });
    return db;
  }

  //Raw Insert
  Future<int> insertRaw({required Product data}) async {
    await initDb();
    String query =
        "INSERT INTO $tableName($colName, $colPrice,$colDescription) VALUES(?,?,?);";
    List args = [
      data.name,
      data.price,
      data.description,
    ];
    int i = await db!.rawInsert(query, args);
    return i;
  }

  //Read Data || Fetch Data
  Future<List<Product>> showData() async {
    db = await initDb();

    String query = "SELECT * FROM $tableName";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);

    List<Product> allData = data.map((e) => Product.fromMap(e)).toList();

    return allData;
  }

  //
  // //Update Data
  // updateData({required Detail data}) async {
  //   db = await initDb();
  //
  //   String query =
  //       "UPDATE $tableName SET $colName=? ,$colAge=? , $colCity =? ,$colCmpName=?, $colRole=? ,$colSalary=? WHERE $colId= ?;";
  //   List arg = [
  //     data.name,
  //     data.age,
  //     data.city,
  //     data.cmpName,
  //     data.role,
  //     data.salary,
  //     data.id
  //   ];
  //
  //   db!.rawUpdate(query, arg);
  // }
  //
  //Delete Data
  deleteData() async {
    db = await initDb();

    String query = "DELETE FROM $tableName";

    await db!.rawDelete(query);
  }
}

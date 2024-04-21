import 'package:area_calc/model/shape.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider extends ChangeNotifier {
  Database? _db;
  final table = "shapes";

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _initDb();
      return _db!;
    }
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "area.db");
    final db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute("""
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        shape_type TEXT,
        dimension1 REAL,
        dimension2 REAL,
        area REAL
        )
      """);
    });
    print(path);
    return db;
  }

  void insertCircle(double r, double area) async {
    await database;
    _db!.insert(table, {
      'shape_type': "circle",
      'dimension1': r,
      'area': area,
    });
    printAllData();
  }

  void insertTriangle(double b, double h, double area) async {
    await database;
    _db!.insert(table, {
      'shape_type': "triangle",
      'dimension1': b,
      'dimension2': h,
      'area': area,
    });
    printAllData();
  }

  Future<void> printAllData() async {
    final List<Map<String, dynamic>> maps = await _db!.query('shapes');

    print(maps);
  }

  Future<List<Shape>> getHistory() async {
    await database;
    final List<Map<String, dynamic>> maps = await _db!.query(table);
    return List.generate(maps.length, (i) {
      return Shape(maps[i]['shape_type'], maps[i]['dimension1'],
          maps[i]['dimension2'], maps[i]['area']);
    });
  }
}

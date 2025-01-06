import 'dart:io';
import 'package:flutter_application_1/Pertemuan12-13/Model/mobil.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, 'kendaraan.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mobil (
        id INTEGER PRIMARY KEY,
        nama TEXT,
        warna TEXT,
        tahun TEXT,
        transmisi TEXT
      )
    ''');
  }

  Future<List<Mobil>> getAllMbl() async {
    Database db = await instance.database;
    var mobil = await db.query('mobil', orderBy: 'nama');
    List<Mobil> listMbl =
        mobil.isNotEmpty ? mobil.map((e) => Mobil.fromMap(e)).toList() : [];
    return listMbl;
  }

  Future<int> addMbl(Mobil mbl) async {
    Database db = await instance.database;
    return db.insert('mobil', mbl.toMap());
  }
  
  Future<int> updateMbl(Mobil mbl) async {
    Database db = await instance.database;
    return await db.update('mobil', mbl.toMap(),
        where: 'id = ?', whereArgs: [mbl.id]);
  }
  Future<int> deleteMbl(int id) async {
    Database db = await instance.database;
    return await db.delete('mobil', where: 'id = ?', whereArgs: [id]);
  }
}
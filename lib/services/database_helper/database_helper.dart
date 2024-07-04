import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

import '../../models/word_db_model/word.dart';

class DatabaseHelper {
  static const String _dbName = 'dic.db'; // Specify your database name here
  static Database? _database;

  // Method to initialize the database if not already initialized
  static Future<Database> initializeDatabase() async {
    _database ??= await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _dbName);

    // Check if the database already exists
    final bool exists = await databaseExists(path);

    if (!exists) {
      // Copy the pre-created database file from assets
      ByteData data = await rootBundle.load(join('assets', _dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes into the database folder
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // Open the database
    return await openDatabase(path);
  }

  // CRUD Operations using Word model class

  static Future<int> insertWord(Word word) async {
    final db = await initializeDatabase();
    return await db.insert('Table_vn_kh', word.toMap());
  }

  static Future<int> updateWord(Word word) async {
    final db = await initializeDatabase();
    return await db.update(
      'Table_vn_kh',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  static Future<int> deleteWord(int id) async {
    final db = await initializeDatabase();
    return await db.delete(
      'Table_vn_kh',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Word>> getAllWords() async {
    final db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Table_vn_kh');
    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }
}

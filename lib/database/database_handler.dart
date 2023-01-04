

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:sqflite_practice/model/notes_model.dart';
class DBHelper {

  static Database? _db;

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db  = await initDatabase();
    return _db;
  }

  initDatabase() async {
    // print('looking for database');
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , 'notes.db');
    // print(path);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  
  _onCreate(Database db , int version) async {
    // db.execute("CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, age INTEGER NOT NULL, description TEXT NOT NULL,email TEXT)",);
    await db.execute( "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL,date TEXT,description TEXT NOT NULL, email TEXT)",
    );
  }

  Future<NotesModel> insert(NotesModel notesModel) async {
    var dbClient = await db;
    await dbClient!.insert('notes', notesModel.toMap());
    return notesModel;
  }

  Future<List<NotesModel>> getNotesList() async{
    var dbClient = await db;
    final List<Map<String , Object?>> queryResult = await dbClient!.query('notes');
    
    return queryResult.map((e) => NotesModel.formMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbclient = await db;
    return await dbclient!.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

}

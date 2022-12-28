import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_practice/model/note.dart';


class NotesDataBase {
  static final NotesDataBase instance = NotesDataBase._init();

  static Database? _database;

  NotesDataBase._init();

  Future<Database?> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database;
  }

  Future<Database?> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();
    String path = join(dbPath , filePath);

    return await openDatabase(path , version: 1 , onCreate: _createDB);
  }

  Future _createDB(Database db , int version) async {

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    db.execute('''
    CREATE TABLE $tableNotes (
    ${NoteFields.id} $idType,
    ${NoteFields.isImportant} $boolType,
    ${NoteFields.number} $integerType,
    ${NoteFields.title} $textType,
    ${NoteFields.descripition} $textType,
    ${NoteFields.time} $textType,
    
    )
    ''');
  }

  Future<Note?> create(Note note) async {
    final db = await instance.database;
    // final json = note.toJson();
    // final columns = '${NoteFields.title} , ${NoteFields.descripition} , ${NoteFields.time}';
    // final values = '${json[NoteFields.title]}, ${json[NoteFields.descripition]} , ${json[NoteFields.time]}';
    // final id = await db?.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db?.insert(tableNotes, note.toJson());
    return note.copy(id : id);
  }

  Future<Note?> readNote(int id) async {
    final db = await instance.database;
    
    final maps = await db?.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps!.isNotEmpty){
      return Note.fromJson(maps.first);
    }
  }

  Future colse() async {
    final db = await instance.database;

    db?.close();
  }

}
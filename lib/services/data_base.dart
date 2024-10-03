import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_auditoria/models/form.dart';
import 'package:app_auditoria/models/quest.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'audit_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Cria a tabela para o formulário
    await db.execute('''
      CREATE TABLE audit_forms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT
      )
    ''');

    // Cria a tabela para as perguntas
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        form_id INTEGER,
        questionText TEXT,
        answer INTEGER,
        selectOpId TEXT,
        imageData TEXT,
        FOREIGN KEY(form_id) REFERENCES audit_forms(id) ON DELETE CASCADE
      )
    ''');
  }

  // Método para salvar o formulário
  Future<int> insertForm(AuditForm form) async {
    final db = await database;
    int formId = await db.insert('audit_forms', {
      'title': form.title,
    });

    // Salva as perguntas associadas ao formulário
    for (var question in form.questions) {
      await db.insert('questions', {
        'form_id': formId,
        'questionText': question.questionText,
        'answer': question.answer == true ? 1 : 0,
        'selectOpId': question.selectOpId,
        'imageData': question.imageData,
      });
    }

    return formId;
  }

  // Método para obter os formulários
  Future<List<AuditForm>> getForms() async {
    final db = await database;
    final List<Map<String, dynamic>> formMaps = await db.query('audit_forms');

    List<AuditForm> forms = [];
    for (var formMap in formMaps) {
      List<Question> questions = await getQuestions(formMap['id']);
      forms.add(AuditForm(
        id: formMap['id'],
        title: formMap['title'],
        questions: questions,
      ));
    }
    return forms;
  }

  // Método para obter as perguntas de um formulário
  Future<List<Question>> getQuestions(int formId) async {
    final db = await database;
    final List<Map<String, dynamic>> questionMaps = await db.query(
      'questions',
      where: 'form_id = ?',
      whereArgs: [formId],
    );

    return List.generate(questionMaps.length, (i) {
      return Question(
        id: questionMaps[i]['id'],
        questionText: questionMaps[i]['questionText'],
        answer: questionMaps[i]['answer'] == 1 ? true : false,
        selectOpId: questionMaps[i]['selectOpId'],
        imageData: questionMaps[i]['imageData'],
      );
    });
  }
}

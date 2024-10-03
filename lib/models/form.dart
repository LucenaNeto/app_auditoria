import 'package:app_auditoria/models/quest.dart';

class AuditForm {
  int? id; // Identificador único do formulário
  String title; // Título do formulário
  List<Question> questions; // Lista de perguntas

  // Construtor
  AuditForm({
    this.id,
    required this.title,
    required this.questions,
  });

  // Converte o formulário em um mapa JSON para salvar no banco de dados ou enviar para APIs
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'questions': questions
          .map((q) => q.toJson())
          .toList(), // Converte cada pergunta para JSON
    };
  }

  // Constrói o objeto a partir de um mapa JSON
  factory AuditForm.fromJson(Map<String, dynamic> json) {
    return AuditForm(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(), // Converte cada item da lista de perguntas de JSON para Question
    );
  }
}

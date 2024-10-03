class Question {
  final int? id; // ID da pergunta, pode ser nulo
  String questionText; // Texto da pergunta
  bool? answer; // Resposta da pergunta (Sim/Não, verdadeiro/falso)
  String?
      selectOpId; // ID da opção selecionada, caso a pergunta seja de múltipla escolha
  String? imageData; // Caminho ou dados da imagem anexada

  // Construtor
  Question({
    required this.id,
    required this.questionText,
    this.answer,
    this.imageData,
    this.selectOpId,
  });

  // Método para converter a pergunta em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionText': questionText, // Corrigido o erro de digitação
      'answer': answer, // Incluindo a resposta no JSON
      'selectOpId': selectOpId,
      'imageData': imageData, // Corrigido o nome da variável
    };
  }

  // Método para criar uma instância de Question a partir de um mapa (JSON)
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['questionText'],
      answer: json['answer'], // Incluindo a resposta na desserialização
      selectOpId: json['selectOpId'],
      imageData: json['imageData'], // Corrigido o nome da variável
    );
  }
}

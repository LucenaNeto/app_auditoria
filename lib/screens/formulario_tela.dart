import 'package:flutter/material.dart';
import 'package:app_auditoria/models/quest.dart';
import 'package:app_auditoria/models/form.dart'; // Importe seu modelo AuditForm
import 'package:app_auditoria/services/data_base.dart'; // Importe o helper do banco de dados

class FormularioTela extends StatefulWidget {
  final String title;
  final List<Question> questions;

  FormularioTela({required this.title, required this.questions});

  @override
  _FormularioTelaState createState() => _FormularioTelaState();
}

class _FormularioTelaState extends State<FormularioTela> {
  final TextEditingController _questionController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _adicionarPergunta() {
    String questionText = _questionController.text.trim();
    if (questionText.isNotEmpty) {
      setState(() {
        widget.questions.add(
          Question(
            id: widget.questions.length + 1, // ID incrementado
            questionText: questionText,
            answer: null,
            selectOpId: null,
            imageData: null,
          ),
        );
        _questionController.clear(); // Limpa o campo após adicionar a pergunta
      });
    }
  }

  Future<void> _salvarFormulario() async {
    AuditForm form = AuditForm(
      title: widget.title,
      questions: widget.questions,
    );
    await DatabaseHelper().insertForm(form);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Formulário salvo com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Exibe o nome do formulário
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _salvarFormulario, // Chama o método de salvar
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Nova Pergunta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarPergunta,
              child: Text('Adicionar Pergunta'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.questions[index].questionText),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

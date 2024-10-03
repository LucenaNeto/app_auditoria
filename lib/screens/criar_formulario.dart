import 'package:flutter/material.dart';
import 'package:app_auditoria/screens/formulario_tela.dart';

class FormularioCriacaoTela extends StatefulWidget {
  @override
  _FormularioCriacaoTelaState createState() => _FormularioCriacaoTelaState();
}

class _FormularioCriacaoTelaState extends State<FormularioCriacaoTela> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _criarFormulario() {
    String title = _titleController.text.trim();
    if (title.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormularioTela(
            title: title, // Passa o título para a próxima tela
            questions: [], // Inicia com uma lista vazia de perguntas
          ),
        ),
      );
    } else {
      // Exibe um alerta se o nome do formulário estiver vazio
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Nome inválido'),
            content: Text('Por favor, insira um nome para o formulário.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Nome do Formulário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarFormulario,
              child: Text('Criar Formulário'),
            ),
          ],
        ),
      ),
    );
  }
}

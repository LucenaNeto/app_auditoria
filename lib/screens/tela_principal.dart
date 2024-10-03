//import 'package:app_auditoria/models/quest.dart';
import 'package:app_auditoria/screens/formulario_tela.dart';
import 'package:app_auditoria/screens/listar_formulario.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gerenciador de Auditorias',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Roboto', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(132, 10, 66, 34),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // centraliza verticalmente
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 20), // espaço entre a imagem e o botão
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: const Color.fromARGB(132, 101, 151, 123),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20)), // bordas arredondadas
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormularioTela(
                      title: 'Formulários',
                      questions: [],
                    ),
                  ),
                );
              },
              child: const Text(
                'Criar Novo Auditoria',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoSlab',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20), // espaço entre os botões
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: const Color.fromARGB(132, 101, 151, 123),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20)), // bordas arredondadas
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListaFormulariosTela(), // A nova tela de lista de formulários
                  ),
                );
              },
              child: const Text(
                'Ver Formulários Salvos',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoSlab',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

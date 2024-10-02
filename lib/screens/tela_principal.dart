import 'package:app_auditoria/screens/formulario_tela.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Auditorias'),
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
                textStyle: TextStyle(fontSize: 14),
                backgroundColor: const Color.fromARGB(132, 101, 151, 123),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20) // bordas arredondadas
                    ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormularioTela()),
                );
              },
              child: const Text('Crias Nova Audioria'),
            ),
          ],
        ),
      ),
    );
  }
}

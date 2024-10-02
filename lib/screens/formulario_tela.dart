import 'package:flutter/material.dart';

class FormularioTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Tela')),
      body: Center(
        child: Text('Você está na Segunda Tela!'),
      ),
    );
  }
}

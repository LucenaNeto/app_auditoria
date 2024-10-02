import 'package:app_auditoria/screens/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Auditorias',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaPrincipal(),
    );
  }
}

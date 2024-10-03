import 'package:app_auditoria/screens/formulario_tela.dart';
import 'package:flutter/material.dart';
import 'package:app_auditoria/services/data_base.dart';
import 'package:app_auditoria/models/form.dart';

class ListaFormulariosTela extends StatefulWidget {
  @override
  _ListaFormulariosTelaState createState() => _ListaFormulariosTelaState();
}

class _ListaFormulariosTelaState extends State<ListaFormulariosTela> {
  late Future<List<AuditForm>> _formulariosFuture;

  @override
  void initState() {
    super.initState();
    _formulariosFuture = DatabaseHelper().getForms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulários Salvos',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(132, 10, 66, 34),
      ),
      body: FutureBuilder<List<AuditForm>>(
        future: _formulariosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os formulários.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum formulário encontrado.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                AuditForm form = snapshot.data![index];
                return ListTile(
                  title: Text(form.title),
                  onTap: () {
                    // Ação ao clicar no formulário (ex: abrir o formulário)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormularioTela(
                          title: form.title,
                          questions: form.questions,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

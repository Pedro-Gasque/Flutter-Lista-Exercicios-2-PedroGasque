import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Aluno {
  final String nome;
  final String nota;

  Aluno({required this.nome, required this.nota});
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaAlunos());
  }
}

class TelaAlunos extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(nome: 'Pedro Gasque', nota: '9'),
      Aluno(nome: 'Eulampio', nota: '10'),
      Aluno(nome: 'Guts', nota: '5'),
      Aluno(nome: 'Eren', nota: '4'),
      Aluno(nome: 'Jade', nota: '8'),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Alunos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final aluno = alunos[index];

          return Card(
            child: ListTile(
              leading: Icon(Icons.school, size: 20),
              title: Text(
                aluno.nome,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: ${aluno.nota}'),
            ),
          );
        },
      ),
    );
  }
}

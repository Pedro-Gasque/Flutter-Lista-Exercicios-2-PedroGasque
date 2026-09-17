import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Livro {
  final String titulo;
  final String autor;

  Livro({required this.titulo, required this.autor});
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaLivros());
  }
}

class TelaLivros extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Livro> livros = [
      Livro(titulo: 'A Corte do Ar', autor: 'Stephen Hunt'),
      Livro(titulo: 'O chamado de Cthulhu', autor: 'H.P. Lovecraft'),
      Livro(
        titulo: 'Linguagem C - Completa e Descomplicada',
        autor: 'André Backes',
      ),
      Livro(titulo: 'Berserk', autor: 'Kentaro Miura'),
      Livro(
        titulo: 'UML - Uma Aboradagem Pratica',
        autor: 'Gilleanes T.A. Guedes',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];

          return Card(
            child: ListTile(
              leading: Icon(Icons.book, size: 20),
              title: Text(
                '${livro.titulo} -- ${livro.autor}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

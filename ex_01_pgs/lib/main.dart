import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Linguagens());
  }
}

class Linguagens extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> linguagens = [
      'Dart',
      'Python',
      'C',
      'Java',
      'Ruby',
      'TypeScript',
      'PHP',
      'SQL',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Lista Linguagens de Programação')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.code),
            title: Text(linguagens[index]),
          );
        },
      ),
    );
  }
}

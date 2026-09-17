import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CasatroTarefas(),
    );
  }
}

class CasatroTarefas extends StatefulWidget {
  const new({super.key});

  @override
  State<CasatroTarefas> createState() => _CasatroTarefasState();
}

class _CasatroTarefasState extends State<CasatroTarefas> {
  final TextEditingController tarefaController = TextEditingController();
  final List<String> tarefas = [];

  void limparCampos() {
    tarefaController.clear();
  }

  void adicionarProduto() {
    final String nomeTarefa = tarefaController.text;

    if (nomeTarefa.isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(nomeTarefa);
    });

    limparCampos();
  }

  void removeProduto(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: tarefaController,
              decoration: const InputDecoration(
                labelText: 'Descrição da Tabela: ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionarProduto,
                  child: const Text('Adicionar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: const Text('Limpar'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.inventory, size: 40),
                      title: Text(
                        tarefas[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          removeProduto(index);
                        },
                      ),
                    ),
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

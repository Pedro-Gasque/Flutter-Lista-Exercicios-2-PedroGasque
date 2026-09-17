import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  Produto({required this.nome, required this.preco, required this.quantidade});
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaProdutos(),
    );
  }
}

class TelaProdutos extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController qtdeController = TextEditingController();
  final List<Produto> produtos = [];

  void limparCampos() {
    nomeController.clear();
    precoController.clear();
    qtdeController.clear();
  }

  void adicionarProduto() {
    final String nomeProduto = nomeController.text.trim();
    final double precoProduto = double.tryParse(precoController.text) ?? 0;
    final int qtdeProduto = int.tryParse(qtdeController.text) ?? 0;

    if (nomeProduto.isEmpty || precoProduto <= 0 || qtdeProduto <= 0) {
      return;
    }

    setState(() {
      produtos.add(
        Produto(
          nome: nomeProduto,
          preco: precoProduto,
          quantidade: qtdeProduto,
        ),
      );
    });

    limparCampos();
  }

  void removeProduto(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    qtdeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estoque')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Produto: ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: precoController,
              decoration: const InputDecoration(
                labelText: 'Preço do Produto: ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: qtdeController,
              decoration: const InputDecoration(
                labelText: 'Quantidade do Produto: ',
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
              child: produtos.isEmpty
                  ? const Center(child: Text('Nenhum Produto Cadastrasdo'))
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        final Produto produto = produtos[index];

                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.inventory, size: 40),
                            title: Text(
                              produto.nome,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)} -- Quantidade: ${produto.quantidade}',
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

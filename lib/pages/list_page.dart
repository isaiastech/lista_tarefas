import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/services.dart'; // Importado para capturar o evento de tecla

class Tarefa {
  String titulo;
  DateTime dataHora;

  Tarefa({required this.titulo, required this.dataHora});
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController tarefaController = TextEditingController();
  final FocusNode focusNode = FocusNode(); // FocusNode para detectar Enter
  List<Tarefa> tarefas = [];
  Tarefa? tarefaRemovida; // Armazena a tarefa removida para permitir o desfazer
  int? tarefaRemovidaIndex; // Armazena o índice da tarefa removida

  void removerTarefa(int index) {
    setState(() {
      tarefaRemovida = tarefas[index];
      tarefaRemovidaIndex = index;
      tarefas.removeAt(index);
    });

    // Mostrar o SnackBar com a opção de desfazer
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tarefa excluída'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            // Restaura a tarefa excluída
            setState(() {
              tarefas.insert(tarefaRemovidaIndex!, tarefaRemovida!);
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Detecta pressionamento da tecla Enter
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        // Verifica se a tecla pressionada foi Enter
        RawKeyboard.instance.addListener((event) {
          if (event.logicalKey == LogicalKeyboardKey.enter) {
            _adicionarTarefa();
          }
        });
      }
    });
  }

  void _adicionarTarefa() {
    String textoDigitado = tarefaController.text;
    if (textoDigitado.isNotEmpty) {
      setState(() {
        tarefas.add(Tarefa(
          titulo: textoDigitado,
          dataHora: DateTime.now(),
        ));
      });
      tarefaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              if (tarefas.isEmpty) const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tarefaController,
                      focusNode: focusNode, // Associando o FocusNode
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex: Estudar',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _adicionarTarefa,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00d7f3),
                      padding: const EdgeInsets.all(14.0),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: tarefas.isEmpty
                    ? const Center(
                  child: Text(
                    'Nenhuma tarefa adicionada',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(tarefas[index].titulo),
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => removerTarefa(index),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Remover',
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(tarefas[index].titulo),
                          subtitle: Text(
                            'Criado em: ${tarefas[index].dataHora.day}/${tarefas[index].dataHora.month}/${tarefas[index].dataHora.year} '
                                'às ${tarefas[index].dataHora.hour}:${tarefas[index].dataHora.minute}',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui ${tarefas.length} tarefas pendentes'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tarefas.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00d7f3),
                      padding: const EdgeInsets.all(14.0),
                    ),
                    child: const Text('Limpar tudo'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

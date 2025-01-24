import 'package:flutter/material.dart';
import '../widgets/todo_list_item.dart';
class ListPage extends StatefulWidget {
   ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
   final TextEditingController tarefaController = TextEditingController();

   List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: tarefaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex: Estudar',
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    ElevatedButton(
                      onPressed: (){
                        String textoDigitado = tarefaController.text;
                        setState(() {
                          tarefas.add(textoDigitado);
                        });
                        tarefaController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14.0),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18,),
                // ListView com altura fixa ou Expanded
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (String tarefa in tarefas)
                        todoListItem(
                          title: tarefa,
                        ),
                      // Adicione mais widgets aqui para criar uma lista
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                Row(
                  children: [
                    Expanded(
                      child: Text('Você possui ${tarefas.length} tarefas pendentes'),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14.0),
                      ),
                      child: Text('Limpar tudo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
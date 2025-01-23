import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex: Estudar',
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  ElevatedButton(
                    onPressed: (){},
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
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text('Estudar Flutter'),
                    subtitle: Text('25/03/2025'),
                    leading: Icon(Icons.save, size: 20,color: Color(0xff1C73ED)),
                    onTap: (){
                      print('Você clicou na tarefa');
                    },
                  ),
                  ListTile(
                    title: Text('Estudar Flutter'),
                    subtitle: Text('25/03/2025'),
                    leading: Icon(Icons.personal_injury_rounded, size: 20, color: Color(0xff1C73ED),),
                    onTap: (){
                      print('Você clicou na tarefa');
                    },
                  ),
                  // Adicione mais widgets aqui para criar uma lista
                ],
              ),
              SizedBox(height: 18,),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui tarefas pendentes'),
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
    );
  }
}
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              ElevatedButton(
                  onPressed: login,
                  child: Text('Entrar')),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    print(text);
  }
}


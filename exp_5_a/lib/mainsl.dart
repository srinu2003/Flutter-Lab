import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyStatelessWidget()));

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless Widget')),
      body: const Center(
        child: Text('Hello, I am a stateless widget!'),
      ),
    );
  }
}

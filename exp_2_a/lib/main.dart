import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Flutter!',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/flutter_logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 16),
              Container(
                width: 200,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

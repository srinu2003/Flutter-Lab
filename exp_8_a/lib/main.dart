import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isBig = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Beginner Animation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap the box to animate',
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBig = !_isBig;
                  });
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _isBig ? Colors.deepPurpleAccent : Colors.blueAccent,
                  ),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: _isBig ? 300 : 100,
                  height: _isBig ? 600 : 100,
                  alignment: Alignment.center,
                  child: const Text(
                    'Box',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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

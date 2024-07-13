import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive UI',
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive UI'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 600) {
            // For Wide Screen (Tablet/Desktop)
            return _buildWideContainers();
          } else {
            // For Narrow Screen (Phone)
            return _buildNarrowContainers();
          }
        },
      ),
    );
  }

  Widget _buildWideContainers() {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'You are using a Wide screen!',
          style: TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildNarrowContainers() {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'You are using a Narrow screen!',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

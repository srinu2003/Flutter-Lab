import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return buildSmallScreen();
          } else if (constraints.maxWidth < 1200) {
            return buildMediumScreen();
          } else {
            return buildLargeScreen();
          }
        },
      ),
    );
  }

  Widget buildSmallScreen() {
    return const Center(child: Text('Small Screen'));
  }

  Widget buildMediumScreen() {
    return const Center(child: Text('Medium Screen'));
  }

  Widget buildLargeScreen() {
    return const Center(child: Text('Large Screen'));
  }
}

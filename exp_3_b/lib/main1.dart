import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: _getTextSize(constraints),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double _getTextSize(BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    if (screenWidth >= 600) {
      return 32.0; // Large screen size
    } else if (screenWidth >= 400) {
      return 18.0; // Medium screen size
    } else {
      return 14.0; // Small screen size
    }
  }
}

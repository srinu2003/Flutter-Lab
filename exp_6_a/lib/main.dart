import 'package:flutter/foundation.dart'; // Required for kDebugMode
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Button Widget')),
        body: Center(
          child: CustomButton(
            text: 'Click Me',
            icon: Icons.circle_outlined,
            color: Colors.lightBlue[600],
            onPressed: () {
              if (kDebugMode) {
                // Check if the app is running in debug mode
                print('Button Pressed!');
              }
            },
          ), // CustomButton
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color, textColor;

  const CustomButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      this.color = Colors.blueAccent,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), // RoundedRectangleBorder
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    ); // ElevatedButton.icon
  }
}

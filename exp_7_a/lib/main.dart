import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Application')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset('images/3d_avatar_21.jpg', width: 100, height: 100),
                const CustomTextField(label: 'First Name'),
                const CustomTextField(label: 'Last Name'),
                const CustomTextField(
                    label: 'Email', suffixText: '@mlritm.ac.in'),
                const CustomTextField(
                  prefixText: '+91 ',
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  maxLength: 10
                ),
                const Divider(indent: 8, endIndent: 8), // Divider
                const CustomTextField(label: 'Username'),
                const CustomTextField(label: 'Password', obscureText: true),
                const CustomTextField(
                    label: 'Confirm Password', obscureText: true),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText, suffixText;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.maxLength,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength)]
            : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixText: suffixText,
          prefixText: prefixText,
        ),
      ),
    );
  }
}

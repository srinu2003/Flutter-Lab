import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Validation')),
        body: const SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(),
      _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                if (!RegExp(r'^[a-zA-Z][a-zA-Z\s]*$').hasMatch(value)) {
                  return 'Name can only contain letters and spaces in between';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                        r'^[a-zA-Z0-9](?!.*\+\+)[a-zA-Z0-9._%+-]*[a-zA-Z0-9]@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data is valid')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
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
        body: const SafeArea(
          child: SingleChildScrollView(
            child: FormWidget(),
          ),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    if (kDebugMode) {
      print('''

      First Name: ${firstNameController.text}, 
      Last Name: ${lastNameController.text}, 
      Email: ${emailController.text}, 
      Phone Number: ${phoneController.text}, 
      Username: ${usernameController.text}, 
      Password: ${passwordController.text}, 
      Confirm Password: ${confirmPasswordController.text}''');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('images/3d_avatar_21.png', width: 100, height: 100),
        CustomTextField(controller: firstNameController, label: 'First Name'),
        CustomTextField(controller: lastNameController, label: 'Last Name'),
        CustomTextField(
            controller: emailController,
            label: 'Email',
            suffixText: '@mlritm.ac.in'),
        CustomTextField(
          controller: phoneController,
          prefixText: '+91 ',
          label: 'Phone Number',
          keyboardType: TextInputType.phone,
          maxLength: 10,
        ),
        const Divider(indent: 8, endIndent: 8), // Divider
        CustomTextField(controller: usernameController, label: 'Username'),
        CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true),
        CustomTextField(
            controller: confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true),
        ElevatedButton(
          onPressed: handleSubmit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText, suffixText;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.controller,
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
        controller: controller,
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

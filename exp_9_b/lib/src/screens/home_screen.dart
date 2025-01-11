
import 'package:flutter/material.dart';
// import 'package:your_project/src/services/api_service.dart';
// import 'package:your_project/src/models/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // use ApiService to fetch DataModel
  @override
  Widget build(BuildContext context) {
    // UI that shows fetched data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Data'),
      ),
      body: const Center(
        child: Text('Data goes here'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _controller = TextEditingController();
  Future<List<dynamic>>? _futureRepos;

  Future<List<dynamic>> fetchRepos(String username) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/repos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load repos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GitHub Repos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter GitHub username',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureRepos = fetchRepos(_controller.text);
                  });
                },
                child: const Text('Fetch Repos'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: _futureRepos,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final repos = snapshot.data!;
                      return ListView.builder(
                        itemCount: repos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(repos[index]['name']),
                          );
                        },
                      );
                    } else {
                      return const Text('No data');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

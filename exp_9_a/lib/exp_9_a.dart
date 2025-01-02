import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchRepos(String username) async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load repos');
  }
}
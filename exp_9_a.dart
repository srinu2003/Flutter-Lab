import 'package:args/args.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

const String version = '0.0.1';

// ArgParser buildParser() {
//   return ArgParser()
//     ..addFlag(
//       'help',
//       abbr: 'h',
//       negatable: false,
//       help: 'Print this usage information.',
//     )
//     ..addFlag(
//       'verbose',
//       abbr: 'v',
//       negatable: false,
//       help: 'Show additional command output.',
//     )
//     ..addFlag(
//       'version',
//       negatable: false,
//       help: 'Print the tool version.',
//     );
// }

// void printUsage(ArgParser argParser) {
//   print('Usage: dart exp_9_a.dart <flags> [arguments]');
//   print(argParser.usage);
// }

Future<List<dynamic>> fetchRepos(String username) async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load repos');
  }
}

void main(List<String> arguments) async {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;

    // Process the parsed arguments.
    if (results.wasParsed('help')) {
      printUsage(argParser);
      return;
    }
    if (results.wasParsed('version')) {
      print('exp_9_a version: $version');
      return;
    }
    if (results.wasParsed('verbose')) {
      verbose = true;
    }

    // Act on the arguments provided.
    print('Positional arguments: ${results.rest}');
    if (verbose) {
      print('[VERBOSE] All arguments: ${results.arguments}');
    }

    // Start your program here.

    String? username;

    // Fetch and display GitHub repositories.
    if (results.rest.isEmpty) {
      stdout.write('Enter GitHub username: ');
      username = stdin.readLineSync();
    } else {
      username = results.rest[0];
    }

    if (username != null && username.isNotEmpty) {
      try {
        print('Fetching repositories for user: $username');
        List<dynamic> repos = await fetchRepos(username);
        // repos.sort((a, b) => DateTime.parse(b['updated_at']).compareTo(DateTime.parse(a['updated_at'])));
        print('First 5 recent repositories:');
        for (var repo in repos.take(5)) {
          print(repo['name']);
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print('Username cannot be empty');
    }
    // End your program here.
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}

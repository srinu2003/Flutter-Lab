// Utilizing GitHub API service from exp_9_a
import 'package:exp_9_a/git_hub_api.dart' as git_hub_api;
import 'dart:io';

void main(List<String> arguments) async {
  String? username = arguments.isNotEmpty ? arguments.first : null;

  if (username == null) {
    stdout.write('Enter GitHub username: ');
    username = stdin.readLineSync();
  }

  if (username != null && username.isNotEmpty) {
    try {
      print('Fetching repositories for user: $username');
      List<dynamic> repos = await git_hub_api.fetchRepos(username);
      // Sort by 'updated_at' in descending order
      repos.sort(
        (a, b) => DateTime.parse(b['updated_at']).compareTo(
          DateTime.parse(a['updated_at']),
        ),
      );
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
}

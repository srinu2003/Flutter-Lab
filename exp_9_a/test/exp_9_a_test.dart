import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Main function prints error when no username is provided', () async {
    final process = await Process.start('dart', ['run', 'bin/exp_9_a.dart']);
    process.stdin.writeln(''); // simulate pressing enter
    await process.stdin.close();
    final output = await process.stdout.transform(const Utf8Decoder()).join();
    expect(output, contains('Username cannot be empty'));
  });

  test('Main function handles valid username', () async {
    final process =
        await Process.start('dart', ['run', 'bin/exp_9_a.dart', 'octocat']);
    final output = await process.stdout.transform(const Utf8Decoder()).join();
    expect(output, contains('Fetching repositories for user: octocat'));
    expect(output, contains('First 5 recent repositories:'));
  });
}

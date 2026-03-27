import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI Version: $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // if the user didn't pass in an article title, prompt them to enter one
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title');

    // await input and provide a default value if the user doesn't enter anything
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join('');
  }
  print('Looking up articles about article $articleTitle');
  print('Yey here you go!!');
  print('Current article title $articleTitle');
}

void printUsage() {
  print(
    'The following commands are valid: "help", "version", "search <artticle title>"',
  );
}

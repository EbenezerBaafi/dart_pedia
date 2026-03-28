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

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  // if the user didn't pass in an article title, prompt them to enter one
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title');
    final inputFromStdin = stdin.readLineSync();

    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }

    // await input and provide a default value if the user doesn't enter anything
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join('');
  }
  print('Looking up articles about article $articleTitle');

  var articleContent = await getWikipediaArticle(articleTitle);
  print('Article content $articleContent');
}

void printUsage() {
  print(
    'The following commands are valid: "help", "version", "search <artticle title>"',
  );
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    'api/rest_v1/page/summary/$articleTitle',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  }
  return 'Error: failed to fetch article $articleTitle with status code ${response.statusCode}';
}

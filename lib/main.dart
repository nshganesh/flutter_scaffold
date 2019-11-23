import 'package:args/args.dart';

ArgResults argResults;

void main(List<String> arguments) {
  final ArgParser argParser = new ArgParser()
    ..addOption('name', abbr: 'n', defaultsTo: 'World');

  argResults = argParser.parse(arguments);

  final String name = argResults['name'];

  print("Hello, $name!");
}

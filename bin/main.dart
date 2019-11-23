import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'component.dart';
import 'container.dart';

ArgResults argResults;

void main(List<String> arguments) {
  CommandRunner("generate", "Generate container page `pub global run flutter_scaffold:main container -p HomePage -sbi`")
    ..addCommand(ContainerCommand())
    ..addCommand(ComponentCommand())
    ..run(arguments);

  // return;

  // ArgParser parser = ArgParser();
  // ArgParser containerCommand = ArgParser()
  //   ..addOption('name', abbr: 'n')
  //   ..addFlag('stful', abbr: 's')
  //   ..addFlag('bloc', abbr: 'b')
  //   ..addFlag('i18n', abbr: 'i');

  // parser.addCommand('container', containerCommand);

  // ArgParser componentCommand = ArgParser()
  //   ..addOption('name', abbr: 'n')
  //   ..addFlag('stful', abbr: 's')
  //   ..addFlag('i18n', abbr: 'i');

  // parser.addCommand('component', componentCommand);

  // argResults = parser.parse(arguments);

  // final String name = argResults.command.name;
  // final bool stful = argResults.command['stful'];
  // final bool bloc = argResults.command['bloc'];
  // final bool i18n = argResults.command['i18n'];

  // print(stful);
  // print(bloc);
  // print(i18n);

  // if (stful) {
  //   print("Hello, $name!");
  // } else {
  //   print("hello world");
  // }
}

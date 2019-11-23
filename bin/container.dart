import 'package:args/command_runner.dart';

class ContainerCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  final name = "container";
  final description = "Creates container page";

  final aliases = ["c"];

  ContainerCommand() {
    // [argParser] is automatically created by the parent class.
    argParser
      ..addOption('page', abbr: 'p')
      ..addFlag('stful', abbr: 's')
      ..addFlag('bloc', abbr: 'b')
      ..addFlag('i18n', abbr: 'i');
  }

  // [run] may also return a Future.
  void run() {
    // [argResults] is set before [run()] is called and contains the options
    // passed to this command.
    final String page = argResults['page'];
    final bool stful = argResults['stful'];
    final bool bloc = argResults['bloc'];
    final bool i18n = argResults['i18n'];

    print(stful);
    print(bloc);
    print(i18n);

    if (stful) {
      print("Hello, $page!");
    } else {
      print("hello world");
    }
  }
}

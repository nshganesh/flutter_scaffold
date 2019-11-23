import 'dart:io';
import 'package:meta/meta.dart';
import 'package:mustache/mustache.dart';
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

    generateIndex(page: page, stful: stful, bloc: bloc, i18n: i18n);
    print(stful);
    print(bloc);
    print(i18n);

    if (stful) {
      print("Hello, $page!");
    } else {
      print("hello world");
    }
  }

  void generateIndex(
      {@required String page,
      bool stful = true,
      bool bloc = true,
      bool i18n = true}) async {
    File file = File('flutter-templates/container.txt');

    if (await file.exists()) {
      String source = await file.readAsString();

      Template template = Template(source, name: 'flutter-templates/container.txt');

      String output = template.renderString({
        'page': page,
      });

      File fileCopy = await File('test.dart').writeAsString(output);
      await fileCopy.exists();
      await fileCopy.length();
    } else {
      print("No file exists");
    }
  }
}

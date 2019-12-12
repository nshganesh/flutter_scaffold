import 'dart:io';
import 'package:recase/recase.dart';
import 'package:mustache/mustache.dart';
import 'package:args/command_runner.dart';

class ComponentCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  final name = "component";
  final description = "Creates component page";

  final aliases = ["comp"];

  String page, path;
  bool stful = true, i18n = true;

  ComponentCommand() {
    // [argParser] is automatically created by the parent class.
    argParser
      ..addOption('page', abbr: 'p')
      ..addFlag('stful', abbr: 's')
      ..addFlag('i18n', abbr: 'i');
  }

  // [run] may also return a Future.
  void run() {
    // [argResults] is set before [run()] is called and contains the options
    // passed to this command.
    this.page = argResults['page'];
    this.stful = argResults['stful'];
    this.i18n = argResults['i18n'];

    createDir();
  }

  void createDir() {
    ReCase reCase = new ReCase(page);
    Directory("${reCase.pascalCase}Page")
      ..create().then((Directory directory) {
        this.path = directory.path;
        createFiles();
      });
  }

  void createFiles() {
    generateIndex();
  }

  void generateIndex() async {
    File file = File('flutter-templates/component.txt');

    if (await file.exists()) {
      String source = await file.readAsString();

      Template template =
          Template(source, name: 'flutter-templates/component.txt');

      String output = template.renderString({
        'page': page,
        'stful': stful,
      });

      File fileCopy = await File("${path}/index.dart").create(recursive: true)
        ..writeAsString(output);

      bool isExist = await fileCopy.exists();

      if (isExist) {
        print("✔ ${page} created successfully!");
      } else {
        print("✘ ${page} could not be created!");
      }
    } else {
      print("✘ ${page} could not be created!");
    }
  }
}

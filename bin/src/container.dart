import 'dart:io';
import 'package:mustache/mustache.dart';
import 'package:recase/recase.dart';
import 'package:args/command_runner.dart';
import "package:path/path.dart" show dirname, join;
import 'dart:io' show Platform;

class ContainerCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  final name = "container";
  final description = "Creates container page";
  final aliases = ["c"];

  String page, path;
  bool stful = true, bloc = true, i18n = true;

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
    this.page = argResults['page'];
    this.stful = argResults['stful'];
    this.bloc = argResults['bloc'];
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
    var path = join(dirname(Platform.script.path), 'flutter-templates/container.txt');
    File file = File(path);

    print("Hello" + path);
    if (await file.exists()) {
      String source = await file.readAsString();

      Template template =
          Template(source, name: 'flutter-templates/container.txt');

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
      print("No file exists");
    }
  }
}

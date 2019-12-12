import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'src/component.dart';
import 'src/container.dart';

ArgResults argResults;

void main(List<String> arguments) async {

  print("here");
  CommandRunner("generate", "Generate container page `pub global run flutter_scaffold:main container -p HomePage -sbi`")
    ..addCommand(ContainerCommand())
    ..addCommand(ComponentCommand())
    ..run(arguments);
}

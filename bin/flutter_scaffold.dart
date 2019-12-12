import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'component.dart';
import 'container.dart';

ArgResults argResults;

void main(List<String> arguments) async {
  CommandRunner("generate", "Generate container page `pub global run flutter_scaffold:main container -p HomePage -sbi`")
    ..addCommand(ContainerCommand())
    ..addCommand(ComponentCommand())
    ..run(arguments);
}

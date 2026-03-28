import 'package:command_runner/command_runner.dart';

const version = '0.0.1';
void main(List<String> arguments) {
  // main is now async and awaits the runner
  var commandRunner = CommandRunner()
    ..addCommand(HelpCommand()); // Create an instance of your new CommandRunner
  commandRunner.run(
    arguments,
  ); // Call its run method, awaiting its Future<void>
}

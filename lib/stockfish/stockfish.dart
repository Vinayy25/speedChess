import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class Stockfish {
  late Process _process;
  late StreamSubscription<String> _outputSubscription;

  Future<void> start() async {
    // Load the Stockfish CLI executable
    String stockfishPath = await _loadStockfishExecutable();

    // Start the Stockfish process
    _process = await Process.start(stockfishPath, []);

    // Subscribe to stdout stream
    _outputSubscription = _process.stdout
        .transform(utf8.decoder)
        .listen((String line) => handleOutput(line));
  }

Future<String> _loadStockfishExecutable() async {
  // Specify the file name of the Stockfish CLI executable
  String stockfishFileName = 'stockfishex.exe';

  // Get the current platform
  String platform = Platform.isWindows ? 'windows' : '';

  // Construct the file path based on the platform
  String stockfishPath = 'stockfish$platform/$stockfishFileName';

  // Get the absolute path of the current script
  String scriptPath = Directory.current.path;

  // Construct the absolute file path
  String absolutePath = '$scriptPath/$stockfishPath';

  return absolutePath;
}


  void handleOutput(String line) {
    // Handle Stockfish output
    print(line);
  }

  void sendCommand(String command) {
    // Send command to Stockfish
    _process.stdin.writeln(command);
  }

  Future<void> stop() async {
    // Stop the Stockfish process and clean up resources
    await _outputSubscription.cancel();
    _process.stdin.writeln('quit');
    await _process.exitCode;
  }
}

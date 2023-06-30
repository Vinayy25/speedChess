import 'dart:io';

import 'package:flutter/material.dart';
import 'package:speed_chess/pages/home_page.dart';
import 'package:stockfish/stockfish.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stockfish = Stockfish();

  

  // Stockfish stockfish = Stockfish();
  // try {
  //   await stockfish.start();

  //   stockfish.sendCommand('uci');
  //   stockfish.sendCommand('position startpos');
  //   stockfish.sendCommand('go depth 10');

  //   await Future.delayed(Duration(seconds: 1)); // Wait for Stockfish output

  //   await stockfish.stop();
  // } catch (e) {
  //   print('Error: $e');
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

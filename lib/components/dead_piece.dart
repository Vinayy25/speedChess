import 'package:flutter/material.dart';
import 'package:speed_chess/components/square.dart';

class DeadPiece extends StatelessWidget {
  final String imagePath;
  final bool isWhite;
  const DeadPiece({super.key,required this.imagePath,required this.isWhite});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}

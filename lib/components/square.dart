import 'package:flutter/material.dart';
import 'package:speed_chess/components/piece.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;
  final bool isValidMove;

  const Square(
      {super.key,
      required this.onTap,
      required this.isValidMove,
      required this.isWhite,
      required this.piece,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    if (isSelected) {
      squareColor = Colors.amberAccent;
    } else if (isValidMove) {
      squareColor = const Color.fromARGB(255, 255, 229, 151);
    } else
      squareColor =
          isWhite ? const Color.fromARGB(255, 252, 248, 220) : Colors.green;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(isValidMove ? 4 : 0),
        color: squareColor,
        child: piece != null ? Image.asset(piece!.imagePath) : null,
      ),
    );
  }
}

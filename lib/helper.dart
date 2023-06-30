bool iswhite(int index) {
  return (index ~/ 8 + index % 8) % 2 == 0 ? true : false;
}

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

class Board {
  final int _rows;
  final int _columns;

  Board(this._rows, this._columns);

  @override
  String toString() {
    final StringBuffer stringBuffer = StringBuffer();
    for (int row = 0; row < _rows; row++) {
      for (int column = 0; column < _columns; column++) {
        stringBuffer.write('.');
      }
      stringBuffer.writeln();
    }
    return stringBuffer.toString();
  }
}
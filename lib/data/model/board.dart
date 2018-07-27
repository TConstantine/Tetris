class Board {
  static const String EMPTY = '.';
  final int _rows;
  final int _columns;
  List<List<String>> _board;

  Board(this._rows, this._columns) {
    _board = List.generate(_rows, (_) => List.filled(_columns, EMPTY));
  }

  @override
  String toString() {
    final StringBuffer stringBuffer = StringBuffer();
    _board.forEach((row) {
      row.forEach((cell) => stringBuffer.write(cell));
      stringBuffer.writeln();
    });
    return stringBuffer.toString();
  }
}
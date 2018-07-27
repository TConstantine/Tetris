import 'package:tetris/data/model/tetromino.dart';

class Board {
  static const String _EMPTY = '.';
  final int _rows;
  final int _columns;
  List<List<String>> _board;

  Board(this._rows, this._columns) {
    _board = List.generate(_rows, (_) => List.filled(_columns, _EMPTY));
  }

  void add(Tetromino tetromino) {
    final int tetrominoRows = tetromino.rows();
    final int tetrominoColumns = tetromino.columns();
    final int middleColumn = _columns ~/ 2 - tetrominoColumns ~/ 2 - tetrominoColumns % 2;
    for (int row = 0; row < tetrominoRows; row++) {
      for (int column = 0; column < tetrominoColumns; column++) {
        final String tetrominoBlock = tetromino.blockAt(row, column);
        if (tetrominoBlock != _EMPTY) {
          _board[row][middleColumn + column] = tetrominoBlock;
        }
      }
    }
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
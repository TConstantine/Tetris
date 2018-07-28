import 'package:tetris/data/model/tetromino.dart';

class Board {
  static const String _EMPTY = '.';
  final int _rows;
  final int _columns;
  List<List<String>> _board;
  Tetromino _currentTetromino;
  int _currentTetrominoRows;
  int _currentTetrominoColumns;
  int _currentTetrominoRow;
  int _currentTetrominoColumn;

  Board(this._rows, this._columns) {
    _board = List.generate(_rows, (_) => List.filled(_columns, _EMPTY));
  }

  void add(Tetromino tetromino) {
    _currentTetromino = tetromino;
    _currentTetrominoRows = tetromino.rows();
    _currentTetrominoColumns = tetromino.columns();
    _currentTetrominoRow = 0;
    _currentTetrominoColumn =
        _columns ~/ 2 - _currentTetrominoColumns ~/ 2 - _currentTetrominoColumns % 2;
    _displayCurrentTetromino(true);
  }

  void moveDown() {
    if (!_isTetrominoAtBottom()) {
      _displayCurrentTetromino(false);
      _currentTetrominoRow++;
      _displayCurrentTetromino(true);
    }
  }

  bool _isTetrominoAtBottom() {
    return _currentTetrominoRow + _currentTetrominoRows == _rows;
  }

  void _displayCurrentTetromino(bool isVisible) {
    for (int row = 0; row < _currentTetrominoRows; row++) {
      for (int column = 0; column < _currentTetrominoColumns; column++) {
        final String currentBlock = _currentTetromino.blockAt(row, column);
        if (currentBlock != _EMPTY) {
          _board[_currentTetrominoRow + row][_currentTetrominoColumn + column] =
              isVisible ? currentBlock : _EMPTY;
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

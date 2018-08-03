import 'package:tetris/data/model/block.dart';
import 'package:tetris/data/model/tetromino.dart';

class Board {
  final int _rows;
  final int _columns;
  List<List<Block>> _board;
  Tetromino _currentTetromino;
  int _currentTetrominoRows;
  int _currentTetrominoColumns;
  int _currentTetrominoRow;
  int _currentTetrominoColumn;

  Board(this._rows, this._columns) {
    _board = List.generate(_rows, (_) => List.filled(_columns, Block(Block.EMPTY)));
  }

  int rows() {
    return _rows;
  }

  int columns() {
    return _columns;
  }

  bool isEmptyAt(int row, int column) {
    return _board[row][column].isEmpty();
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
    if (!_isTetrominoAtBottom() && !_hasCollidedWithAnotherTetromino()) {
      _displayCurrentTetromino(false);
      _currentTetrominoRow++;
      _displayCurrentTetromino(true);
    }
  }

  bool _isTetrominoAtBottom() {
    return _currentTetrominoRow + _currentTetrominoRows == _rows;
  }

  bool _hasCollidedWithAnotherTetromino() {
    for (int column = 0; column < _currentTetrominoColumns; column++) {
      final bool isTetrominoBlockEmpty =
          _currentTetromino.isEmptyAt(_currentTetrominoRows - 1, column);
      final int currentBoardColumn = _currentTetrominoColumn + column;
      if ((!isTetrominoBlockEmpty &&
              !isEmptyAt(_currentTetrominoRow + _currentTetrominoRows, currentBoardColumn)) ||
          (isTetrominoBlockEmpty &&
              !isEmptyAt(_currentTetrominoRow + _currentTetrominoRows - 1, currentBoardColumn))) {
        return true;
      }
    }
    return false;
  }

  void _displayCurrentTetromino(bool isVisible) {
    for (int row = 0; row < _currentTetrominoRows; row++) {
      for (int column = 0; column < _currentTetrominoColumns; column++) {
        final String currentBlock = _currentTetromino.valueAt(row, column);
        if (currentBlock != Block.EMPTY) {
          _board[_currentTetrominoRow + row][_currentTetrominoColumn + column] =
              isVisible ? Block(currentBlock) : Block(Block.EMPTY);
        }
      }
    }
  }

  @override
  String toString() {
    final StringBuffer stringBuffer = StringBuffer();
    _board.forEach((row) {
      row.forEach((block) => stringBuffer.write(block.value()));
      stringBuffer.writeln();
    });
    return stringBuffer.toString();
  }
}

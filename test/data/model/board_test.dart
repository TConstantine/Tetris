import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';

import '../../util/data_builder.dart';

const int ROWS = 20;
const int COLUMNS = 10;
StringBuffer _stringBuffer;

void main() {
  Board _board;

  setUp(() {
    _stringBuffer = StringBuffer();
    _board = Board(ROWS, COLUMNS);
  });

  test('When a new board is created should be empty', () {
    expect(_board.toString(), DataBuilder.emptyBoard());
  });

  test('Given an empty board when a tetromino is added should start falling from top middle', () {
    _board.add(DataBuilder.tetromino());

    expect(_board.toString(), _printBoardWithTetrominoT());
  });

  test('When a tetromino is added to the board should fall one row per move', () {
    _board.add(DataBuilder.tetromino());

    _board.moveDown();

    expect(_board.toString(), _printBoardWithTetrominoTMovedDownOnce());
  });

  test('Given a tetromino is added to the board when it reaches the bottom should stop falling',
      () {
    _board.add(DataBuilder.tetromino());

    _moveTetrominoToBottomOf(_board);

    expect(_board.toString(), _printBoardWithTetrominoTAtTheBottom());
  });

  test(
      'Given a tetromino is at the bottom when another tetromino is added should stop falling above the previous tetromino',
      () {
    _board.add(DataBuilder.tetromino());
    _moveTetrominoToBottomOf(_board);
    _board.add(DataBuilder.tetromino());

    _moveTetrominoToBottomOf(_board);

    expect(_board.toString(), _printBoardWithTwoTetrominosAboveEachOtherAtBottom());
  });
}

String _printBoardWithTetrominoT() {
  _addTetrominoT();
  _fillBoardWithEmpty(ROWS - 2);
  return _stringBuffer.toString();
}

String _printBoardWithTetrominoTMovedDownOnce() {
  _fillBoardWithEmpty(1);
  _addTetrominoT();
  _fillBoardWithEmpty(ROWS - 3);
  return _stringBuffer.toString();
}

String _printBoardWithTetrominoTAtTheBottom() {
  _fillBoardWithEmpty(ROWS - 2);
  _addTetrominoT();
  return _stringBuffer.toString();
}

String _printBoardWithTwoTetrominosAboveEachOtherAtBottom() {
  _fillBoardWithEmpty(ROWS - 4);
  _addTetrominoT();
  _addTetrominoT();
  return _stringBuffer.toString();
}

void _fillBoardWithEmpty(int rows) {
  for (int row = 0; row < rows; row++) {
    for (int column = 0; column < COLUMNS; column++) {
      _stringBuffer.write(' ');
    }
    _stringBuffer.writeln();
  }
}

void _addTetrominoT() {
  _stringBuffer.writeln('   ???    ');
  _stringBuffer.writeln('    ?     ');
}

void _moveTetrominoToBottomOf(Board board) {
  for (int row = 0; row < ROWS; row++) {
    board.moveDown();
  }
}

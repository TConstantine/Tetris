import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/data/model/tetromino.dart';

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
    expect(_board.toString(), _printEmptyBoard());
  });

  test('Given an empty board when a tetromino is added should start falling from top middle', () {
    _board.add(Tetromino.T);

    expect(_board.toString(), _printBoardWithTetrominoT());
  });
}

String _printEmptyBoard() {
  _fillBoardWithEmpty(ROWS);
  return _stringBuffer.toString();
}

String _printBoardWithTetrominoT() {
  _stringBuffer.writeln('...TTT....');
  _stringBuffer.writeln('....T.....');
  _fillBoardWithEmpty(ROWS - 2);
  return _stringBuffer.toString();
}

void _fillBoardWithEmpty(int rows) {
  for (int row = 0; row < rows; row++) {
    for (int column = 0; column < COLUMNS; column++) {
      _stringBuffer.write('.');
    }
    _stringBuffer.writeln();
  }
}
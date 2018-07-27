import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';

const int ROWS = 20;
const int COLUMNS = 10;

void main() {
  Board _board;

  setUp(() {
    _board = Board(ROWS, COLUMNS);
  });

  test('Should be empty', () {
    expect(_board.toString(), _emptyBoard());
  });
}

String _emptyBoard() {
  final StringBuffer stringBuffer = StringBuffer();
  for (int row = 0; row < ROWS; row++) {
    for (int column = 0; column < COLUMNS; column++) {
      stringBuffer.write('.');
    }
    stringBuffer.writeln();
  }
  return stringBuffer.toString();
}
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/tetromino.dart';

void main() {
  Game _game;

  setUp(() {
    _game = Game();
  });

  test('Should start game', () {
    _game.start();

    expect(_game.isPaused(), isTrue);
    expect(_game.toString(), _emptyBoard());
    expect(_game.hasFallingTetromino(), isFalse);
    expect(_game.hasHoldingTetromino(), isFalse);
    expect(_game.hasNextTetromino(), isTrue);
    expect(_game.level(), 0);
    expect(_game.score(), 0);
    expect(_game.lines(), 0);
  });

  test('Should resume game', () {
    _game.start();
    final Tetromino nextTetromino = _game.nextTetromino();

    _game.resume();

    expect(_game.isPaused(), isFalse);
    expect(_game.hasFallingTetromino(), isTrue);
    expect(_game.fallingTetromino(), nextTetromino);
  });
}

String _emptyBoard() {
  final StringBuffer stringBuffer = StringBuffer();
  for (int row = 0; row < 20; row++) {
    for (int column = 0; column < 10; column++) {
      stringBuffer.write(' ');
    }
    stringBuffer.writeln();
  }
  return stringBuffer.toString();
}
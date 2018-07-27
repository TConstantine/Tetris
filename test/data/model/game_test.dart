import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';

void main() {
  Game _game;

  setUp(() {
    _game = Game();
  });

  test('Should start game in paused state', () {
    _game.start();

    expect(_game.isPaused(), isTrue);
  });

  test('Should start game with an empty board', () {
    _game.start();

    expect(_game.toString(), _emptyBoard());
  });

  test('Should start game with no falling tetromino', () {
    _game.start();

    expect(_game.hasFallingTetromino(), isFalse);
  });

  test('Should start game with no holding tetromino', () {
    _game.start();

    expect(_game.hasHoldingTetromino(), isFalse);
  });

  test('Should start game with next-to-fall tetromino', () {
    _game.start();

    expect(_game.hasNextTetromino(), isTrue);
  });

  test('Should start game at level 0', () {
    _game.start();

    expect(_game.level(), 0);
  });

  test('Should start game with 0 score', () {
    _game.start();

    expect(_game.score(), 0);
  });
}

String _emptyBoard() {
  final StringBuffer stringBuffer = StringBuffer();
  for (int row = 0; row < 20; row++) {
    for (int column = 0; column < 10; column++) {
      stringBuffer.write('.');
    }
    stringBuffer.writeln();
  }
  return stringBuffer.toString();
}
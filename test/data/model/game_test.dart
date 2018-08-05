import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/tetromino.dart';

import '../../util/data_builder.dart';

void main() {
  Game _game;

  setUp(() {
    _game = Game();
  });

  test('Should start game', () {
    _game.start();

    expect(_game.isPaused(), isTrue);
    expect(_game.toString(), DataBuilder.emptyBoard());
    expect(_game.hasFallingTetromino(), isFalse);
    expect(_game.hasHoldingTetromino(), isFalse);
    expect(_game.hasNextTetromino(), isTrue);
    expect(_game.level(), 0);
    expect(_game.score(), 0);
    expect(_game.completedLines(), 0);
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

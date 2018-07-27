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
}
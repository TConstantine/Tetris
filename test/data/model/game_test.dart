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
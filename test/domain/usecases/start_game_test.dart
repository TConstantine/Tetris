import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/usecases/start_game.dart';

class GameMock extends Mock implements Game {}

void main() {
  Game _game;
  StartGame _useCase;

  setUp(() {
    _game = GameMock();
    _useCase = StartGame(_game);
  });

  test('Start new game', () {
    _useCase.execute();

    verify(_game.start());
  });
}
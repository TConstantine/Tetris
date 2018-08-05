import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/usecases/get_level.dart';

class GameMock extends Mock implements Game {}

void main() {
  Game _game;
  GetLevel _useCase;

  setUp(() {
    _game = GameMock();
    _useCase = GetLevel(_game);
  });

  test('Get the level', () {
    _useCase.execute();

    verify(_game.level());
  });
}
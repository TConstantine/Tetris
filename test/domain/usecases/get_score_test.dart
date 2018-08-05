import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/usecases/get_score.dart';

class GameMock extends Mock implements Game {}

void main() {
  Game _game;
  GetScore _useCase;

  setUp(() {
    _game = GameMock();
    _useCase = GetScore(_game);
  });

  test('Get the score', () {
    _useCase.execute();

    verify(_game.score());
  });
}
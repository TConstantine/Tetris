import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/usecases/get_completed_lines.dart';

class GameMock extends Mock implements Game {}

void main() {
  Game _game;
  GetCompletedLines _useCase;

  setUp(() {
    _game = GameMock();
    _useCase = GetCompletedLines(_game);
  });

  test('Get the completed lines', () {
    _useCase.execute();

    verify(_game.completedLines());
  });
}
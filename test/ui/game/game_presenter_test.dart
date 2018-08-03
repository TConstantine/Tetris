import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

class GameViewMock extends Mock implements GameContractView {}
class StartGameMock extends Mock implements StartGame {}
class GetNextTetrominoMock extends Mock implements GetNextTetromino {}

void main() {
  GameContractView _view;
  StartGame _startGameUseCase;
  GetNextTetromino _getNextTetrominoUseCase;
  GameContractPresenter _presenter;

  setUp(() {
    _view = GameViewMock();
    _startGameUseCase = StartGameMock();
    _getNextTetrominoUseCase = GetNextTetrominoMock();
    _presenter = GamePresenter(_view, _startGameUseCase, _getNextTetrominoUseCase);
  });

  test('Display next tetromino', () {
    final TetrominoViewModel tetrominoViewModel = TetrominoViewModel([]);
    when(_getNextTetrominoUseCase.execute()).thenReturn(tetrominoViewModel);

    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _getNextTetrominoUseCase.execute(),
      _view.renderNextTetromino(tetrominoViewModel)
    ]);
  });
}

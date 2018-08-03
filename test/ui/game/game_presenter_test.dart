import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class GameViewMock extends Mock implements GameContractView {}

class StartGameMock extends Mock implements StartGame {}

class GetBoardMock extends Mock implements GetBoard {}

class GetNextTetrominoMock extends Mock implements GetNextTetromino {}

void main() {
  GameContractView _view;
  StartGame _startGameUseCase;
  GetBoard _getBoardUseCase;
  GetNextTetromino _getNextTetrominoUseCase;
  GameContractPresenter _presenter;

  setUp(() {
    _view = GameViewMock();
    _startGameUseCase = StartGameMock();
    _getBoardUseCase = GetBoardMock();
    _getNextTetrominoUseCase = GetNextTetrominoMock();
    _presenter = GamePresenter(
      _view,
      _startGameUseCase,
      _getBoardUseCase,
      _getNextTetrominoUseCase,
    );
  });

  test('Display board', () {
    final DrawableGrid drawableGrid = DrawableGrid([]);
    when(_getBoardUseCase.execute()).thenReturn(drawableGrid);

    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _view.renderBoard(drawableGrid),
    ]);
  });

  test('Display next tetromino', () {
    final DrawableGrid drawableGrid = DrawableGrid([]);
    when(_getNextTetrominoUseCase.execute()).thenReturn(drawableGrid);

    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _view.renderNextTetromino(drawableGrid),
    ]);
  });
}

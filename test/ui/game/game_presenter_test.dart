import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/board_view_model.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

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
    final BoardViewModel boardViewModel = BoardViewModel([]);
    when(_getBoardUseCase.execute()).thenReturn(boardViewModel);

    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _view.renderBoard(boardViewModel),
    ]);
  });

  test('Display next tetromino', () {
    final TetrominoViewModel tetrominoViewModel = TetrominoViewModel([]);
    when(_getNextTetrominoUseCase.execute()).thenReturn(tetrominoViewModel);

    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _view.renderNextTetromino(tetrominoViewModel),
    ]);
  });
}

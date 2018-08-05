import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_completed_lines.dart';
import 'package:tetris/domain/usecases/get_level.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/get_score.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';

class GameViewMock extends Mock implements GameContractView {}

class StartGameMock extends Mock implements StartGame {}

class GetBoardMock extends Mock implements GetBoard {}

class GetNextTetrominoMock extends Mock implements GetNextTetromino {}

class GetLevelMock extends Mock implements GetLevel {}

class GetScoreMock extends Mock implements GetScore {}

class GetCompletedLinesMock extends Mock implements GetCompletedLines {}

void main() {
  GameContractView _view;
  StartGame _startGameUseCase;
  GetBoard _getBoardUseCase;
  GetNextTetromino _getNextTetrominoUseCase;
  GetLevel _getLevelUseCase;
  GetScore _getScoreUseCase;
  GetCompletedLines _getCompletedLinesUseCase;
  GameContractPresenter _presenter;

  setUp(() {
    _view = GameViewMock();
    _startGameUseCase = StartGameMock();
    _getBoardUseCase = GetBoardMock();
    _getNextTetrominoUseCase = GetNextTetrominoMock();
    _getLevelUseCase = GetLevelMock();
    _getScoreUseCase = GetScoreMock();
    _getCompletedLinesUseCase = GetCompletedLinesMock();
    _presenter = GamePresenter(
      _view,
      _startGameUseCase,
      _getBoardUseCase,
      _getNextTetrominoUseCase,
      _getLevelUseCase,
      _getScoreUseCase,
      _getCompletedLinesUseCase,
    );
  });

  test('Start new game', () {
    _presenter.startNewGame();

    verifyInOrder([
      _startGameUseCase.execute(),
      _getBoardUseCase.execute(),
      _getNextTetrominoUseCase.execute(),
      _getLevelUseCase.execute(),
      _getScoreUseCase.execute(),
      _getCompletedLinesUseCase.execute(),
    ]);
  });
}

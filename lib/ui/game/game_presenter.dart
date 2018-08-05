import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_completed_lines.dart';
import 'package:tetris/domain/usecases/get_level.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/get_score.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';

class GamePresenter implements GameContractPresenter {
  final GameContractView _view;
  final StartGame _startGameUseCase;
  final GetBoard _getBoardUseCase;
  final GetNextTetromino _getNextTetrominoUseCase;
  final GetLevel _getLevelUseCase;
  final GetScore _getScoreUSeCase;
  final GetCompletedLines _getCompletedLinesUseCase;

  GamePresenter(
    this._view,
    this._startGameUseCase,
    this._getBoardUseCase,
    this._getNextTetrominoUseCase,
    this._getLevelUseCase,
    this._getScoreUSeCase,
    this._getCompletedLinesUseCase,
  );

  @override
  void startNewGame() {
    _startGameUseCase.execute();
    _view.displayBoard(_getBoardUseCase.execute());
    _view.displayNextTetromino(_getNextTetrominoUseCase.execute());
    _view.displayLevel(_getLevelUseCase.execute());
    _view.displayScore(_getScoreUSeCase.execute());
    _view.displayCompletedLines(_getCompletedLinesUseCase.execute());
  }
}

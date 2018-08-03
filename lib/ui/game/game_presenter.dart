import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';

class GamePresenter implements GameContractPresenter {
  final GameContractView _view;
  final StartGame _startGameUseCase;
  final GetBoard _getBoardUseCase;
  final GetNextTetromino _getNextTetrominoUseCase;

  GamePresenter(
    this._view,
    this._startGameUseCase,
    this._getBoardUseCase,
    this._getNextTetrominoUseCase,
  );

  @override
  void startNewGame() {
    _startGameUseCase.execute();
    _view.renderBoard(_getBoardUseCase.execute());
    _view.renderNextTetromino(_getNextTetrominoUseCase.execute());
  }
}

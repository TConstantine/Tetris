import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';

class GamePresenter implements GameContractPresenter {
  final GameContractView _view;
  final StartGame _startGameUseCase;
  final GetNextTetromino _getNextTetrominoUseCase;

  GamePresenter(this._view, this._startGameUseCase, this._getNextTetrominoUseCase);

  @override
  void startNewGame() {
    _startGameUseCase.execute();
    _view.renderNextTetromino(_getNextTetrominoUseCase.execute());
  }
}

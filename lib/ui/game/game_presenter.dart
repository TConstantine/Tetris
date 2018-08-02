import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/game_renderer.dart';
import 'package:tetris/ui/game/game_contract.dart';

class GamePresenter implements GameContractPresenter {
  final GameContractView _view;
  final Game _game;
  final GameRenderer _renderer;

  GamePresenter(this._view, this._game, this._renderer);

  @override
  void startNewGame() {
    _game.start();
    _renderer.setDrawable(_game.nextTetromino());
    _view.renderNextTetromino(_renderer);
  }
}

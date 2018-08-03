import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/game_renderer.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';

class Injector {
  static final Injector _instance = new Injector._internal();

  Injector._internal();

  factory Injector() {
    return _instance;
  }

  GameContractPresenter gamePresenter(GameContractView view) {
    return GamePresenter(view, _provideTetrominoConverter(), _provideGame(), _provideRenderer());
  }

  TetrominoConverter _provideTetrominoConverter() {
    return TetrominoConverter();
  }

  Game _provideGame() {
    return Game();
  }

  GameRenderer _provideRenderer() {
    return GameRenderer();
  }
}

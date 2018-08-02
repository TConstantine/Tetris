import 'package:tetris/data/model/game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';

class Injector {
  static final Injector _instance = new Injector._internal();

  Injector._internal();

  factory Injector() {
    return _instance;
  }

  GameContractPresenter get gamePresenter {
    return GamePresenter(_provideGame());
  }

  Game _provideGame() {
    return Game();
  }
}

import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/string_matcher.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/ui/game/game_renderer.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';

class Injector {
  static final Injector _instance = new Injector._internal();

  Injector._internal();

  factory Injector() {
    return _instance;
  }

  GameContractPresenter gamePresenter(GameContractView view) {
    return GamePresenter(
      view,
      _provideStartGameUseCase(),
      _provideGetBoardUseCase(),
      _provideNextTetrominoUseCase(),
    );
  }

  GridRenderer gameRenderer() {
    return GridRenderer();
  }

  StringMatcher stringMatcher() {
    return StringMatcher();
  }

  StartGame _provideStartGameUseCase() {
    return StartGame(_provideGame());
  }

  GetBoard _provideGetBoardUseCase() {
    return GetBoard(_provideGame(), _provideBoardConverter());
  }

  GetNextTetromino _provideNextTetrominoUseCase() {
    return GetNextTetromino(_provideGame(), _provideTetrominoConverter());
  }

  BoardConverter _provideBoardConverter() {
    return BoardConverter();
  }

  TetrominoConverter _provideTetrominoConverter() {
    return TetrominoConverter();
  }

  Game _provideGame() {
    return Game();
  }
}

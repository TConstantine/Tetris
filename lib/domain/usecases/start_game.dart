import 'package:tetris/data/model/game.dart';

class StartGame {
  final Game _game;

  StartGame(this._game);

  void execute() {
    _game.start();
  }
}
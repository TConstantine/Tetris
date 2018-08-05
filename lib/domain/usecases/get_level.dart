import 'package:tetris/data/model/game.dart';

class GetLevel {
  final Game _game;

  GetLevel(this._game);

  int execute() {
    return _game.level();
  }
}
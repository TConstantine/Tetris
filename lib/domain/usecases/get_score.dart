import 'package:tetris/data/model/game.dart';

class GetScore {
  final Game _game;

  GetScore(this._game);

  int execute() {
    return _game.score();
  }
}
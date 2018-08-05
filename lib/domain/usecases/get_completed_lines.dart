import 'package:tetris/data/model/game.dart';

class GetCompletedLines {
  final Game _game;

  GetCompletedLines(this._game);

  int execute() {
    return _game.completedLines();
  }
}
import 'package:tetris/data/model/board.dart';

class Game {
  bool _isPaused;
  Board _board;
  bool _hasFalling;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
    _hasFalling = false;
  }

  bool isPaused() {
    return _isPaused;
  }

  bool hasFallingTetromino() {
    return _hasFalling;
  }

  @override
  String toString() {
    return _board.toString();
  }
}
import 'package:tetris/data/model/board.dart';

class Game {
  bool _isPaused;
  Board _board;
  bool _hasFalling;
  bool _hasHolding;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
    _hasFalling = false;
    _hasHolding = false;
  }

  bool isPaused() {
    return _isPaused;
  }

  bool hasFallingTetromino() {
    return _hasFalling;
  }

  bool hasHoldingTetromino() {
    return _hasHolding;
  }

  @override
  String toString() {
    return _board.toString();
  }
}
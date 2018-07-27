import 'package:tetris/data/model/board.dart';

class Game {
  bool _isPaused;
  Board _board;
  bool _hasFalling;
  bool _hasHolding;
  bool _hasNext;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
    _hasFalling = false;
    _hasHolding = false;
    _hasNext = true;
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

  bool hasNextTetromino() {
    return _hasNext;
  }

  @override
  String toString() {
    return _board.toString();
  }
}
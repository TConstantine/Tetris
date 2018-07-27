import 'package:tetris/data/model/board.dart';

class Game {
  bool _isPaused;
  Board _board;
  bool _hasFalling;
  bool _hasHolding;
  bool _hasNext;
  int _level;
  int _score = 0;
  int _lines = 0;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
    _hasFalling = false;
    _hasHolding = false;
    _hasNext = true;
    _level = 0;
    _score = 0;
    _lines = 0;
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

  int level() {
    return _level;
  }

  int score() {
    return _score;
  }

  int lines() {
    return _lines;
  }

  @override
  String toString() {
    return _board.toString();
  }
}
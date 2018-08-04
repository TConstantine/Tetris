import 'package:tetris/data/model/board.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/data/model/tetromino_factory.dart';

class Game {
  static final Game _instance = new Game._internal();

  Game._internal();

  factory Game() {
    return _instance;
  }

  bool _isPaused;
  Board _board;
  bool _hasFalling;
  Tetromino _fallingTetromino;
  bool _hasHolding;
  bool _hasNext;
  Tetromino _nextTetromino;
  int _level;
  int _score = 0;
  int _lines = 0;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
    _hasFalling = false;
    _hasHolding = false;
    _nextTetromino = TetrominoFactory.tetromino();
    _hasNext = true;
    _level = 0;
    _score = 0;
    _lines = 0;
  }

  void resume() {
    _isPaused = false;
    _fallingTetromino = _nextTetromino;
    _hasFalling = true;
    _nextTetromino = TetrominoFactory.tetromino();
  }

  bool isPaused() {
    return _isPaused;
  }

  Board board() {
    return _board;
  }

  bool hasFallingTetromino() {
    return _hasFalling;
  }

  Tetromino fallingTetromino() {
    return _fallingTetromino;
  }

  bool hasHoldingTetromino() {
    return _hasHolding;
  }

  bool hasNextTetromino() {
    return _hasNext;
  }

  Tetromino nextTetromino() {
    return _nextTetromino;
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
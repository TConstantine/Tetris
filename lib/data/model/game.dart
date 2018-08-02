import 'package:flutter/material.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class Game {
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
    _nextTetromino = Tetromino.T;
    _hasNext = true;
    _level = 0;
    _score = 0;
    _lines = 0;
  }

  void resume() {
    _isPaused = false;
    _fallingTetromino = _nextTetromino;
    _hasFalling = true;
    _nextTetromino = Tetromino.T;
  }

  bool isPaused() {
    return _isPaused;
  }

  bool hasFallingTetromino() {
    return _hasFalling;
  }

  List<List<BlockViewModel>> fallingTetromino() {
    return [
      [
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red)
      ],
      [
        BlockViewModel(true, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(true, Colors.red)
      ]
    ];
  }

  bool hasHoldingTetromino() {
    return _hasHolding;
  }

  bool hasNextTetromino() {
    return _hasNext;
  }

  List<List<BlockViewModel>> nextTetromino() {
    return [
      [
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red)
      ],
      [
        BlockViewModel(true, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(true, Colors.red)
      ]
    ];
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
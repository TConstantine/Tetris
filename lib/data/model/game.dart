import 'package:tetris/data/model/board.dart';

class Game {
  bool _isPaused;
  Board _board;

  void start() {
    _isPaused = true;
    _board = Board(20, 10);
  }

  bool isPaused() {
    return _isPaused;
  }

  @override
  String toString() {
    return _board.toString();
  }
}
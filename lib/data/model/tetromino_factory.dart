import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/data/model/tetromino_type.dart';
import 'package:tetris/di/injector.dart';

class TetrominoFactory {
  static Tetromino tetromino() {
    return Tetromino(TetrominoType.T, Injector().stringMatcher());
  }
}
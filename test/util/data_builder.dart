import 'package:flutter/material.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/data/model/string_matcher.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/data/model/tetromino_type.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class DataBuilder {
  static DrawableGrid drawableGrid() {
    return DrawableGrid([
      [Colors.purple, Colors.transparent],
      [Colors.transparent, Colors.purple],
    ]);
  }

  static Board board() {
    return Board(20, 10);
  }

  static String emptyBoard() {
    final stringBuffer = StringBuffer();
    for (int row = 0; row < board().rows(); row++) {
      for (int column = 0; column < board().columns(); column++) {
        stringBuffer.write(' ');
      }
      stringBuffer.writeln();
    }
    return stringBuffer.toString();
  }

  static TetrominoType tetrominoType() {
    return TetrominoType.T;
  }

  static Tetromino tetromino() {
    return Tetromino(tetrominoType(), StringMatcher());
  }
}
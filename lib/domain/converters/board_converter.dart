import 'package:flutter/material.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class BoardConverter {
  DrawableGrid convertToViewModel(Board board) {
    final List<List<Color>> blocks = List<List<Color>>(board.rows());
    for (int row = 0; row < board.rows(); row++) {
      blocks[row] = List<Color>(board.columns());
      for (int column = 0; column < board.columns(); column++) {
        final bool isEmpty = board.isEmptyAt(row, column);
        if (isEmpty) {
          blocks[row][column] = Colors.transparent;
        }
        else {
          blocks[row][column] = Colors.black;
        }
      }
    }
    return DrawableGrid(blocks);
  }
}
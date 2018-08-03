import 'package:flutter/material.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class TetrominoConverter {
  DrawableGrid convertToViewModel(Tetromino tetromino) {
    final List<List<Color>> viewModelBlocks = List<List<Color>>(tetromino.rows());
    for (int row = 0; row < tetromino.rows(); row++) {
      viewModelBlocks[row] = List<Color>(tetromino.columns());
      for (int column = 0; column < tetromino.columns(); column++) {
        final bool isEmpty = tetromino.isEmptyAt(row, column);
        if (isEmpty) {
          viewModelBlocks[row][column] = Colors.transparent;
        }
        else {
          final String value = tetromino.valueAt(row, column);
          if (value == 'T') {
            viewModelBlocks[row][column] = Colors.purple;
          }
        }
      }
    }
    return DrawableGrid(viewModelBlocks);
  }
}
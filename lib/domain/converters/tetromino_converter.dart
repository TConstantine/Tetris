import 'package:flutter/material.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/ui/model/grid_view_model.dart';

class TetrominoConverter {
  GridViewModel convertToViewModel(Tetromino tetromino) {
    final List<List<Color>> viewModelBlocks = List<List<Color>>(tetromino.rows());
    for (int row = 0; row < tetromino.rows(); row++) {
      viewModelBlocks[row] = List<Color>(tetromino.columns());
      for (int column = 0; column < tetromino.columns(); column++) {
        final bool isEmpty = tetromino.isEmptyAt(row, column);
        if (isEmpty) {
          viewModelBlocks[row][column] = Colors.transparent;
        }
        else {
          viewModelBlocks[row][column] = Colors.purple;
        }
      }
    }
    return GridViewModel(viewModelBlocks);
  }
}
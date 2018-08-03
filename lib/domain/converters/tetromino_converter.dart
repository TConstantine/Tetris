import 'package:flutter/material.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/ui/model/block_view_model.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

class TetrominoConverter {
  TetrominoViewModel convertToViewModel(Tetromino tetromino) {
    final List<List<BlockViewModel>> viewModelBlocks = List<List<BlockViewModel>>(tetromino.rows());
    for (int row = 0; row < tetromino.rows(); row++) {
      viewModelBlocks[row] = List<BlockViewModel>(tetromino.columns());
      for (int column = 0; column < tetromino.columns(); column++) {
        final bool isEmpty = tetromino.isEmptyAt(row, column);
        if (isEmpty) {
          viewModelBlocks[row][column] = BlockViewModel(isEmpty, Colors.white);
        }
        else {
          final String value = tetromino.valueAt(row, column);
          if (value == 'T') {
            viewModelBlocks[row][column] = BlockViewModel(isEmpty, Colors.purple);
          }
        }
      }
    }
    return TetrominoViewModel(viewModelBlocks);
  }
}
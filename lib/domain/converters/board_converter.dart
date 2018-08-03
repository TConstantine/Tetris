import 'package:flutter/material.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/ui/model/block_view_model.dart';
import 'package:tetris/ui/model/board_view_model.dart';

class BoardConverter {
  BoardViewModel convertToViewModel(Board board) {
    final List<List<BlockViewModel>> blocks = List<List<BlockViewModel>>(board.rows());
    for (int row = 0; row < board.rows(); row++) {
      blocks[row] = List<BlockViewModel>(board.columns());
      for (int column = 0; column < board.columns(); column++) {
        final bool isEmpty = board.isEmptyAt(row, column);
        if (isEmpty) {
          blocks[row][column] = BlockViewModel(board.isEmptyAt(row, column), Colors.white);
        }
        else {
          blocks[row][column] = BlockViewModel(board.isEmptyAt(row, column), Colors.red);
        }
      }
    }
    return BoardViewModel(blocks);
  }
}
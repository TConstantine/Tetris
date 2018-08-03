import 'dart:ui';

import 'package:tetris/ui/model/block_view_model.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class BoardViewModel implements DrawableGrid {
  final List<List<BlockViewModel>> _blocks;

  BoardViewModel(this._blocks);

  @override
  int rows() {
    return _blocks.length;
  }

  @override
  int columns() {
    return _blocks[0].length;
  }

  @override
  bool isEmptyAt(int row, int column) {
    return _blocks[row][column].isEmpty();
  }

  @override
  Color colorAt(int row, int column) {
    return _blocks[row][column].color();
  }
}
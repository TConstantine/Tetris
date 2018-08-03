import 'package:flutter/material.dart';
import 'package:tetris/ui/model/block_view_model.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class TetrominoViewModel implements DrawableGrid {
  final List<List<BlockViewModel>> _shape;

  TetrominoViewModel(this._shape);

  @override
  int rows() => _shape.length;

  @override
  int columns() => _shape[0].length;

  @override
  bool isEmptyAt(int row, int column) => _shape[row][column].isEmpty();

  @override
  Color colorAt(int row, int column) => _shape[row][column].color();
}